import pickle

SAVE_NAME = "tmp/TEST_DB_001"


class Record:
    def __init__(self, login, password):
        self.login = login
        self.password = password


class RecordsStorage:
    def __init__(self, file_name=None):
        if file_name is None:
            self.data = {}
            self.users = {}
        else:
            with open(file_name + "_passwords", 'rb') as file:
                self.data = pickle.load(file=file)
            with open(file_name + "_users", 'rb') as file:
                self.users = pickle.load(file=file)

    def is_user(self, login, password):
        return login in self.data and self.data[login] == password

    def get_user(self, login):
        return self.users[login]

    def update_user(self, login, person):
        self.users[login] = person

    def add_user(self, record, user):
        if record.login in self.data:
            raise IndexError("There are two users with the same login")
        self.data[record.login] = record.password
        self.users[record.login] = user

    def save(self, name):
        with open(name + "_passwords", 'wb') as file:
            pickle.dump(self.data, file=file)
        with open(name + "_users", 'wb') as file:
            pickle.dump(self.users, file=file)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.save(SAVE_NAME)


class User:
    def __init__(self, name, sex, age, login, person_info):
        self.name = name
        self.sex = sex
        self.age = int(age)
        self.login = login
        if 'position' in person_info:
            person_info['position'] = tuple(person_info['position'])
        if 'targets' in person_info:
            person_info['targets'] = set(person_info['targets'])
        self.person_info = person_info

    def to_dick(self):
        return {
            'name': self.name,
            'sex': self.sex,
            'age': self.age,
            'login': self.login,
            'person_info': self.person_info
        }

    def __str__(self):
        return self.name + " " + self.sex + " " + str(self.age)
