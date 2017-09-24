def sorted_persons(main_person, persons):
    main_ticket = main_person.person_info['targets']
    def relevance(ticket):
        return len(ticket & main_ticket) - \
               len((ticket | main_ticket) - (ticket & main_ticket)) / 1000
    return sorted(persons, key=lambda person: relevance(person.person_info['targets']))
