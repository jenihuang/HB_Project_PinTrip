# from pprint import pformat, pprint
# import os
# import flickrapi
import hashlib
import requests
import requests_cache
from helper_functions import *

from jinja2 import StrictUndefined
from flask import Flask, render_template, request, flash, redirect, session, url_for, jsonify
from flask_debugtoolbar import DebugToolbarExtension
from model import connect_to_db, db, User, Photo, Trip, City, TripPhotoRelationship, TripUserLikes, LikedTrip


app = Flask(__name__)


# key to use Flask session and debug toolbar
app.secret_key = "SECRETSECRETSECRET"

# raises an error for undefined variables in jinja2
app.jinja_env.undefined = StrictUndefined

# map_box_key = os.environ.get('MABOX_KEY')

CACHE = {}


@app.route('/update')
def update():

    POPOULAR_CITIES = ['amsterdam', 'bangkok', 'barcelona', 'beijing', 'boston',
                       'cape town', 'dublin', 'havana', 'hong kong', 'kyoto',
                       'london', 'monterey', 'montreal', 'napa', 'new york city',
                       'paris', 'rome', 'san francisco', 'seattle', 'seoul',
                       'shanghai', 'singapore', 'tokyo', 'toronto']

    for city in POPOULAR_CITIES:
        if city.title() not in CACHE:
            try:
                photos = update_cache(city)
                if photos:
                    CACHE[city.title()] = photos
            except:
                continue

    return redirect('/')


@app.route('/')
def show_homepage():
    '''shows main page for the website or user homepage if user logged in'''

    # if someone is logged in, redirect user to his/her homepage
    if session.get('login'):
        return redirect(url_for('userhome', user_id=session['login']))

    # no user is logged in, redirect to the website homepage
    else:
        return render_template('homepage.html')


@app.route('/login', methods=['GET'])
def show_login():
    '''shows login form or link to signup page'''

    return render_template('login.html')


@app.route("/login", methods=['POST'])
def process_login():
    '''Logs user into site and renders homepage.'''

    # get login information from the form inputs
    input_email = request.form.get('email')
    input_pw = request.form.get('password')

    user = User.get_user_by_email(input_email)

    # if the user is in the database from above step
    if user:
        # check if password is same as hashed form input
        if user.password == hashlib.md5(input_pw.encode()).hexdigest():
            flash("Successfully logged in!")
            user_id = user.user_id

            # add verified user to the current session
            session["login"] = user_id
            return redirect(url_for('userhome', user_id=session['login']))

        # password in the database is different than form input, redirect back to login
        else:
            flash("Incorrect password!")
            return redirect('/login')

    # user doesn't exist, flash error message
    else:
        flash('Sorry, that email does not exist!')
        return redirect('/login')


@app.route('/logout', methods=['GET'])
def show_logout():
    '''shows logout message and redirects back to homepage'''

    # removes current user from the session for login
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

    # get registration information from form inputs
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

    # check if user exists in the database
    user = User.get_user_by_email(input_email)
    if user:
        flash('Sorry that email is already registered')
        return redirect('/signup')

    # if email doesn't exist, register new user and add to the database
    else:
        # create new instance of user object and add to the database
        # note password hash is saved for security purposes
        hashed_pw = hashlib.md5(input_pw.encode()).hexdigest()

        user = User(fname=fname, lname=lname,
                    email=input_email, password=hashed_pw)
        db.session.add(user)
        db.session.commit()

        # get user object from the database for current user
        user = User.get_user_by_email(input_email)
        user_id = user.user_id

        # add current user's id to the session
        session['login'] = user_id

        # redirect user to user homepage
        return redirect(url_for('userhome', user_id=user_id))


@app.route('/<int:user_id>', methods=['GET'])
def userhome(user_id):
    '''shows homepage of logged in user'''

    # if the session login id matches the route user_id
    if session.get('login') == user_id:
        user = User.get_user_by_id(user_id)

        # get current user's trips and pass it to mytrips.html for rendering
        trips = user.trips

        return render_template('mytrips.html', trips=trips, user=user)

    # unauthorized user trying to access page, redirect to homepage
    else:
        return redirect('/')


