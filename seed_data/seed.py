from sqlalchemy import func

from model import User, Photo, City, Trip, TripPhotoRelationship, TripUserLikes, LikedTrip, connect_to_db, db
from server import app


def load_users(user_filename):
    """Load users from file into database."""

    print("Users")

    for i, row in enumerate(open(user_filename)):
        row = row.rstrip()
        fname, lname, email, password = row.split("|")

        user = User(fname=fname, lname=lname, email=email, password=password)

        # add user to the session
        db.session.add(user)

    # commit session
    db.session.commit()


def load_photos(photo_filename):
    """Load movies from file into database."""

    print("Photos")

    for i, row in enumerate(open(photo_filename)):
        row = row.rstrip()

        # unpack file into variables
        img_id, url, lat, lon, city_name = row.split("|")

        # convert geolocation from string to float format
        lat = float(lat)
        lon = float(lon)
        img_id = int(img_id)

        photo = Photo(
            img_id=img_id, url=url,
            lat=lat,
            lon=lon,
            city_name=city_name)

        db.session.add(photo)

    db.session.commit()


def load_cities(cities_filename):
    """Load cities from file into database."""

    print("Cities")

    for i, row in enumerate(open(cities_filename)):
        row = row.rstrip()
        name, lat, lon, country_code, population, timezone = row.split("|")

        lat = float(lat)
        lon = float(lon)

        city = City(name=name, lat=lat, lon=lon,
                    country_code=country_code, timezone=timezone)

        # add user to the session
        db.session.add(city)

    # commit session
    db.session.commit()


def load_trips(trips_filename):
    """Load trips from file into database."""

    print("Trips")

    for i, row in enumerate(open(trips_filename)):
        row = row.rstrip()
        name, user_id, city_name = row.split("|")

        trip = Trip(name=name, user_id=int(user_id), city_name=city_name)

        # add user to the session
        db.session.add(trip)

    # commit session
    db.session.commit()


def load_trip_photos(tps_filename):
    """Load trip_photos from file into database."""

    print("Trip Photos Relationship")

    for i, row in enumerate(open(tps_filename)):
        row = row.rstrip()
        trip_id, photo_id = row.split("|")

        trip_id = int(trip_id)
        photo_id = int(photo_id)

        trip_photo = TripPhotoRelationship(trip_id=trip_id, photo_id=photo_id)

        # add trip_photo to the session
        db.session.add(trip_photo)

    # commit session
    db.session.commit()


def load_user_likes(likes_filename):
    """Load trip likes from file into database."""

    print("Trip User Likes")

    for i, row in enumerate(open(likes_filename)):
        row = row.rstrip()
        trip_id, user_id = row.split("|")

        trip_id = int(trip_id)
        user_id = int(user_id)

        trip_photo = TripUserLikes(trip_id=trip_id, user_id=user_id)

        # add trip likes to the session
        db.session.add(trip_photo)

    # commit session
    db.session.commit()


def load_liked_trips(likedtrips_filename):
    """Load trip likes from file into database."""

    print("Liked Trips")

    for i, row in enumerate(open(likedtrips_filename)):
        trip_id = int(row)

        liked_trip = LikedTrip(trip_id=trip_id)

        # add trip likes to the session
        db.session.add(liked_trip)

    # commit session
    db.session.commit()


if __name__ == "__main__":
    connect_to_db(app)
    db.create_all()

    user_filename = "seed_data/users.txt"
    photo_filename = "seed_data/photos.txt"
    city_filename = "seed_data/cities.txt"
    trip_filename = "seed_data/trips.txt"
    tps_filename = "seed_data/trip_photos.txt"
    likes_filename = "seed_data/userlikes.txt"
    likedtrips_filename = "seed_data/liked_trips.txt"
    load_users(user_filename)
    load_cities(city_filename)
    load_photos(photo_filename)
    load_trips(trip_filename)
    load_liked_trips(likedtrips_filename)
    load_trip_photos(tps_filename)
    load_user_likes(likes_filename)
