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
