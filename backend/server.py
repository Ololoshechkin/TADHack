# coding=utf-8
from flask import Flask, request
from flask_restful import Resource, Api
from sqlalchemy import create_engine
from json import dumps
import server_actions

e = create_engine('sqlite:///salaries.db')


class DepartmentsMeta(Resource):
    def get(self):
        conn = e.connect()
        query = conn.execute("select distinct DEPARTMENT from salaries")
        return {'departments': [i[0] for i in query.cursor.fetchall()]}


class DepartmentalSalary(Resource):
    def get(self, department_name):
        conn = e.connect()
        query = conn.execute("select * from salaries where Department='%s'" % department_name.upper())
        result = {'data': [dict(zip(tuple(query.keys()), i)) for i in query.cursor]}
        return result


class Server(Resource):
    def __init__(self):
        self.actions = server_actions.Actions()
        self.tokens = {}
        self.logins = {}

    def get_new_token(self, login, password):
        TOKEN_LEN = 32
        if self.actions.storage.is_user(login, password):
            token = ''.join(
                random.SystemRandom().choice(string.ascii_uppercase + string.digits) for _ in range(TOKEN_LEN)
            )
            if login in self.tokens:
                self.tokens.pop(self.logins[login])
                self.logins.pop(login)
            self.logins[login] = token
            self.tokens[token] = login
            return token
        else:
            return None

    def is_correct_token(self, token):
        return token in self.tokens

    def get(self, comand, args):

        if comand == 'new_user':
            pass
        elif comand == 'get_new_token':
            pass
        elif comand == 'find_person_nearby':
            pass
        elif comand == 'update_position':
            pass
        elif comand == 'update_user_info':
            pass
        return "FUCK YOU!"


if __name__ == '__main__':
    app = Flask(__name__)
    api = Api(app)

    api.add_resource(Server, '/<string:comand>/<args>')
    app.run()
