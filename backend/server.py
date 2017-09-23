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

    @staticmethod
    def get_user_from_json(data):
        return user.User(**data)

    def get(self, function_name, args):
        try:
            parsed = loads(str(args))
        except TypeError:
            return "FUCK YOU!"
        try:
            login = parsed['login']
            if function_name == 'new_user':
                print(parsed)
                return self.actions.new_user(
                    login,
                    parsed['password'],
                    Server.get_user_from_json(parsed['user'])
                )
            elif function_name == 'get_new_token':
                return self.get_new_token(
                    login,
                    parsed['password']
                )
            elif self.logins[login] == parsed['token']:
                if function_name == 'find_person_nearby':
                    return self.actions.find_person_nearby(
                        login,
                        int(parsed['max_duration']),
                        parsed['sex'],
                        int(parsed['min_age']),
                        int(parsed['max_age'])
                    )
                elif function_name == 'update_position':
                    return self.actions.update_position(
                        login,
                        parsed['position']
                    )
                elif function_name == 'update_user_info':
                    return self.actions.update_user_info(
                        login,
                        Server.get_user_from_json(parsed['user'])
                    )
                elif function_name == 'update_targets':
                    return self.actions.update_targets(
                        login,
                        parsed['targets']
                    )
        except IndexError:
            return "FUCK YOU!"
        return "FUCK YOU!"


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
                    "year": 1998,
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
                    "year": 1998,
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
                    "year": 1999,
                    "login": "wafemand",
                    "person_info": {}
                }
            }))
        ]
        print(*rets, sep = '\n')



    TestNewUser()
    #start_server()