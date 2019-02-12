from pprint import pformat, pprint
import os
import flickrapi
import json
from model import *

'''obtian secret key and token from environment variable'''
api_key = os.environ.get('FLICKR_KEY')
api_secret = os.environ.get('FLICKR_SECRET')

'''creating flickr object from flickrapi library using secrety key and token'''
flickr = flickrapi.FlickrAPI(api_key, api_secret)


def cityname_is_valid(cityname):
    '''returns True if the city is in the database, false otherwise'''
    city_remove_whitespace = cityname.strip()
    city_title_case = city_remove_whitespace.title()
    city = City.query.get(city_title_case)

    return (if city)


# def get_user_trips(user_id):
#     '''returns a list of trips given a user_id'''
#     user = User.get_user_by_id(user_id)
#     return user.trips


def get_trip_photos(trip_id):
    '''returns a list of photos given a trip_id'''
    trip = Trip.get_trip(trip_id)
    return trip.photos


def search_photos_by_city(cityname, tag):

    city = cityname.strip().title()

    '''obtain lon and lat info for city from the database'''
    city_lon = City.query.get(city).lon
    city_lat = City.query.get(city).lat

    '''calling flickr api function'''
    photos = flickr.photos.search(tags=tag,
                                  sort='interestingness-desc',
                                  accuracy='11', has_geo='1', lat=city_lat, lon=city_lon,
                                  per_page='10', format='json')

    '''parse json data that was returned from the api call'''
    data = json.loads(photos)
    details = data['photos']['photo']

    lat = data['photos']['location']['latitude']
    lon = data['photos']['location']['longitude']

    '''creating empty string to store urls from api call'''
    urls = ''

    '''extracting url information from each photo in the results'''
    for item in range(len(details)):
        img_id = details[item]['id']
        # user = details[item]['owner']
        # flickr_url = 'https://www.flickr.com/photos/{}/{}/'.format(
        #     user, img_id)
        farm = details[item]['farm']
        server = details[item]['server']
        secret = details[item]['secret']
        source_url = 'https://c2.staticflickr.com/{}/{}/{}_{}.jpg'.format(
            farm, server, img_id, secret)
        urls += f'{source_url}|'

    print(urls)
