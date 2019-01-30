import unittest
import users


class TestUser(unittest.TestCase):
    def test_is_valid(self):
        a = users.User('j@yahoo.com', 'Abc123')
        b = users.User('j@yahoo.com', 'kayak')
        c = users.User('12#$!3@yahoo.com', 'Abc123')
        self.assertEqual(a.is_valid(), True)
        self.assertEqual(b.is_valid(), False)
        self.assertEqual(c.is_valid(), False)

    def test_email_isvalid(self):
        self.assertEqual(users.email_isvalid('j@yahoo.com'), True)
        self.assertEqual(users.email_isvalid('beyonce32@gmail.com'), True)
        self.assertEqual(users.email_isvalid('12345@gmail.com'), True)
        self.assertEqual(users.email_isvalid('jk@blue@gmail.com'), False)
        self.assertEqual(users.email_isvalid('abc!@#123@gmail.com'), False)

    def test_password_isvalid(self):
        self.assertEqual(users.password_isvalid('kayak'), False)
        self.assertEqual(users.password_isvalid('abc123'), False)
        self.assertEqual(users.password_isvalid('Abc123'), True)
        self.assertEqual(users.password_isvalid('ABC123'), False)
        self.assertEqual(users.password_isvalid('!#@$Aa5'), True)


class TestUserManager(unittest.TestCase):
    def test_create_user(self):
        self.assertEqual(users.UserManager.create_user(
            'j@yahoo.com', 'Abc123'), True)
        self.assertEqual(users.UserManager.create_user(
            'j@yahoo.com', 'kayak'), False)
        self.assertEqual(users.UserManager.create_user(
            '12#!3@yahoo.com', 'Abc123'), False)


if __name__ == '__main__':
    unittest.main()
