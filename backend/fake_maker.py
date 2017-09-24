from server import *

if __name__ == "__main__":
    server = Server()

    server.get('new_user', dumps({
        "login": 'josdas',
        "password": '1234',
        "user": {
            "name": "Stas",
            "sex": "m",
            "age": 18,
            "login": "josdas",
            "person_info": {"interests": "backend, backend, backend and more backend"}
        }
    }))

    server.get('update_position', dumps(
        {"token": server._get_new_token('josdas', '1234'), "position": [59.974510, 30.337021]}
    ))

    server.get('update_targets', dumps(
        {"token": server._get_new_token('josdas', '1234'), "targets": ["Write backend", "Go to hackaton", "Do a BJD lab"]}
    ))

    server.get('new_user', dumps({
        "login": 'Ololoshechkin',
        "password": '1111',
        "user": {
            "name": "Vadim",
            "sex": "m",
            "age": 19,
            "login": "Ololoshechkin",
            "person_info": {"interests": "Kotlin delelopment"}
        }
    }))

    server.get('update_position', dumps(
        {"token": server._get_new_token('Ololoshechkin', '1111'), "position": [60.001488, 30.347021]}
    ))

    server.get('update_targets', dumps(
        {"token": server._get_new_token('Ololoshechkin', '1111'), "targets": ["Discuss Kotlin", "Go to hackaton"]}
    ))

    server.get('new_user', dumps({
        "login": 'Yura',
        "password": 'LoveVika1998',
        "user": {
            "name": "Yury",
            "sex": "m",
            "age": 19,
            "login": "Yura",
            "person_info": {"interests": "qwerty"}
        }
    }))

    server.get('update_position', dumps(
        {"token": server._get_new_token('Yura', 'LoveVika1998'), "position": [59.874510, 30.336021]}
    ))

    server.get('update_targets', dumps(
        {"token": server._get_new_token('Yura', 'LoveVika1998'), "targets": ["Do a BJD lab", "Go to hackaton", "Crush somebody/s face"]}
    ))

    server.get('new_user', dumps({
        "login": 'Alina',
        "password": '1111',
        "user": {
            "name": "Alina",
            "sex": "f",
            "age": 19,
            "login": "Alina",
            "person_info": {"interests": "Work in google"}
        }
    }))

    server.get('update_position', dumps(
        {"token": server._get_new_token('Alina', '1111'), "position": [100.874510, 130.336021]}
    ))

    server.get('update_targets', dumps(
        {"token": server._get_new_token('Alina', '1111'),
         "targets": ["Work in google", "Go to hackaton"]}
    ))

    server.get('new_user', dumps({
        "login": 'Lev',
        "password": '1111',
        "user": {
            "name": "Lev",
            "sex": "m",
            "age": 19,
            "login": "Lev",
            "person_info": {"interests": "Drink & program"}
        }
    }))

    server.get('update_position', dumps(
        {"token": server._get_new_token('Lev', '1111'), "position": [58.974510, 31.001488]}
    ))

    server.get('update_targets', dumps(
        {"token": server._get_new_token('Lev', '1111'),
         "targets": ["Go to hackaton", "Watch videos", "Drink", "Go to bar"]}
    ))

    server.get('new_user', dumps({
        "login": 'KokorinIlya',
        "password": 'LoveRNG1721',
        "user": {
            "name": "Ilya",
            "sex": "m",
            "age": 19,
            "login": "KokorinIlya",
            "person_info": {"interests": "SIP, programming"}
        }
    }))

    server.get('update_position', dumps(
        {"token": server._get_new_token('KokorinIlya', 'LoveRNG721'), "position": [59.871510, 28.001488]}
    ))

    server.get('update_targets', dumps(
        {"token": server._get_new_token('KokorinIlya', 'LoveRNG1721'),
         "targets": ["Go to hackaton", "Build RNG", "Drink", "Go to bar", "Discuss functional programming", "Hate OOP"]}
    ))