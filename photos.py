from pprint import pformat, pprint
import os
import flickrapi
import json

import requests
from flask import Flask, render_template, request, flash, redirect, session
# from flask_debugtoolbar import DebugToolbarExtension

app = Flask(__name__)
app.secret_key = "SECRETSECRETSECRET"

# api_key = u'aa1a829bc39c71156b361045742e1f12'
# api_secret = u'124d9970980b9e6b'
api_key = os.environ.get('FLICKR_KEY')
api_secret = os.environ.get('FLICKR_SECRET')

flickr = flickrapi.FlickrAPI(api_key, api_secret)

tag = 'beach'
lat = 37.7749
lon = 122.4194
radius = 50

photos = flickr.photos.search(
    sort='interestingness-desc', tags='sanfrancisco,beach', per_page='9', format='json')

data = json.loads(photos)
details = data['photos']['photo']

urls = []

for item in range(len(details)):
    photo_id = details[item]['id']
    user = details[item]['owner']
    flickr_url = 'https://www.flickr.com/photos/{}/{}/'.format(user, photo_id)

    farm = details[item]['farm']
    server = details[item]['server']
    secret = details[item]['secret']
    source_url = 'https://c2.staticflickr.com/{}/{}/{}_{}.jpg'.format(
        farm, server, photo_id, secret)
    urls.append(source_url)

print(urls)
