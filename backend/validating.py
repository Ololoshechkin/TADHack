import datetime
import re

current_date = datetime.datetime.now()

def validate_login(login):
    has_letter = False
    if not login:
        return False
    if login.isdigit():
        return False
    for name_character in login:
        if not re.match('[a-zA-Z._0-9-]', name_character):
            return False
        if re.match('[a-zA-Z]', name_character):
            has_letter = True
    return has_letter

def validate_year(year):
    if not year:
        return False
    if not year.isdigit():
        return False
    year_digit = int(year)
    return 1900 <= year_digit <= current_date.year

def validate_name(name):
    has_letter = False
    if not name:
        return False
    if name.isdigit():
        return False
    for name_character in name:
        if not (name_character.isalnum() or name_character == '-' or name_character == '_' or name_character == '.' or name_character == ' '):
            return False
        if name_character.isalpha():
            has_letter = True
    return has_letter


