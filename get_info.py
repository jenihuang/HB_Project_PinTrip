from flask import Flask
import os
import flickrapi
import json
from model import *

app = Flask(__name__)

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

    return city


def get_trip_by_user_city(user_id, city_name):

    trip = Trip.query.filter(Trip.user_id == user_id,
                             Trip.city_name == city_name).first()
    return trip


def get_photo_location(img_id):
    '''get lat and lon information for photo'''

    location = {}

    data = flickr.photos.geo.getLocation(photo_id=img_id, format='json')
    results = json.loads(data)

    location['lat'] = float(results['photo']['location']['latitude'])
    location['lon'] = float(results['photo']['location']['longitude'])

    return location


def search_photos_by_city(cityname, tags=''):

    city = cityname.strip()
    city = city.title()

    '''obtain lon and lat info for city from the database'''
    city_object = City.query.get(city)

    city_lon = city_object.lon
    city_lat = city_object.lat

    '''calling flickr api function'''
    photos = flickr.photos.search(tags=tags,
                                  sort='interestingness-desc',
                                  accuracy='9', has_geo='1', lat=city_lat, lon=city_lon,
                                  per_page='100', format='json')

    '''parse json data that was returned from the api call'''
    data = json.loads(photos)

    details = data['photos']['photo']

    '''creating empty list to store photos from api call'''
    photos = []

    '''extracting url information from each photo in the results'''
    for item in range(len(details)):
        img_id = int(details[item]['id'])
        farm = details[item]['farm']
        server = details[item]['server']
        secret = details[item]['secret']
        source_url = 'https://c2.staticflickr.com/{}/{}/{}_{}.jpg'.format(
            farm, server, img_id, secret)
        # # location = get_photo_location(img_id)
        # lat = location.get('lat')
        # lon = location.get('lon')
        lat = 2.0
        lon = 2.0
        photo = Photo(img_id=img_id, url=source_url,
                      lon=lon, lat=lat, city_name=city)
        photos.append(photo)

    return photos


if __name__ == "__main__":

    connect_to_db(app)
