import unittest
from flask import Flask
from server import app
from model import *
from helper_functions import *


class TestLoginFunctions(unittest.TestCase):

    def test_email_isvalid(self):
        self.assertEqual(email_isvalid('j@yahoo.com'), True)
        self.assertEqual(email_isvalid('beyonce32@gmail.com'), True)
        self.assertEqual(email_isvalid('12345@gmail.com'), True)
        self.assertEqual(email_isvalid('blue@gmailcom'), False)
        self.assertEqual(email_isvalid('abc!@#123@gmail.com'), False)

    def test_password_isvalid(self):
        self.assertEqual(password_isvalid('kayak'), False)
        self.assertEqual(password_isvalid('abc123'), False)
        self.assertEqual(password_isvalid('Abc123'), True)
        self.assertEqual(password_isvalid('ABC123'), False)
        self.assertEqual(password_isvalid('!#@$Aa5'), True)


class TestDatabaseHelpers(unittest.TestCase):

    def setUp(self):
        self.client = app.test_client()
        app.config['TESTING'] = True

        connect_to_db(app, "postgresql:///testpintrip")

    # def test_users_list(self):
    #     result = self.client.get('/users')
    #     self.assertIn(b'Jenica', result.data)

    def test_cityname_is_valid(self):
        result = cityname_is_valid('san francisco')
        self.assertEqual('San Francisco', result.name)

        result = cityname_is_valid('SanFrancisco')
        self.assertEqual(None, result)

        result = cityname_is_valid('hello')
        self.assertEqual(None, result)

    def test_get_trip_by_user_city(self):
        result = get_trip_by_user_city(1, 'San Francisco')
        self.assertEqual('San Francisco', result.city_name)

        result = get_trip_by_user_city(1, 'Cancun')
        self.assertEqual(None, result)



################################################################################

if __name__ == '__main__':
    unittest.main()
    connect_to_db(app)
