from server import Server
import unittest
from json import dumps, loads
from user import *


class Test(unittest.TestCase):

    '''
    def test_new_user(self):
        server = Server()
        self.assertEqual(server.get('new_user', dumps({
            "login": 'josdas',
            "password": '1234',
            "user": {
                "name": "Stas",
                "sex": "m",
                "year": 1998,
                "login": "josdas",
                "person_info": {}
            }
        })), None)
        self.assertEqual(server.get('new_user', dumps({
            "login": 'josdas',
            "password": '1111',
            "user": {
                "name": "Stas",
                "sex": "m",
                "year": 1998,
                "login": "josdas",
                "person_info": {}
            }
        })), "FUCK YOU!")
        self.assertEqual(server.get('new_user', dumps({
            "login": 'wafemand',
            "password": '1111',
            "user": {
                "name": "Andrey",
                "sex": "m",
                "year": 1999,
                "login": "wafemand",
                "person_info": {}
            }
        })), None)
        storage = server.actions.storage
        logins = set()
        for login in storage.data:
            assert login not in logins
            logins.add(login)

    def test_get_new_token(self):
        server = Server()
        token1 = server.get('get_new_token', {
            "login": "login",
            "password": "pass"
        })
        token2 = server.get('get_new_token', {
            "login": "login",
            "password": "pass"
        })
    '''

    def test_RecordStorage(self):
        recordStorage = RecordsStorage()

        user1 = User("kek", "w", "1900", "login", {})
        user2 = User("kek", "w", "1900", "login2", {})
        recordStorage.add_user(Record("login", "password"), user1)
        try:
            recordStorage.add_user(Record("login", "password"), user1)
            self.assertFalse(True)
        except :
            pass
        recordStorage.add_user(Record("login2", "password"), user2)

        self.assertEqual(recordStorage.get_user("login"), user1)
        self.assertEqual(recordStorage.get_user("login2"), user2)

        self.assertTrue(recordStorage.is_user("login", "password"))
        self.assertFalse(recordStorage.is_user("login", "pass"))

        file_name = "kek"
        recordStorage.save(file_name)
        recordStorage = RecordsStorage(file_name)
        try:
            recordStorage.add_user(Record("login", "password"), user1)
            self.assertFalse(True)
        except :
            pass

        self.assertTrue(recordStorage.get_user("login") == user1)
        self.assertTrue(recordStorage.get_user("login2") == user2)

        self.assertTrue(recordStorage.is_user("login", "password"))
        self.assertFalse(recordStorage.is_user("login", "pass"))

        newUser = User("kek", "w", "1901", "login", {})
        recordStorage.update_user("login", newUser)
        self.assertTrue(recordStorage.get_user("login") == newUser)
        self.assertFalse(recordStorage.get_user("login") == user1)




if __name__ == '__main__':
    unittest.main()