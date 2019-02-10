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
                      lon=lon)

        db.session.add(photo)

    db.session.commit()


def load_cities(csv_filename):
    """Load cities from file into database."""

    print("Cities")

    selected = {'Tucson', 'Jerusalem', 'Muscat', 'Odessa', 'Memphis', 'Vancouver', 'Chengdu', 'Phoenix', 'Quebec', 'Qingdao', 'Busan', 'Shanghai', 'Port Elizabeth', 'Brussels', 'Kingston', 'Calgary', 'Jaipur', 'Amsterdam', 'Cancun', 'Dallas', 'Portland', 'Leicester', 'Delhi', 'Birmingham', 'Las Vegas', 'El Paso', 'Hiroshima', 'Shenzhen', 'Detroit', 'Port-au-Prince', 'Baghdad', 'Guatemala City', 'Milan', 'Mexico City', 'Sydney', 'Sao Paulo', 'Saint Petersburg', 'Padang', 'San Jose', 'Adelaide', 'Madrid', 'Tunis', 'Rio de Janeiro', 'Tainan', 'Jakarta', 'Chicago', 'Brooklyn', 'Guilin', 'Hong Kong', 'Islamabad', "Xi'an", 'Columbus', 'Kyoto', 'Perth', 'Ottawa', 'Mecca', 'Manhattan', 'Hanoi', 'Genoa', 'Baltimore', 'Fort Worth', 'Lagos', 'Salvador', 'Havana', 'Cairo', 'Da Nang', 'Chongqing', 'Jeddah', 'Dublin', 'Abu Dhabi', 'Jeonju', 'Austin', 'Ho Chi Minh City', 'Jacksonville', 'Colombo', 'Pyongyang', 'Brisbane', 'Kobe', 'San Francisco', 'Kawasaki',
                'Kathmandu', 'Denpasar', 'Dalian', 'Chennai', 'Singapore', 'Dakar', 'Giza', 'Malang', 'Bangkok', 'Osaka', 'Nanjing', 'Tijuana', 'Charlotte', 'Bristol', 'San Diego', 'Sapporo', 'Stockholm', 'Alexandria', 'Queens', 'Philadelphia', 'Montreal', 'Johannesburg', 'Houston', 'Barcelona', 'Incheon', 'Washington, D.C.', 'Taipei', 'Gold Coast', 'Liverpool', 'Vienna', 'Lima', 'Dubai', 'Guangzhou', 'Tokyo', 'Mumbai', 'Buenos Aires', 'Tangshan', 'Naples', 'Nottingham', 'Milwaukee', 'Hyderabad', 'Dhaka', 'Seoul', 'New York City', 'Munich', 'Albuquerque', 'Berlin', 'Budapest', 'Mandalay', 'Beijing', 'Prague', 'Macau', 'Winnipeg', 'Wuhan', 'Lijiang', 'Moscow', 'Melbourne', 'Chiba', 'Karachi', 'Oklahoma City', 'Athens', 'Istanbul', 'Toronto', 'London', 'Warsaw', 'Manila', 'Nashville', 'Oslo', 'Lisbon', 'Casablanca', 'Seattle', 'Boston', 'Los Angeles', 'Tianjin', 'Copenhagen', 'Rome', 'Indianapolis', 'Cape Town', 'Edmonton', 'Denver', 'Yokohama', 'Paris'}

    # create seed data file for selected travel cities
    with open(csv_filename, newline='', encoding='ISO-8859-1') as f:
        reader = csv.reader(f)
        for row in reader:
            if row[2] in selected:
                # rows representing name, long, lat, country, population, timezone
                new = [row[2], row[4], row[5], row[8], row[14], row[-2]]
                name, lat, lon, country, population, timezone = new

                lon = float(lon)
                lat = float(lat)
                population = int(population)

                city = City(name=name, lon=lon, lat=lat,
                            country=country, timezone=timezone)

                db.session.add(city)

    db.session.commit()


if __name__ == "__main__":
    connect_to_db(app)
    db.create_all()

    user_filename = "seed_data/users.txt"
    photo_filename = "seed_data/photos.txt"
    city_filename = "seed_data/cities15000.csv"
    load_users(user_filename)
    load_photos(photo_filename)
    load_cities(city_filename)
