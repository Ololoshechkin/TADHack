import googlemaps
from googlemaps.distance_matrix import distance_matrix

# pip3 install tox

GOOGLE_API_KEY = 'AIzaSyC4jSZqis47UqaA4Uahfxh8QwnKSJi0vhc'


class GMap:
    def __init__(self, api_key):
        self.api_key = api_key
        self.gmaps = googlemaps.Client(key=api_key)

    def get_duration(self, first_point, second_point):
        """
        get two point
        return time from goolge maps api
        """
        request = distance_matrix(self.gmaps, first_point, second_point,
                                  transit_mode='transit',
                                  language='english', )
        elements = request['rows'][0]['elements'][0]
        if elements['status'] != 'OK':
            return None
        duration = elements['duration']['value']
        return duration


if __name__ == '__main__':
    gmap = GMap(GOOGLE_API_KEY)
    assert gmap.get_duration('new york', 'chicago') == 44268
    print(gmap.get_duration((59.974597, 30.336504), (59.964200, 30.357014)))
