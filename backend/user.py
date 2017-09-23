import pickle


class Record:
    def __init__(self, login, password):  # todo crypto
        self.login = login
        self.password = password


class Records:
    def __init__(self, file_name=None):
        if file_name is None:
            self.data = {}
            self.users = {}
        else:
            with open(file_name + "_password", 'rb') as file:
                self.data = pickle.load(file=file)
            with open(file_name + "_users", 'rb') as file:
                self.users = pickle.load(file=file)

    def get_user(self, login, password):
        if self.data[login] != password:  # todo too bad
            return None
        return self.users[login]

    def add_user(self, record, user):
        if record.login in self.data:
            raise IndexError("There are two users with the same login")
        self.data

class User:
    def __init__(self, name, sex, year, person_info):
        self.name = name
        self.sex = sex
        self.year = year
        self.person_info = person_info

    def __str__(self):
        return self.name + " " + self.sex + " " + self.year
