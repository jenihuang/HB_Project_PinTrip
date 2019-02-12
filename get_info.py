from pprint import pformat, pprint
import os
import flickrapi
import json
from model import *


def cityname_is_valid(cityname):
    '''returns True if the city is in the database, false otherwise'''
    city_remove_whitespace = cityname.strip()
    city_title_case = city_remove_whitespace.title()
    city = City.query.get(city_title_case)

    return city


def get_photos_by_search(cityname, tag):
