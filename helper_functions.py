import re
import string
import os
import flickrapi
import json
# from collections import OrderedDict
from flask import Flask
from model import *

app = Flask(__name__)

###############################################################################

'''LOGIN/SIGN UP HELPER FUNCTIONS'''


def email_isvalid(email):
    '''checks if input email is a valid email format'''
    if not re.match(r"^[A-Za-z0-9\.\+_-]+@[A-Za-z0-9\._-]+\.[a-zA-Z]*$",
                    email):
        return False
    else:
        return True


def password_isvalid(password):
    '''checks if password contains at least 1 of uppercase letter, lowercase
    letter, integer, and is at least 6 characters long.'''

    numFlag = False
    lowFlag = False
    upFlag = False

    if len(password) < 6:
        return False
    for i in password:
        if i in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']:
            numFlag = True
        if i in list(string.ascii_uppercase):
            upFlag = True
        if i in list(string.ascii_lowercase):
            lowFlag = True
    if numFlag and lowFlag and upFlag:
        return True
    else:
        return False


###############################################################################

'''DATABASE HELPER FUNCTIONS'''


def cityname_is_valid(cityname):
    '''returns True if the city is in the database, false otherwise'''
    city_remove_whitespace = cityname.strip()
    city_title_case = city_remove_whitespace.title()
    city = City.query.get(city_title_case)

    return city


def get_trip_by_user_city(user_id, city_name):
    '''given a user and cityname,
    return true if user has a board false otherwise'''

    trip = Trip.query.filter(Trip.user_id == user_id,
                             Trip.city_name == city_name).first()
    return trip


###############################################################################

'''API HELPER FUNCTIONS'''

# obtain secret key and token from environment variable
api_key = os.environ.get('FLICKR_KEY')
api_secret = os.environ.get('FLICKR_SECRET')

# creating flickr object from flickrapi library using secrety key and token
flickr = flickrapi.FlickrAPI(api_key, api_secret)


def get_photo_location(img_id):
    '''get lat and lon information for photo'''

    location = {}

    data = flickr.photos.geo.getLocation(photo_id=img_id, format='json')
    results = json.loads(data)

    if results.get('stat') == 'fail':
        return False

    location['lat'] = float(results['photo']['location']['latitude'])
    location['lon'] = float(results['photo']['location']['longitude'])

    return location


def search_photos_by_city(cityname, tag=''):
    '''given a city and tag, return a dictionary of
    photo objects from cache or API call'''

    # change directory to cache folder to save items easily
    os.chdir('/home/vagrant/src/PinTrip/cache')

    # convert user input city to correct format to match database
    city = cityname.strip()
    city = city.title()

    # obtain lon and lat info for city from the database
    city_object = City.query.get(city)
    city_lon = city_object.lon
    city_lat = city_object.lat

    # create filename as city and tag
    filename = '{}{}.json'.format(city, tag)
    # set filepath to the cached file
    filepath = '/cache/{}'.format(filename)

    # check if file exists in the cache already
    if os.path.isfile(filename):
        # read out data from the file
        with open(filename) as json_file:
            data = json.load(json_file)

        # convert data out of json format to be used in server
        photo_results = json.loads(data)

    # if file is not cached, call the flickr API and add results to the cache
    else:
        # calling flickr api function
        data = flickr.photos.search(tags=tag,
                                    sort='interestingness-desc',
                                    accuracy='10', has_geo='1', lat=city_lat,
                                    lon=city_lon, per_page='100', format='json')
        # convert data out of json format
        results = json.loads(data)

        # if the API call failed, return None
        if results.get('stat') == 'fail':
            return None

        # obtain json data of all photo objects from function call
        photos_json = convert_photo_data(results, city)

        # save the results to filename in cache folder
        with open(filename, 'w') as outfile:
            json.dump(photos_json, outfile)

        # convert data out of json format to be used in server
        photo_results = json.loads(photos_json)

    # returns a dictionary of photo object results
    return photo_results


def convert_photo_data(results, city):
    '''given json results from API requests,
    return json of all photo objects'''

    details = results['photos']['photo']

    # creating empty dictionary to store photos from api call
    photos = {}

    # extracting url information from each photo in the results'''
    for item in range(len(details)):
        img_id = int(details[item]['id'])
        farm = details[item]['farm']
        server = details[item]['server']
        secret = details[item]['secret']
        source_url = 'https://c2.staticflickr.com/{}/{}/{}_{}.jpg'.format(
            farm, server, img_id, secret)
        location = get_photo_location(img_id)
        lat = location.get('lat')
        lon = location.get('lon')

        # checks if photo doesn't exist in the database
        if not Photo.get_photo(img_id):

            # create photo object and add to the database
            photo = Photo(img_id=img_id, url=source_url,
                          lon=lon, lat=lat, city_name=city)
            db.session.add(photo)
            db.session.commit()
            print(Photo.get_photo(img_id))

        # get photo object from the database
        obtained_photo = Photo.get_photo(img_id)

        # convert ORM object to dictionary
        photo_dict = obtained_photo.__dict__

        '''remove this from the dict as this value is an object that
        cannot convert to string easily/not used'''
        del photo_dict['_sa_instance_state']

        # make the img_id the key for the photo in the dictionary
        key = photo_dict['img_id']

        # add key and value to photos dictionary only if not empty
        if bool(photo_dict):
            photos[key] = photo_dict
            print('added {}, {}'.format(key, photo_dict))

    # convert photos dictionary to json and return
    return json.dumps(photos)


if __name__ == "__main__":  # pragma: no cover
    connect_to_db(app)
