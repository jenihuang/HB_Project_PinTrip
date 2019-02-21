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

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1

            result = self.client.get('/', follow_redirects=True)

            self.assertIn(b'Add a Trip!', result.data)
            self.assertNotIn(b'SIGN UP', result.data)

    def test_show_signup(self):
        ''' Test sign up page '''

        result = self.client.get('/signup')
        self.assertIn(
            b'Sign up!', result.data)

    def test_process_signup(self):
        ''' Test signup of new user '''

        result = self.client.post(
            '/signup', data={'email': 'taylor@taylor', 'password': 'Abc123',
                             'fname': 'taylor', 'lname': 'swift'},
            follow_redirects=True)
        self.assertIn(b'Sorry, not a valid email', result.data)

        result = self.client.post(
            '/signup', data={'email': 'taylor@taylor.com', 'password': '123456',
                             'fname': 'taylor', 'lname': 'swift'},
            follow_redirects=True)
        self.assertIn(b'Password must contain', result.data)

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

    def test_show_login(self):
        ''' Test sign up page '''

        result = self.client.get('/login')
        self.assertIn(
            b'Please Sign In', result.data)

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
        ''' Test user homepage '''

        result = self.client.get("/1", follow_redirects=True)
        self.assertNotIn(b"Add a Trip!", result.data)
        self.assertIn(b"SIGN UP", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.get('/1', follow_redirects=True)
            self.assertIn(b"Add a Trip!", result.data)

    def test_tripdetails_page(self):
        ''' Test trip details page '''

        ''' Tests non logged in user sees photos but does not see remove from trip'''
        result = self.client.post(
            '/view-trip', data={'trip': 1},
            follow_redirects=True)
        self.assertIn(b'Saved Photos', result.data)
        self.assertNotIn(b'Remove from Trip', result.data)

        ''' Tests logged in user sees remove photo option and does not see add trip to favorites option'''
        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/view-trip', data={'trip': 1}, follow_redirects=True)
            self.assertIn(b"Remove from Trip", result.data)
            self.assertNotIn(b'Add to Favorites', result.data)

        ''' Tests trip with no photos shows the correct page '''
        result = self.client.post(
            '/view-trip', data={'trip': 4},
            follow_redirects=True)

        self.assertIn(b'Sorry no photos', result.data)
        self.assertNotIn(b'Saved Photos', result.data)

    def test_add_trip(self):
        ''' Tests adding a trip to user page '''

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/1/add-trip', data={'name': 'Test Napa Trip', 'city': 'Napa'},
                follow_redirects=True)

            self.assertIn(b"Test Napa Trip", result.data)
            self.assertNotIn(b'Add to Favorites', result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/1/add-trip', data={'name': 'Test Hello', 'city': 'hello'},
                follow_redirects=True)

            self.assertIn(b"Sorry, that city is not available", result.data)
            self.assertNotIn(b'Test Hello', result.data)

    def test_remove_trip(self):
        ''' Tests removing a trip from user page '''

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 5
            result = self.client.post(
                '/remove-trip', data={'trip': 3, 'user': 5},
                follow_redirects=True)
            self.assertNotIn(b'Ellen SF', result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 5
            result = self.client.post(
                '/remove-trip', data={'trip': 7, 'user': 5},
                follow_redirects=True)
            self.assertNotIn(
                b"Sorry that is not a valid trip", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 5
            result = self.client.post(
                '/remove-trip', data={'trip': 1, 'user': 2},
                follow_redirects=True)
            self.assertIn(b'You do not have permission', result.data)
            self.assertNotIn(b'SIGN UP', result.data)

    def test_add_photo(self):
        ''' Tests adding a photo to trip '''

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                'add-photo', data={'trip': 1, 'img_id': 5000,
                                   'url': 'test.com', 'lat': 5.0, 'lon': 5.0,
                                   'city_name': 'Cancun'},
                follow_redirects=True)

            self.assertIn(b"Photo Added", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                'add-photo', data={'trip': 1, 'img_id': 1,
                                   'url': 'test.com', 'lat': 5.0, 'lon': 5.0,
                                   'city_name': 'San Francisco'},
                follow_redirects=True)

            self.assertIn(b"This photo is already in your trip", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 5
            result = self.client.post(
                'add-photo', data={'trip': 1, 'img_id': 1,
                                   'url': 'test.com', 'lat': 5.0, 'lon': 5.0,
                                   'city_name': 'San Francisco'},
                follow_redirects=True)

            self.assertIn(b"Unauthorized User", result.data)

    def test_remove_photo(self):
        ''' Tests removing a photo from trip '''

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/remove-photo', data={'trip': 1, 'photo': 1},
                follow_redirects=True)
            self.assertIn(
                b"Successfully removed", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/remove-photo', data={'trip': 1, 'photo': 54321},
                follow_redirects=True)
            self.assertIn(
                b"This photo is not in your trip", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 5
            result = self.client.post(
                '/remove-photo', data={'trip': 1, 'photo': 1},
                follow_redirects=True)
            self.assertIn(b'Error: Photo not removed', result.data)

    def test_process_results(self):
        ''' Tests getting search results '''

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/results', data={'city': 'blah', 'tag': 'winery'},
                follow_redirects=True)
            self.assertIn(
                b"Sorry, that city is not in our database.", result.data)

    def test_explore_trips(self):
        ''' Test explore page '''

        result = self.client.get('/explore')
        self.assertIn(
            b'Explore Trips', result.data)

    def test_show_favorites(self):
        ''' Test favorites page '''

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.get('/favorites')
            self.assertIn(
                b'Favorite Trips', result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = None
            result = self.client.get('/favorites')
            self.assertNotIn(
                b'Favorite Trips', result.data)

    def test_add_favorite(self):
        ''' Tests adding a trip to favorites page '''

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/add-fav', data={'trip': 4},
                follow_redirects=True)
            self.assertIn(b"Ellen Napa", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/add-fav', data={'trip': 3},
                follow_redirects=True)
            self.assertIn(
                b"This trip is already in your favorites", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = None
            result = self.client.post(
                '/add-fav', data={'trip': 3},
                follow_redirects=True)
            self.assertIn(
                b"You do not have permission", result.data)

    def test_remove_favorite(self):
        ''' Tests removing a trip from favorites page '''

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/remove-fav', data={'trip': 3},
                follow_redirects=True)
            self.assertNotIn(b"Ellen SF", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/remove-fav', data={'trip': 4},
                follow_redirects=True)
            self.assertIn(
                b"This trip is not in your favorites", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = None
            result = self.client.post(
                '/remove-fav', data={'trip': 3},
                follow_redirects=True)
            self.assertIn(
                b"You do not have permission", result.data)

    def test_get_map(self):
        ''' Tests getting trip map page '''

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/get-map', data={'trip-map': 1},
                follow_redirects=True)
            self.assertIn(b"Map Trip", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                sess['login'] = 1
            result = self.client.post(
                '/get-map', data={'trip-map': 7},
                follow_redirects=True)
            self.assertNotIn(b"Map Trip", result.data)


################################################################################


if __name__ == '__main__':  # pragma: no cover
    unittest.main()
    connect_to_db(app)
