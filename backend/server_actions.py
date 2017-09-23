import user
import distance
import random
import ticketList


class Actions:
    def __init__(self):
        self.storage = user.RecordsStorage()  # 'Test001' todo
        self.gmap = distance.GMap(distance.GOOGLE_API_KEY)

    def find_person_nearby(self, main_login, max_duration, sex, min_age, max_age):
        main_user = self.storage.users[main_login]
        result = ticketList.TicketList(
            main_user.person_info['targets']
        )
        for login, person in self.storage.users.iteritems():
            if login != main_login:
                if main_user.sex in sex and min_age <= main_user.age <= max_age:
                    duration = self.gmap.get_duration(
                        position,
                        person.person_info['position']
                    )
                    if duration < max_duration:
                        result.addTicket(person.person_info['targets'])
        result.sort()
        return result.tickets

    def update_position(self, login, position):
        self.storage.users[login].person_info['position'] = position

    def update_targets(self, login, targets):
        self.storage.users[login].person_info['targets'] = targets

    def update_user_info(self, login, person):
        self.storage.update_user(login, person)

    def new_user(self, login, password, person):
        self.storage.add_user(user.Record(login, password), person)
