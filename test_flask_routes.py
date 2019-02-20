import unittest
from server import app
from model import *
from flask import session


class TestFlaskLogin(unittest.TestCase):
    ''' Flask route tests that use the database '''

    def setUp(self):

        self.client = app.test_client()
        app.config['TESTING'] = True

        connect_to_db(app, "postgresql:///testpintrip")

    def test_show_homepage(self):

        result = self.client.get('/')

        self.assertIn(
            b'SIGN UP', result.data)

    def test_process_login(self):

        result = self.client.post(
            '/login', data={'email': 'ellen@gmail.com', 'password': 'Abc123'}, follow_redirects=True)

        self.assertIn(b'Add a Trip!', result.data)

        result = self.client.post(
            '/login', data={'email': 'blah@gmail.com', 'password': 'blahblah'}, follow_redirects=True)

        self.assertIn(b'Please Sign In', result.data)

        result = self.client.post(
            '/login', data={'email': 'ellen@gmail.com', 'password': 'blahblah'}, follow_redirects=True)

        self.assertIn(b'Please Sign In', result.data)

    def test_userhome_page(self):
        ''' Test that user can't see user details page when logged out '''

        result = self.client.get("/1", follow_redirects=True)
        self.assertNotIn(b"Add a Trip!", result.data)
        self.assertIn(b"SIGN UP", result.data)

    def test_session_login(self):
        """Test log in form.

        Unlike login test above, 'with' is necessary here in order to refer to session.
        """

        with self.client as c:
            result = c.post('/login',
                            data={'email': 'taylor@gmail.com',
                                  'password': 'Abc123'},
                            follow_redirects=True
                            )
            self.assertEqual(session['login'], 1)
            self.assertIn(b"Add a Trip!", result.data)

    def test_logout(self):
        """Test logout route."""

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = '1'

            result = self.client.get('/logout', follow_redirects=True)

            self.assertNotIn(b'Add a Trip!', session)
            self.assertIn(b'SIGN UP', result.data)


if __name__ == '__main__':
    unittest.main()
    connect_to_db(app)
