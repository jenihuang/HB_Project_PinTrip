from pprint import pformat, pprint
import os
import flickrapi

import requests
import users

from jinja2 import StrictUndefined
from flask import Flask, render_template, request, flash, redirect, session
from flask_debugtoolbar import DebugToolbarExtension
# from model import connect_to_db, db, User, Photo, TripBoard, City

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


@app.route("/login", methods=['GET'])
def process_login():
    '''Log user into site and renders homepage.'''

    input_email = request.form.get('email')
    input_pw = request.form.get('password')
    user = users.Usermanager.get_user_by_email(input_email)
    if user:
        if user.password == input_pw:
            flash("Success!")
            session["login"] = input_email
            return redirect('/<user_id>')
        else:
            flash("Incorrect password!")
            return redirect('/login')
    else:
        flash("User doesn't exist!")
        return redirect('/login')


@app.route('/signup', methods=['POST'])
def signup():
    '''Shows signup page where users can signup for a new account'''
    input_email = request.form.get('email')
    input_pw = request.form.get('password')
    # check if user email already in the database
    user = users.User(input_email, input_pw)
    if user.is_valid():
        flash('Success!')
    else:
        flash('Invalid email and/or password, please try again')


@app.route('/<user_id>', methods=['GET'])
def userhome():
    '''shows homepage of logged in user'''
    if session.get('login'):
        return render_template('mytrips.html')
    else:
        return redirect('/')


@app.route('/search', methods=['POST'])
def search():
    '''Shows search page, allows user to search for photos'''
    if session.get('login'):
        return render_template('search.html')
    else:
        return redirect('/')


if __name__ == "__main__":
    # We have to set debug=True here, since it has to be True at the point
    # that we invoke the DebugToolbarExtension
    app.debug = True

    # connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run(host="0.0.0.0")
