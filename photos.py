from pprint import pformat, pprint
import os
import flickrapi
import json
from model import *


def get_photos(cityname, tag):
  '''obtain secret key and token from environment variable'''
  api_key = os.environ.get('FLICKR_KEY')
  api_secret = os.environ.get('FLICKR_SECRET')

  '''creating flickr object from flickrapi library using secrety key and token'''
  flickr = flickrapi.FlickrAPI(api_key, api_secret)
  city = cityname.title()
  '''obtain lon and lat info for city from the database'''
  lon = City.query.get(city).lon
  lat = City.query.get(city).lat

  '''calling flickr api function'''
  photos = flickr.photos.search(tags=tag,
                                sort='interestingness-desc',
                                accuracy='11', has_geo='1', lat=lat, lon=lon,
                                per_page='10', format='json')

  '''parse json data that was returned from the api call'''
  data = json.loads(photos)
  details = data['photos']['photo']
  lat = data['photos']['location']['longitude']
  lon = data['photos']['location']['longitutde']

  '''creating empty string to store urls from api call'''
  urls = ''

  '''extracting url information from each photo in the results'''
  for item in range(len(details)):
    photo_id = details[item]['id']
    user = details[item]['owner']
    flickr_url = 'https://www.flickr.com/photos/{}/{}/'.format(user, photo_id)

    farm = details[item]['farm']
    server = details[item]['server']
    secret = details[item]['secret']
    source_url = 'https://c2.staticflickr.com/{}/{}/{}_{}.jpg'.format(
        farm, server, photo_id, secret)
    urls += f'{source_url}|'

    print(urls)
