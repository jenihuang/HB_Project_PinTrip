from sqlalchemy import func
import csv

from model import User, Photo, City, connect_to_db, db
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
        url, lat, lon = row.split("|")

        # convert geolocation from string to float format
        lat = float(lat)
        lon = float(lat)

        photo = Photo(url=url,
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
        name, lon, lat, country_code, population, timezone = row.split("|")

        city = City(name=name, lon=lon, lat=lat,
                    country_code=country_code, timezone=timezone)

        # add user to the session
        db.session.add(city)

    # commit session
    db.session.commit()


if __name__ == "__main__":
    connect_to_db(app)
    db.create_all()

    user_filename = "seed_data/users.txt"
    photo_filename = "seed_data/photos.txt"
    city_filename = "seed_data/cities.txt"
    load_users(user_filename)
    load_photos(photo_filename)
    load_cities(city_filename)
