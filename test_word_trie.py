import unittest
from word_trie import *


class TestTrie(unittest.TestCase):

    def test_add_word(self):
        '''Tests if word is successfully added to the Trie'''

        t = Trie()
        t.add_word('apple')

        self.assertEqual(len(t.root.children), 1)
        self.assertEqual(t.root.children[0].words, ['apple'])

    def test_add_words(self):
        '''Tests if a list of words are added to the Trie'''

        t = Trie()
        t.add_words(['apple', 'applause', 'application'])

        self.assertEqual(t.search('apple'), True)
        self.assertEqual(t.search('applause'), True)
        self.assertEqual(t.search('application'), True)
        self.assertEqual(t.search('banana'), False)

    def test_prefix_search(self):
        '''Tests if prefix search returns the correct words'''

        t = Trie()
        t.add_words(['apple', 'applause', 'application', 'berry', 'banana'])

        self.assertEqual(t.prefix_search('app'), [
                         'applause', 'apple', 'application'])
        self.assertEqual(t.prefix_search('b'), ['banana', 'berry'])
        self.assertEqual(t.prefix_search('ca'), None)


if __name__ == "__main__": # pragma: no cover
    unittest.main()