@app.route('/view-trip', methods=['POST'])
def trip_details():
    '''shows details and photos for each trip board'''

    # obtain trip_id from the request form
    trip_id = request.form.get("trip")

    # get trip from the database using trip_id
    trip = Trip.get_trip(trip_id)
    photos = trip.photos
    user = session.get('login')

    return render_template('tripdetails.html', user=user, trip=trip, photos=photos)


@app.route('/<int:user_id>/add-trip', methods=['POST'])
def add_trip(user_id):
    '''adds trip board for user for city from form input'''

    trip_name = request.form.get('name')
    city_name = request.form.get('city')

    # check if user input city is a valid city in the database
    if cityname_is_valid(city_name):

        # add trip to the database for current user
        city = city_name.strip().title()
        trip = Trip(name=trip_name, user_id=user_id, city_name=city)
        db.session.add(trip)
        db.session.commit()
    else:
        flash('Sorry, that city is not available in the database.')

    return redirect(url_for('userhome', user_id=user_id))


@app.route('/remove-trip', methods=['POST'])
def remove_trip():
    '''removes trip board from user boards'''

    trip_id = request.form.get("trip")
    user_id = request.form.get("user")

    # get trip from the database
    trip = Trip.get_trip(trip_id)

    # if the trip exists in the database
    if trip:

        # check if trip owner is same as logged in user
        if session.get('login') == trip.user_id:

            # get all liked relationship items for this trip from the database
            liked = LikedTrip.query.get(trip_id)
            liked_trips = TripUserLikes.query.filter(
                TripUserLikes.trip_id == trip_id).all()

            # if the trip has any liked relationships
            if liked_trips:
                # remove all liked trip relationships from the database
                for liked_trip in liked_trips:
                    db.session.delete(liked_trip)
                    db.session.commit()

            # remove the liked trip and trip from the database
            db.session.delete(liked)
            db.session.delete(trip)
            db.session.commit()

            return redirect(url_for('userhome', user_id=user_id))
        else:
            flash('You do not have permission to access this feature')
            return redirect('/')
    else:
        flash('Sorry, that is not a valid trip')
        return redirect('/')


@app.route('/add-photo', methods=['POST'])
def add_photo_to_trip():
    '''adds a photo to the trip board for that location'''

    trip_id = request.form.get('trip')
    img_id = request.form.get('img_id')
    url = request.form.get('url')
    lat = request.form.get('lat')
    lon = request.form.get('lon')
    city_name = request.form.get('city_name')

    trip = Trip.get_trip(trip_id)

    # checks if authorized user is accessing this page
    if session.get('login') == trip.user_id:

        # if photo is not in the database, add it to the database
        if not Photo.get_photo(img_id):
            photo = Photo(img_id=int(img_id), url=url,
                          lon=float(lon), lat=float(lat), city_name=city_name)
            db.session.add(photo)
            db.session.commit()

        # check if photo already exists in current users trip
        already_exists = TripPhotoRelationship.get_trip_photo(trip_id, img_id)

        if already_exists:
            return 'This photo is already in your trip board!'

        # photo is not in current trip board, add relationship to the database
        else:
            trip_photo = TripPhotoRelationship(
                trip_id=trip_id, photo_id=img_id)
            db.session.add(trip_photo)
            db.session.commit()
            return 'Photo Added'

    # unauthorized user, redirect to homepage
    else:
        flash('You do not have permission to access this feature')
        return 'Unauthorized User: Photo Not Added'


@app.route('/remove-photo', methods=['POST'])
def remove_photo_from_trip():
    '''removes a photo from the trip board for that location'''

    trip_id = request.form.get("trip")
    img_id = request.form.get("photo")

    trip = Trip.get_trip(trip_id)

    # checks if authorized user is accessing this page
    if session.get('login') == trip.user_id:
        already_exists = TripPhotoRelationship.get_trip_photo(trip_id, img_id)

        # photo is in current trip board, delete relationship from the database
        if already_exists:
            db.session.delete(already_exists)
            db.session.commit()
        else:
            return ('This photo is not in your trip board!')

        return 'Successfully removed'

    # unauthorized user, redirect to homepage
    else:
        flash('You do not have permission to access this feature')
        return 'Error: Photo not removed.'


