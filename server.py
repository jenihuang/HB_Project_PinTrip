from pprint import pformat, pprint
import os
import flickrapi

import requests
from flask import Flask, render_template, request, flash, redirect, session
# from flask_debugtoolbar import DebugToolbarExtension

import users

app = Flask(__name__)
app.secret_key = "SECRETSECRETSECRET"

api_key = os.environ.get('FLICKR_KEY')
api_secret = os.environ.get('FLICKR_SECRET')

flickr = flickrapi.FlickrAPI(api_key, api_secret)

tag = 'beach'
lat = 37.7749
lon = 122.4194
radius = 20

photos = flickr.photos.search(
    tags=tag, sort='interestingness-desc', lat=lat, lon=lon, radius=radius, per_page='9')


@app.route('/', methods=['GET'])
def show_login():
    """shows login form or link to signup page"""

    return render_template('index.html')


# @app.route("/", methods=["POST"])
# def process_login():
#     """Log user into site."""

#     input_email = request.form.get('email')
#     input_pw = request.form.get('password')
#     user = users.Usermanager.get_user_by_email(input_email)
#     if user:
#         if user.password == input_pw:
#             flash("Success!")
#             session["login"] = input_email
#             return redirect('/search')
#         else:
#             flash("Incorrect password!")
#             return redirect('/')
#     else:
#         flash("User doesn't exist!")
#         return redirect('/')


# @app.route('/signup')
# def signup():
#     input_email = request.form.get('email')
#     input_pw = request.form.get('password')
#     user = users.User(input_email, input_pw)
#     if user.is_valid():
#         flash('Success!')
#     else:
#         flash('Invalid email and/or password!')


# @app.route('/search')
# def search():

#     return render_template('search.html')
