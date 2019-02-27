"""Models and database functions for PinTrip project."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


##############################################################################
class User(db.Model):
    '''Users of the website'''

    __tablename__ = 'users'

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    fname = db.Column(db.String(64), nullable=False)
    lname = db.Column(db.String(64), nullable=False)
    email = db.Column(db.String(64), nullable=False, unique=True)
    password = db.Column(db.String(64), nullable=False)

    trips = db.relationship('Trip', backref='user')

    def __repr__(self):  # pragma: no cover
        return '<User user_id={}  email={}>'.format(self.user_id, self.email)

    @classmethod
    def get_user_by_id(cls, user_id):

        # User.get_user_by_id(1)
        return cls.query.filter_by(user_id=user_id).first()

    @classmethod
    def get_user_by_email(cls, email):

        # User.get_user_by_email('email@gmail.com')
        return cls.query.filter_by(email=email).first()


class Photo(db.Model):
    '''Photos on the website'''

    __tablename__ = 'photos'

    img_id = db.Column(db.BigInteger, primary_key=True)
    url = db.Column(db.String(256))
    lon = db.Column(db.Float)
    lat = db.Column(db.Float)
    city_name = db.Column(db.String(64), db.ForeignKey(
        'cities.name'), nullable=False)

    city = db.relationship('City')
    trips = db.relationship(
        'Trip', secondary='trip_photos_rel', backref='photos')

    def __repr__(self):  # pragma: no cover
        return '<Image photo_id={} url={}>'.format(self.img_id, self.url)

    # does this work? from stackoverflow
    # def as_dict(self):
    #     return {c.name: str(getattr(self, c.name)) for c in self.__table__.columns}

    @classmethod
    def get_photo(cls, img_id):

        return cls.query.filter_by(img_id=img_id).first()


class Trip(db.Model):
    '''Trip boards created by a user.'''

    __tablename__ = 'trips'

    trip_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(64), nullable=False)

    user_id = db.Column(db.Integer, db.ForeignKey(
        'users.user_id'), nullable=False)
    city_name = db.Column(db.String(64), db.ForeignKey(
        'cities.name'), nullable=False)

    city = db.relationship('City')

    def __repr__(self):  # pragma: no cover

        return '<Trip trip_id={} city={} user_id={}>'.format(self.trip_id, self.city_name, self.user_id)

    @classmethod
    def get_trip(cls, trip_id):
        return cls.query.filter_by(trip_id=trip_id).first()


class LikedTrip(db.Model):
    '''Keeps track of trips that have been liked'''

    __tablename__ = 'liked_trips'

    trip_id = db.Column(db.Integer, primary_key=True)

    users = db.relationship(
        'User', secondary='trip_user_likes_rel', backref='liked_trips')

    @classmethod
    def get_liked(cls, trip_id):
        return cls.query.filter_by(trip_id=trip_id).first()


class City(db.Model):
    '''Cities available for trips.'''

    __tablename__ = 'cities'

    name = db.Column(db.String(64), primary_key=True)
    lon = db.Column((db.Float), nullable=False)
    lat = db.Column((db.Float), nullable=False)
    country_code = db.Column(db.String(2))
    timezone = db.Column(db.String(64))

    trips = db.relationship('Trip')
    photos = db.relationship('Photo')

    def __repr__(self):  # pragma: no cover
        """Provide helpful representation when printed."""

        return '<City name={}>'.format(self.name)

    @classmethod
    def get_city(cls, name):

        return cls.query.filter_by(name=name).first()


class TripPhotoRelationship(db.Model):
    '''Relationship between photo and trip board'''

    __tablename__ = 'trip_photos_rel'

    relationship_id = db.Column(
        db.Integer, autoincrement=True, primary_key=True)
    trip_id = db.Column(db.Integer, db.ForeignKey(
        'trips.trip_id'), nullable=False)
    photo_id = db.Column(db.BigInteger, db.ForeignKey(
        'photos.img_id'), nullable=False)

    @classmethod
    def get_trip_photo(cls, trip_id, photo_id):
        return cls.query.filter_by(trip_id=trip_id, photo_id=photo_id).first()


class TripUserLikes(db.Model):
    '''Tracks which users liked which boards'''

    __tablename__ = 'trip_user_likes_rel'

    relationship_id = db.Column(
        db.Integer, autoincrement=True, primary_key=True)
    trip_id = db.Column(db.Integer, db.ForeignKey(
        'trips.trip_id'), db.ForeignKey('liked_trips.trip_id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey(
        'users.user_id'), nullable=False)

    @classmethod
    def get_liked_trip(cls, trip_id, user_id):
        return cls.query.filter_by(trip_id=trip_id, user_id=user_id).first()


##############################################################################
# Helper functions


def connect_to_db(app, db_uri='postgresql:///pintrip'):
    """Connect the database to our Flask app."""

    # Configure to use our PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SQLALCHEMY_ECHO'] = False
    db.app = app
    db.init_app(app)


if __name__ == "__main__":  # pragma: no cover
    from server import app
    connect_to_db(app)
