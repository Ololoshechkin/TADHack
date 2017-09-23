from server import *
import unittest
from json import *

class TUI_PIDOR(unittest.TestCase):

    def test_NewUser(self):
        server = Server()
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
            server.get_new_token('josdas', '1234')
        ]
        rets += [
            server.get_new_token('josdas', '1234')
        ]
        print(*rets, sep='\n')
        print(rets[-2])
        print(server.is_correct_token(rets[-2]))


if __name__ == '__main__':
    unittest.main()