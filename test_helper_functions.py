import unittest
from flask import Flask
import sqlalchemy
from sqlalchemy import create_engine, text
from server import app
from model import *
from helper_functions import *


class TestLoginFunctions(unittest.TestCase):
    ''' Registration validation tests '''

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

    #     db.engine.execute(open('test.sql', 'r').read())

    # def tearDown(self):

    #     db.session.remove()
    #     db.drop_all()
    #     db.engine.dispose()

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


# class FlaskTestsDatabase(unittest.TestCase):
#     ''' Flask route tests that use the database '''

#     def setUp(self):
#         ''' Connect to flask test client and test database '''

#         self.client = app.test_client()
#         app.config['TESTING'] = True

#         connect_to_db(app, "postgresql:///testpintrip")

#     def tearDown(self):

#         db.session.remove()
#         db.drop_all()
#         db.engine.dispose()

    # def test_users_list(self):
    #     result = self.client.get('/users')
    #     self.assertIn(b'Jenica', result.data)


################################################################################


if __name__ == '__main__':
    unittest.main()
    connect_to_db(app)