@app.route('/results', methods=['POST'])
def process_results():
    '''Shows search results with photos found from flickr'''

    # get form inputs from search
    city_name = request.form.get('city')
    tag = request.form.get('tag')
    user_id = session.get('login')

    # check if user input city is a valid city in the database
    city = cityname_is_valid(city_name)

    if city:

        trip = get_trip_by_user_city(user_id, city.name)

        # call API function to get flickr photos for that city and tag, or cache
        output = search_photos_by_city(city.name, tag)

        if output:
            photos = convert_photo_data(output, city.name)
            return render_template('results.html', photos=photos, trip=trip)

        else:
            flash('Sorry there was an error fetching your results from Flickr')
            return redirect('/')

    # user input is not a valid city in the database, redirect to homepage
    else:
        flash('Sorry, that city is not in our database.')
        return redirect('/')


@app.route('/explore', methods=['GET'])
def explore_trips():
    '''Shows explore page, allows user to look at popular trips'''

    # gets all trips in the database and passes to explore.html to render
    all_trips = Trip.query.all()

    return render_template('explore.html', trips=all_trips)


@app.route('/favorites', methods=['GET'])
def show_favorites():
    '''Shows favorites page saved by user'''

    # check if user is logged in
    if session.get('login'):
        user_id = session.get('login')

        # gets user's favorite trip_ids from the database
        liked_trips_ids = User.get_user_by_id(user_id).liked_trips

        trips = []

        # look up trip ids and append trip objects to trips list
        for liked_trip in liked_trips_ids:
            trip = Trip.get_trip(liked_trip.trip_id)
            trips.append(trip)

        return render_template('favorites.html', trips=trips)

    # user is not logged in, redirect to homepage
    else:
        return redirect('/')


@app.route('/add-fav', methods=['POST'])
def add_to_favorites():
    '''adds a trip to user's favorites page'''

    user_id = session.get('login')
    trip_id = request.form.get('trip')

    # check if user adding is same as logged in user
    if user_id:

        # check if trip is already a favorite for user
        already_exists = TripUserLikes.get_liked_trip(trip_id, user_id)

        if already_exists:
            flash('This trip is already in your favorites list!')
            return redirect('/favorites')

        # if trip is not in the favorites already, add trip to favorites in the database
        else:
            trip = LikedTrip(trip_id=trip_id)
            db.session.add(trip)
            db.session.commit()

            fav = TripUserLikes(trip_id=trip_id, user_id=user_id)
            db.session.add(fav)
            db.session.commit()
            return redirect('/favorites')

    # redirect unauthorized user back to homepage
    else:
        flash('You do not have permission to access this feature')
        return redirect('/')


@app.route('/remove-fav', methods=['POST'])
def remove_from_favorites():
    '''removes trip board from user favorite boards'''

    user_id = session.get('login')
    trip_id = request.form.get('trip')

    if user_id:

        # check if trip is already a favorite for user
        already_exists = TripUserLikes.get_liked_trip(trip_id, user_id)

        if already_exists:

            db.session.delete(already_exists)
            db.session.commit()
            return redirect('/favorites')

        # if trip is not in the favorites, flash error message
        else:

            flash('This trip is not in your favorites list!')
            return redirect('/favorites')

    else:
        flash('You do not have permission to access this feature')
        return redirect('/')


@app.route('/get-map', methods=['POST'])
def get_map():
    ''' Shows a map with pins of photos for the trip '''

    trip_id = request.form.get('trip-map')
    trip = Trip.get_trip(trip_id)

    # if the trip exists in the database
    if trip:
        photos = trip.photos

        # get city center coordinates to center map
        lon = trip.city.lon
        lat = trip.city.lat

        # turn city center coordinates into dictionary object
        city_geo = {"lon": lon, "lat": lat}

        trip_photos = []

        # loop through each photo in the trip object
        for photo in photos:

            # extract photo details and create dictionary for each photo with details
            photo_details = {'img_id': photo.img_id,
                             'url': photo.url, 'lat': photo.lat, 'lon': photo.lon}

            # append photo details dictionary to trip_photos list
            trip_photos.append(photo_details)

        # pass variables to html template as json objects
        return render_template('getmap.html', photos=json.dumps(trip_photos), cityGeo=json.dumps(city_geo))
    else:
        flash('Sorry could not find this trip!')
        return redirect('/')


if __name__ == "__main__":  # pragma: no cover
    app.debug = True
    connect_to_db(app)
    app.run(host="0.0.0.0")
