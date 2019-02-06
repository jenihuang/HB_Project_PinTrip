"""Models and database functions for Tripr project."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


##############################################################################
class User(db.Model):
    '''Users of the website'''

    __tablename__ = 'users'

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    fname = db.Column(db.String(64), nullable=False)
    lname = db.Column(db.String(64), nullable=False)
    email = db.Column(db.String(64), nullable=False)
    password = db.Column(db.String(64), nullable=False)

    saved_img = db.Column(db.Integer, db.ForeignKey('photos.img_id'))

    photo = db.relationship(
        'Photo', backref=db.backref('users', order_by=user_id))

    def __repr__(self):
        return '<User user_id={}  email={}>'.format(self.user_id, self.email)

    @classmethod
    def get_user(cls, user_id):

        return cls.query.filter(User.user_id=user_id).one()


class Photo(db.Model):
    '''Photos on the website'''

    __tablename__ = 'photos'

    img_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    url = db.Column(db.String(256))
    lon = db.Column(db.Float)
    lat = db.Column(db.Float)

    city_id = db.Column(db.Integer, db.ForeignKey('cities.city_id'))
    city = db.relationship(
        'City', backref=db.backref('photos', order_by=photo_id))

    def __repr__(self):
        return '<Image photo_id={} url={}>'.format(self.img_id, self.url)

    @classmethod
    def get_photo(cls, img_id):

        return cls.query.filter(Photo.img_id=img_id).one()


class Trip(db.Model):
    '''Trip boards created by a user.'''

    __tablename__ = 'trips'

    trip_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    img_id = db.Column(db.Integer, db.ForeignKey('photos.img_id'))
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
    city_id = db.Column(db.Integer, db.ForeignKey('cities.city_id'))

    user = db.relationship('User',
                           backref=db.backref("trips", order_by=trip_id))

    photo = db.relationship('Photo',
                            backref=db.backref("trips", order_by=trip_id))

    city = db.relationship('City',
                           backref=db.backref("trips", order_by=trip_id))

    def __repr__(self):

        return '<Trip trip_id={} city_id={} user_id={}>'.format(self.trip_id, self.city_id, self.user_id)

    @classmethod
    def get_trip(cls, trip_id):

        return cls.query.filter(Trip.trip_id=trip_id).one()


class City(db.Model):
    '''Cities available for trips.'''

    __tablename__ = 'cities'

    city_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(64), nullable=False)
    lon = db.Column(db.Float)
    lat = db.Column(db.Float)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return '<User user_id={} email={}>'.format(self.user_id, self.email)

    @classmethod
    def get_city(cls, city_id):

        return cls.query.filter(City.city_id=city_id).one()


class TripPhotoRelationship(db.Model):
    '''Maps photo to trip board'''

    __tablename__ = 'trip_photos'

    relationship_id = db.Column(
        db.Integer, autoincrement=True, primary_key=True)
    trip_id = db.Integer, db.ForeignKey('trips.trip_id')
    photo_id = db.Integer, db.ForeignKey('photos.img_id')

    trip = db.relationship('Trip', backref=db.backref(
        'trip_photos', order_by=relationship_id))

    photo = db.relationship('Photo', backref=db.backref(
        'trip_photos', order_by=relationship_id))


class UserPhotoRelationship(db.Model):
    '''Maps user to saved photo'''

    __tablename__ = 'user_photos'

    relationship_id = db.Column(
        db.Integer, autoincrement=True, primary_key=True)
    user_id = db.Integer, db.ForeignKey('users.user_id')
    photo_id = db.Integer, db.ForeignKey('photos.img_id')

    user = db.relationship('User', backref=db.backref(
        'trip_photos', order_by=relationship_id))

    photo = db.relationship('Photo', backref=db.backref(
        'trip_photos', order_by=relationship_id))


##############################################################################
# Helper functions


def connect_to_db(app):
    """Connect the database to our Flask app."""

    # Configure to use our PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///tripr'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SQLALCHEMY_ECHO'] = True
    db.app = app
    db.init_app(app)


if __name__ == "__main__":

    from server import app
    connect_to_db(app)
    print("Connected to DB.")
