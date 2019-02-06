import re
import string
from flask import session


class User:

    def __init__(self, email, password, firstname=None, lastname=None):
        self.email = email
        self.password = password

    def __repr__(self):
        return 'User: {}'.format(self.email)

    def is_valid(self):
        """checks if email and password are both valid"""
        if email_isvalid(self.email) and password_isvalid(self.password):
            return True
        else:
            return False

    def email_isvalid(email):
        """checks if input email is a valid email format"""
        if not re.match(r"^[A-Za-z0-9\.\+_-]+@[A-Za-z0-9\._-]+\.[a-zA-Z]*$",
                        email):
            return False
        else:
            return True

    def password_isvalid(password):
        """checks if password contains at least 1 of uppercase letter, lowercase
        letter, integer, and is at least 6 characters long."""

        numFlag = False
        lowFlag = False
        upFlag = False

        if len(password) < 6:
            return False
        for i in password:
            if i in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']:
                numFlag = True
            if i in list(string.ascii_uppercase):
                upFlag = True
            if i in list(string.ascii_lowercase):
                lowFlag = True
        if numFlag and lowFlag and upFlag:
            return True
        else:
            return False

    @classmethod
    def create_user(cls, email, password):
        """creates a new user if email and password are both valid and user 
        not currently in database"""
        user = User(email, password)
        if user.is_valid() and user not in all_users:
            self.all_users.append(user)
            return True
        else:
            return False

###############################################################################


class UserManager:

    def __init__(self):
        """creates an empty list to keep track of all users in the database"""
        self.count = len(self.all_users)

    def create_user(self, email, password):
        """creates a new user if email and password are both valid and user 
        not currently in database"""
        user = User(email, password)
        if user.is_valid() and user not in all_users:
            self.all_users.append(user)
            return True
        else:
            return False

    def get_user_by_email(self, email):
        """returns a user object from all_users database by email"""
        for user in all_users:
            if email == user.email:
                return user
        return None

    def delete_user(self, email):
        """removes a user permanently from the database"""
        user = self.get_user_by_email(email)
        if user:
            self.all_users.remove(user)
            return True
        else:
            return False

###############################################################################


# class LoginManager:

#     def __init__(self):
