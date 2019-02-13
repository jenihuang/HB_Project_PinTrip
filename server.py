# from pprint import pformat, pprint
import os
import flickrapi

import requests
from login_validation import *
from get_info import cityname_is_valid, search_photos_by_city, get_trip_by_user_city

from jinja2 import StrictUndefined
from flask import Flask, render_template, request, flash, redirect, session, url_for
from flask_debugtoolbar import DebugToolbarExtension
from model import connect_to_db, db, User, Photo, Trip, City, TripPhotoRelationship, TripUserLikes


app = Flask(__name__)

# key to use Flask session and debug toolbar
app.secret_key = "SECRETSECRETSECRET"

# raises an error for undefined variables in jinja2
app.jinja_env.undefined = StrictUndefined


@app.route('/')
def show_homepage():
    '''shows main page for the website or user homepage if user logged in'''
    if session.get('login'):
        return redirect(url_for('userhome', user_id=session['login']))
    else:
        return render_template('homepage.html')


@app.route('/login', methods=['GET'])
def show_login():
    '''shows login form or link to signup page'''

    return render_template('login.html')


@app.route("/login", methods=['POST'])
def process_login():
    '''Log user into site and renders homepage.'''

    input_email = request.form.get('email')
    input_pw = request.form.get('password')

    try:
        user = User.get_user_by_email(input_email)
    except:
        flash('Sorry, that email does not exist!')
        return redirect('/login')

    if user:
        if user.password == input_pw:
            flash("Successfully logged in!")
            user_id = user.user_id
            session["login"] = user_id
            return redirect(url_for('userhome', user_id=session['login']))
        else:
            flash("Incorrect password!")
            return redirect('/login')


@app.route('/logout', methods=['GET'])
def show_logout():
    '''shows logout message and redirects back to homepage'''

    del session['login']
    flash('Logged out')
    return redirect('/')


@app.route('/signup', methods=['GET'])
def show_signup():
    '''shows form for signup page'''

    return render_template('signup.html')


@app.route('/signup', methods=['POST'])
def process_signup():
    '''Shows signup page where users can signup for a new account'''
    input_email = request.form.get('email')
    input_pw = request.form.get('password')
    fname = request.form.get('fname')
    lname = request.form.get('lname')

    # validate user email
    if not email_isvalid(input_email):
        flash('Sorry, not a valid email')
        return redirect('/signup')

    # validate user password
    if not password_isvalid(input_pw):
        flash('Password must contain 1 of: Uppercase, lowercase, number')
        return redirect('/signup')

    # check if user email already in the database
    try:
        user = User.get_user_by_email(input_email)
        flash('Sorry that email is already registered')
        return redirect('/signup')
    # if email doesn't exist, register new user and add to the database
    except:
        user = User(fname=fname, lname=lname,
                    email=input_email, password=input_pw)
        db.session.add(user)
        db.session.commit()

        user = User.get_user_by_email(input_email)
        user_id = user.user_id

        session['login'] = user_id

        return redirect(url_for('userhome', user_id=user_id))


@app.route('/<int:user_id>', methods=['GET'])
def userhome(user_id):
    '''shows homepage of logged in user'''
    if session.get('login') == user_id:
        user = User.get_user_by_id(user_id)
        trips = user.trips

        # trip_photos = {}

        # for trip in trips:
        #     trip_photos[trip.city_name] = trip.photos[0].url

        return render_template('mytrips.html', trips=trips, user=user)
    else:
        return redirect('/')


@app.route('/<int:user_id>/<int:trip_id>', methods=['GET'])
def trip_details(user_id, trip_id):
    '''shows details and photos for each trip board'''
    if session.get('login') == user_id:
        trip = Trip.get_trip(trip_id)
        photos = trip.photos
        return render_template('tripdetails.html', trip=trip, photos=photos)
    else:
        return redirect('/')


@app.route('/add/<int:user_id>/<int:trip_id>/<int:img_id>', methods=['GET'])
def add_photo_to_trip(user_id, trip_id, img_id):
    '''adds a photo to the trip board for that location'''

    already_exists = TripPhotoRelationship.query.filter(
        TripPhotoRelationship.trip_id == trip_id, TripPhotoRelationship.photo_id == img_id).first()

    if already_exists:
        flash('This photo is already in your trip board!')
    else:
        trip_photo = TripPhotoRelationship(trip_id=trip_id, photo_id=img_id)
        db.session.add(trip_photo)
        db.session.commit()
    return redirect('/results')


@app.route('/remove/<int:user_id>/<int:trip_id>/<int:img_id>', methods=['GET'])
def remove_photo_from_trip(user_id, trip_id, img_id):
    '''removes a photo from the trip board for that location'''
    trip_photo = TripPhotoRelationship.query.filter(
        TripPhotoRelationship.user_id == user_id, TripPhotoRelationship.trip_id == trip_id).one()
    db.session.delete(trip_photo)
    db.session.commit()
    return redirect('/results')


@app.route('/search', methods=['GET'])
def search():
    '''Shows search page, allows user to search for photos'''
    if session.get('login'):
        return render_template('search.html')
    else:
        return redirect('/')


@app.route('/results', methods=['POST'])
def process_results():
    '''Shows search results with photos found from flickr'''
    city_name = request.form.get('city')
    tag = request.form.get('tag')
    user_id = session.get('login')

    #check if user input city is a valid city in the database
    if cityname_is_valid(city_name):
        city = cityname_is_valid(city_name)
        photos = search_photos_by_city(city_name, tag)
        trip = get_trip_by_user_city(user_id, city.name)

        # add photo to database if not already in database
        for photo in photos:
            if not Photo.get_photo(photo.img_id):
                db.session.add(photo)
                db.session.commit()

        return render_template('results.html', photos=photos, trip=trip)

    else:
        flash('Sorry, that city is not in our database.')
        return redirect('/search')


@app.route('/explore', methods=['GET'])
def explore():
    '''Shows explore page, allows user to look at popular trips'''

    # ?not sure if below is currect to order by most likes?
    all_trips = Trip.query.order_by(Trip.likes).all()

    return render_template('explore.html', trips=all_trips)


if __name__ == "__main__":
    # We have to set debug=True here, since it has to be True at the point
    # that we invoke the DebugToolbarExtension
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    # DebugToolbarExtension(app)

    app.run(host="0.0.0.0")
