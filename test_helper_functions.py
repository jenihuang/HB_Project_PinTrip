import unittest
from flask import Flask
import json
from server import app
from model import *
from helper_functions import *


class TestLoginFunctions(unittest.TestCase):

    def test_email_isvalid(self):
        self.assertEqual(email_isvalid('j@yahoo.com'), True)
        self.assertEqual(email_isvalid('beyonce32@gmail.com'), True)
        self.assertEqual(email_isvalid('12345@gmail.com'), True)
        self.assertEqual(email_isvalid('jk@blue@gmail.com'), False)
        self.assertEqual(email_isvalid('abc!@#123@gmail.com'), False)

    def test_password_isvalid(self):
        self.assertEqual(password_isvalid('kayak'), False)
        self.assertEqual(password_isvalid('abc123'), False)
        self.assertEqual(password_isvalid('Abc123'), True)
        self.assertEqual(password_isvalid('ABC123'), False)
        self.assertEqual(password_isvalid('!#@$Aa5'), True)


class TestDatabaseFunctions(unittest.TestCase):
    def test_cityname_is_valid(self):
        self.assertEqual(cityname_is_valid(
            'san francisco'), True)
        self.assertEqual(cityname_is_valid(
            'San Francisco'), True)
        self.assertEqual(cityname_is_valid(
            ' San francisco '), True)
        self.assertEqual(cityname_is_valid(
            'hello'), False)
        self.assertEqual(cityname_is_valid(
            'SanFrancisco'), False)

    # def test_get_trip_by_user_city(self):

    # def test_user_has_trip(self):


if __name__ == '__main__':
    unittest.main()
    connect_to_db(app)
