import unittest
from server import app
from model import *
from flask import session
from seed import *


class TestFlaskLogin(unittest.TestCase):
    ''' Flask route tests that use the database '''

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

    def test_show_homepage(self):
        ''' Test home page '''

        result = self.client.get('/')

        self.assertIn(
            b'SIGN UP', result.data)

    def test_process_signup(self):
        ''' Test signup of new user '''

        result = self.client.post(
            '/signup', data={'email': 'taylor@gmail.com', 'password': 'Abc123',
                             'fname': 'taylor', 'lname': 'swift'},
            follow_redirects=True)

        self.assertIn(b'Sorry that email is already registered', result.data)

        result = self.client.post(
            '/signup', data={'email': 'blah@email.com', 'password': 'Abc123',
                             'fname': 'test', 'lname': 'test'},
            follow_redirects=True)

        self.assertIn(b'Add a Trip!', result.data)

    def test_process_login(self):
        ''' Test login process '''

        result = self.client.post(
            '/login', data={'email': 'taylor@gmail.com', 'password': 'Abc123'},
            follow_redirects=True)

        self.assertIn(b'Add a Trip!', result.data)

        result = self.client.post(
            '/login', data={'email': 'blah@gmail.com', 'password': 'blahblah'},
            follow_redirects=True)

        self.assertIn(b'Please Sign In', result.data)

        result = self.client.post(
            '/login', data={'email': 'taylor@gmail.com',
                            'password': 'blahblah'}, follow_redirects=True)

        self.assertIn(b'Please Sign In', result.data)

    def test_logout(self):
        ''' Test logout route '''

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = '1'

            result = self.client.get('/logout', follow_redirects=True)

            self.assertNotIn(b'Add a Trip!', session)
            self.assertIn(b'SIGN UP', result.data)

    def test_userhome_page(self):
        ''' Test that user homepage '''

        result = self.client.get("/1", follow_redirects=True)
        self.assertNotIn(b"Add a Trip!", result.data)
        self.assertIn(b"SIGN UP", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.get('/1', follow_redirects=True)
            self.assertIn(b"Add a Trip!", result.data)

    # def test_session_login(self):
    #     ''' Test login form '''

    #     with self.client as c:
    #         result = c.post('/login',
    #                         data={'email': 'taylor@gmail.com',
    #                               'password': 'Abc123'},
    #                         follow_redirects=True
    #                         )
    #         self.assertEqual(session['login'], 1)
    #         self.assertIn(b"Add a Trip!", result.data)


if __name__ == '__main__':
    unittest.main()
    connect_to_db(app)
