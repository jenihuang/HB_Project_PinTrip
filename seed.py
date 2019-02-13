from sqlalchemy import func
import csv

from model import User, Photo, City, Trip, connect_to_db, db
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


if __name__ == "__main__":
    connect_to_db(app)
    db.create_all()

    user_filename = "seed_data/users.txt"
    photo_filename = "seed_data/photos.txt"
    city_filename = "seed_data/cities.txt"
    trip_filename = "seed_data/trips.txt"
    load_users(user_filename)
    load_cities(city_filename)
    load_photos(photo_filename)
    load_trips(trip_filename)
