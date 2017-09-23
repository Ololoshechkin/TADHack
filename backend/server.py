# coding=utf-8
from flask import Flask, request
from flask_restful import Resource, Api
from sqlalchemy import create_engine
from json import dumps, loads
import json
import server_actions
import user
import random
import string


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
            if login in self._tokens:
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
                        parsed['position']
                    )
                elif function_name == 'update_user_info':
                    return self._actions.update_user_info(
                        login,
                        Server._get_user_from_json(parsed['user'])
                    )
                elif function_name == 'update_targets':
                    return self._actions.update_targets(
                        login,
                        parsed['targets']
                    )
        except IndexError:
            return SPECIAL_ANSWER
        return SPECIAL_ANSWER


def start_server():
    app = Flask(__name__)
    api = Api(app)
    api.add_resource(Server, '/<string:function_name>/<args>')
    app.run()


if __name__ == '__main__':
    server = Server()


    def TestNewUser():
        rets = []
        rets += [
            server.get('new_user', dumps({
                "login": 'josdas',
                "password": '1234',
                "user": {
                    "name": "Stas",
                    "sex": "m",
                    "age": 1998,
                    "login": "josdas",
                    "person_info": {}
                }
            }))
        ]
        rets += [
            server.get('new_user', dumps({
                "login": 'josdas',
                "password": '1111',
                "user": {
                    "name": "Stas",
                    "sex": "m",
                    "age": 1998,
                    "login": "josdas",
                    "person_info": {}
                }
            }))
        ]
        rets += [
            server.get('new_user', dumps({
                "login": 'wafemand',
                "password": '1111',
                "user": {
                    "name": "Andrey",
                    "sex": "m",
                    "age": 1999,
                    "login": "wafemand",
                    "person_info": {}
                }
            }))
        ]
        rets += [
            server.__get_user_from_json({
                "name": "Andrey",
                "sex": "m",
                "age": 1999,
                "login": "wafemand",
                "person_info": {}
            })
        ]
        rets += [
            server.__get_user_from_json({
                "name": "1",
                "sex": "m",
                "age": 'aaa',
                "login": "1",
                "person_info": {}
            })
        ]
        rets += [
            server.get('new_user', dumps({
                "login": 'yury',
                "password": 'LoveVika1998',
                "user": {
                    "name": "Yury",
                    "sex": "m",
                    "age": 1998,
                    "login": "yury",
                    "person_info": {}
                }
            }))
        ]
        rets += [
            server._get_new_token('wafemand', '1111')
        ]
        print(*rets, sep = '\n')



        TestNewUser()
        # start_server()
