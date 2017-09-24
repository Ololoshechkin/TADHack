# coding=utf-8
import os
from flask import Flask, request, redirect, url_for
from flask_restful import Resource, Api
from sqlalchemy import create_engine
from json import dumps, loads
from werkzeug.utils import secure_filename
import json
import server_actions
import user
import random
import string

UPLOAD_FOLDER = '/tmp'
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])


class Server(Resource):
    """
    Special class for flask
    """

    def __init__(self):
        self._actions = server_actions.Actions()
        self._tokens = {}
        self._logins = {}

    def _get_new_token(self, login, password):
        TOKEN_LEN = 32
        if self._actions.storage.is_user(login, password):
            token = ''.join(
                random.SystemRandom().choice(string.ascii_uppercase + string.digits) for _ in range(TOKEN_LEN)
            )
            if login in self._logins:
                self._tokens.pop(self._logins[login])
                self._logins.pop(login)
            self._logins[login] = token
            self._tokens[token] = login
            return token
        else:
            return None

    def _is_correct_token(self, token):
        return token in self._tokens

    @staticmethod
    def _get_user_from_json(data):
        return user.User(**data)

    def get(self, function_name, args):
        SPECIAL_ANSWER = 'FUCK YOU!'
        try:
            parsed = loads(str(args))
        except TypeError:
            return SPECIAL_ANSWER
        try:
            if function_name == 'new_user':
                login = parsed['login']
                return self._actions.new_user(
                    login,
                    parsed['password'],
                    Server._get_user_from_json(parsed['user'])
                )
            elif function_name == 'get_new_token':
                login = parsed['login']
                return self._get_new_token(
                    login,
                    parsed['password']
                )
            elif self._is_correct_token(parsed['token']):
                login = self._tokens[parsed['token']]
                if function_name == 'find_person_nearby':
                    return self._actions.find_person_nearby(
                        login,
                        int(parsed['max_duration']),
                        parsed['sex'],
                        int(parsed['min_age']),
                        int(parsed['max_age'])
                    )
                elif function_name == 'update_position':
                    return self._actions.update_position(
                        login,
                        tuple(parsed['position'])
                    )
                elif function_name == 'update_user_info':
                    return self._actions.update_user_info(
                        login,
                        Server._get_user_from_json(parsed['user'])
                    )
                elif function_name == 'update_targets':
                    return self._actions.update_targets(
                        login,
                        set(parsed['targets'])
                    )
        except IndexError:
            return SPECIAL_ANSWER
        return SPECIAL_ANSWER


def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


def start_server():
    app = Flask(__name__, static_url_path='/image', static_folder='tmp')
    api = Api(app)
    api.add_resource(Server, '/<string:function_name>/<args>')

    @app.route('/', methods=['GET', 'POST'])
    def upload_file():
        if request.method == 'POST':
            # check if the post request has the file part
            if 'file' not in request.files:
                flash('No file part')
                return redirect(request.url)
            file = request.files['file']
            # if user does not select file, browser also
            # submit a empty part without filename
            if file.filename == '':
                flash('No selected file')
                return redirect(request.url)
            if file and allowed_file(file.filename):
                filename = secure_filename(file.filename)
                file.save(os.path.join(os.getcwd() + UPLOAD_FOLDER, filename))
                return redirect(url_for('uploaded_file',
                                        filename=filename))
        return '''
        <!doctype html>
        <title>Upload new File</title>
        <h1>Upload new File</h1>
        <form method=post enctype=multipart/form-data>
          <p><input type=file name=file>
             <input type=submit value=Upload>
        </form>
        '''

    app.run()


if __name__ == '__main__':
    start_server()
