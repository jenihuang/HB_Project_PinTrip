import unittest
from flask import Flask, session
import sqlalchemy
from sqlalchemy import create_engine, text
from server import app
from model import *
from helper_functions import *
from seed import *


class TestLoginFunctions(unittest.TestCase):
    ''' Registration tests '''

    def setUp(self):
        ''' Connect to flask test client and test database '''

        self.client = app.test_client()
        app.config['TESTING'] = True

        connect_to_db(app, "postgresql:///testpintrip")
        db.create_all()
        load_test_data()

    def tearDown(self):
        ''' Run after each test '''

        db.session.remove()
        db.drop_all()
        db.engine.dispose()

    def test_email_isvalid(self):
        ''' Tests if user input email is a valid email address '''

        self.assertEqual(email_isvalid('j@yahoo.com'), True)
        self.assertEqual(email_isvalid('beyonce32@gmail.com'), True)
        self.assertEqual(email_isvalid('12345@gmail.com'), True)
        self.assertEqual(email_isvalid('blue@gmailcom'), False)
        self.assertEqual(email_isvalid('abc!@#123@gmail.com'), False)

    def test_password_isvalid(self):
        ''' Tests if user input password meets password requirements '''

        self.assertEqual(password_isvalid('kayak'), False)
        self.assertEqual(password_isvalid('abc123'), False)
        self.assertEqual(password_isvalid('Abc123'), True)
        self.assertEqual(password_isvalid('ABC123'), False)
        self.assertEqual(password_isvalid('!#@$Aa5'), True)


class TestDatabaseHelpers(unittest.TestCase):
    ''' Tests database helper functions '''

    def setUp(self):
        ''' Connect to flask test client and test database '''

        self.client = app.test_client()
        app.config['TESTING'] = True

        connect_to_db(app, "postgresql:///testpintrip")
        db.create_all()
        load_test_data()

    def tearDown(self):

        db.session.remove()
        db.drop_all()
        db.engine.dispose()

    def test_cityname_is_valid(self):
        ''' Test if user input city returns a valid city from the database '''

        result = cityname_is_valid('san francisco')
        self.assertEqual('San Francisco', result.name)

        result = cityname_is_valid('SanFrancisco')
        self.assertEqual(None, result)

        result = cityname_is_valid('hello')
        self.assertEqual(None, result)

    def test_get_trip_by_user_city(self):
        ''' Tests if user has an existing trip with the cityname in the database '''

        result = get_trip_by_user_city(1, 'San Francisco')
        self.assertEqual('San Francisco', result.city_name)

        result = get_trip_by_user_city(1, 'Cancun')
        self.assertEqual(None, result)

    def test_get_user_by_id(self):
        ''' Test obtaining user from the database by id '''

        result = User.get_user_by_id(1)
        self.assertEqual('Taylor', result.fname)

        result = User.get_user_by_id(12)
        self.assertEqual(None, result)

    def test_get_user_by_email(self):
        ''' Test obtaining user from the database by email '''

        result = User.get_user_by_email('taylor@gmail.com')
        self.assertEqual('Taylor', result.fname)

        result = User.get_user_by_email('test@testing.com')
        self.assertEqual(None, result)

    def test_get_photo(self):
        ''' Test obtaining photo from the database by id '''

        result = Photo.get_photo(43472061031)
        self.assertEqual('Tokyo', result.city.name)

        result = Photo.get_photo(25)
        self.assertEqual(None, result)

    def test_get_trip(self):
        ''' Test obtaining trip from the database by id '''

        result = Trip.get_trip(1)
        self.assertEqual('taySF', result.name)

        result = Trip.get_trip(5)
        self.assertEqual(None, result)

    def test_get_city(self):
        ''' Test obtaining city from the database by city name'''

        result = City.get_city('San Francisco')
        self.assertEqual('San Francisco', result.name)

        result = City.get_city('hello')
        self.assertEqual(None, result)

    def test_get_trip_photo(self):
        ''' Test obtaining photo in trip relationship from the database '''

        result = TripPhotoRelationship.get_trip_photo(1, 45678)
        self.assertEqual(2, result.relationship_id)

        result = TripPhotoRelationship.get_trip_photo(1, 38569834)
        self.assertEqual(None, result)

    def test_get_liked_trip(self):
        ''' Test obtaining user liked trip relationship from the database '''

        result = TripUserLikes.get_liked_trip(1, 2)
        self.assertEqual(2, result.relationship_id)

        result = TripUserLikes.get_liked_trip(2, 1)
        self.assertEqual(None, result)


################################################################################


if __name__ == '__main__':  # pragma: no cover
    unittest.main()
    connect_to_db(app)
