# from pprint import pformat, pprint
import os
import flickrapi

import requests
from login_validation import *

from jinja2 import StrictUndefined
from flask import Flask, render_template, request, flash, redirect, session, url_for
from flask_debugtoolbar import DebugToolbarExtension
from model import connect_to_db, db, User, Photo, Trip, City

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
        user = User.query.get(user_id)
        return render_template('mytrips.html', user=user)
    else:
        return redirect('/')


@app.route('/search', methods=['POST'])
def search():
    '''Shows search page, allows user to search for photos'''
    if session.get('login'):
        return render_template('search.html')
    else:
        return redirect('/')


@app.route('/explore', methods=['GET'])
def explore():
    '''Shows explore page, allows user to look at popular trips'''
    if session.get('login'):
        return render_template('explore.html')
    else:
        return redirect('/')


if __name__ == "__main__":
    # We have to set debug=True here, since it has to be True at the point
    # that we invoke the DebugToolbarExtension
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    # DebugToolbarExtension(app)

    app.run(host="0.0.0.0")
