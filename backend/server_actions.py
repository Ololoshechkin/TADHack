import user
import distance
import random


class Actions:
    def __init__(self):
        self.storage = user.RecordsStorage() # 'Test001' todo
        self.gmap = distance.GMap(distance.GOOGLE_API_KEY)

    def find_person_nearby(self, position, max_duration):
        result = []
        for login, person in self.storage.users.iteritems():
            if login != main_user.login:
                duration = self.gmap.get_duration(
                    position,
                    person.person_info['position']
                )
                if duration < max_duration:
                    result.append(person)
        return result

    def update_position(self, login, position):
        self.storage.users[login].person_info['position'] = position

    def update_user_info(self, login, person):
        self.storage.update_user(login, person)

    def new_user(self, record, person):
        self.storage.add_user(record, person)

