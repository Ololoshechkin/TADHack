from server import *

if __name__ == "__main__":
    server = Server()

    server.get('new_user', dumps({
        "login": 'josdas',
        "password": '1234',
        "user": {
            "name": "Stas",
            "sex": "male",
            "age": 18,
            "login": "josdas",
            "person_info": {"interests": "Backend developer, ITMO student, pen spinner, ACM participant, I like going for a walk and talk to intresting people"}
        }
    }))

    server.get('update_position', dumps(
        {"token": server._get_new_token('josdas', '1234'), "position": [59.974492, 30.337049]}
    ))

    server.get('update_targets', dumps(
        {"token": server._get_new_token('josdas', '1234'), "targets": ["walking", "bike", "pubs", "visiting showplaces", "music", "cinema"]}
    ))

    server.get('new_user', dumps({
        "login": 'Ololoshechkin',
        "password": '1111',
        "user": {
            "name": "Vadim",
            "sex": "male",
            "age": 19,
            "login": "Ololoshechkin",
            "person_info": {"interests": "Kotlin deleloper, frontend developer, love going to bars to watch football"}
        }
    }))

    server.get('update_position', dumps(
        {"token": server._get_new_token('Ololoshechkin', '1111'), "position": [60.001488, 30.347021]}
    ))

    server.get('update_targets', dumps(
        {"token": server._get_new_token('Ololoshechkin', '1111'), "targets": ["walking", "music"]}
    ))

    server.get('new_user', dumps({
        "login": 'Yura',
        "password": 'LoveVika1998',
        "user": {
            "name": "Yury",
            "sex": "male",
            "age": 19,
            "login": "Yura",
            "person_info": {"interests": "Talk to me and know"}
        }
    }))

    server.get('update_position', dumps(
        {"token": server._get_new_token('Yura', 'LoveVika1998'), "position": [59.874510, 30.336021]}
    ))

    server.get('update_targets', dumps(
        {"token": server._get_new_token('Yura', 'LoveVika1998'), "targets": ["museums", "theaters", "sport"]}
    ))

    server.get('new_user', dumps({
        "login": 'Zaharych',
        "password": '1111',
        "user": {
            "name": "Andrey",
            "sex": "male",
            "age": 19,
            "login": "Zaharych",
            "person_info": {"interests": "Working with matrix, walking"}
        }
    }))

    server.get('update_position', dumps(
        {"token": server._get_new_token('Zaharych', '1111'), "position": [59.927608, 31.018492]}
    ))

    server.get('update_targets', dumps(
        {"token": server._get_new_token('Zaharych', '1111'),
         "targets": ["visiting showplaces", "walking"]}
    ))

    server.get('new_user', dumps({
        "login": 'Lev',
        "password": '1111',
        "user": {
            "name": "Lev",
            "sex": "male",
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
         "targets": ["pubs", "cinema", "walking"]}
    ))

    server.get('new_user', dumps({
        "login": 'KokorinIlya',
        "password": 'LoveRNG1721',
        "user": {
            "name": "Ilya",
            "sex": "male",
            "age": 19,
            "login": "KokorinIlya",
            "person_info": {"interests": "SIP reader, RNG builder, programmer, ITMO student"}
        }
    }))

    server.get('update_position', dumps(
        {"token": server._get_new_token('KokorinIlya', 'LoveRNG721'), "position": [59.9793171, 30.3363184]}
    ))

    server.get('update_targets', dumps(
        {"token": server._get_new_token('KokorinIlya', 'LoveRNG1721'),
         "targets": ["walking", "pubs", "cinema", "music", "sport", "bike"]}
    ))

    print(server._get_new_token('josdas', '1234'))
    print(server._get_new_token('Ololoshechkin', '1111'))
    print(server._get_new_token('Yura', 'LoveVika1998'))
    print(server._get_new_token('Zaharych', '1111'))
    print(server._get_new_token('Lev', '1111'))
    print(server._get_new_token('KokorinIlya', 'LoveRNG1721'))