class TrieNode():

    def __init__(self, value):
        self.value = value
        self.children = []
        self.words = []
        self.word = None


class Trie():

    def __init__(self):
        self.root = TrieNode(None)

    def add_words(self, arr):

        for word in arr:
            self.add_word(word)

    def add_word(self, word):

        traverse = self.root

        for letter in word:
            found = False
            for c in traverse.children:
                if c.value == letter:
                    traverse = c
                    traverse.words.append(word)
                    found = True
                    break

            if not found:
                n = TrieNode(letter)
                traverse.children.append(n)
                traverse = n
                traverse.words.append(word)

        traverse.word = word

    def search(self, word):

        traverse = self.root

        for letter in word:
            found = False
            for c in traverse.children:
                if c.value == letter:
                    traverse = c
                    found = True
                    break

            if not found:
                return False

        return (traverse.word is not None)

    def prefix_search_cached(self, prefix):

        traverse = self.root

        for letter in prefix:
            found = False
            for c in traverse.children:
                if c.value == letter:
                    traverse = c
                    found = True
                    break

            if not found:
                return None

        return sorted(traverse.words)

    def prefix_search(self, prefix):

        traverse = self.root

        for letter in prefix:
            found = False
            for c in traverse.children:
                if c.value == letter:
                    traverse = c
                    found = True
                    break

            if not found:
                return None

        return self.traverse_DFS(traverse)

    def traverse_DFS(self, node):
        '''do DFS on traverse node, once hit child with self.word, 
        then append the whole route to the results'''

        if not node.children:
            if node.word:
                return [node.word]
            else:
                return []
        else:
            results = []
            if node.word:
                results.append(node.word)

            for c in node.children:
                results.extend(self.traverse_DFS(c))
            return results


keys = ['abu dhabi', 'adelaide', 'albuquerque', 'alexandria', 'amsterdam',
        'athens', 'austin', 'baghdad', 'baltimore', 'bangkok', 'barcelona',
        'beijing', 'berlin', 'birmingham', 'boston', 'brisbane', 'bristol',
        'brooklyn', 'brussels', 'budapest', 'buenos aires', 'busan', 'cairo',
        'calgary', 'cancun', 'cape town', 'casablanca', 'charlotte', 'chengdu',
        'chennai', 'chiba', 'chicago', 'chongqing', 'colombo', 'columbus',
        'copenhagen', 'cozumel', 'da nang', 'dakar', 'dalian', 'dallas',
        'delhi', 'denpasar', 'denver', 'detroit', 'dhaka', 'dubai', 'dublin',
        'edmonton', 'el paso', 'fort worth', 'genoa', 'giza', 'gold coast',
        'guangzhou', 'guatemala city', 'guilin', 'hanoi', 'havana',
        'hiroshima', 'ho chi minh city', 'hong kong', 'houston', 'hyderabad',
        'incheon', 'indianapolis', 'islamabad', 'istanbul', 'jacksonville',
        'jaipur', 'jakarta', 'jeddah', 'jeonju', 'jerusalem', 'johannesburg',
        'karachi', 'kathmandu', 'kawasaki', 'kingston', 'kobe', 'kyoto',
        'lagos', 'las vegas', 'leicester', 'lijiang', 'lima', 'lisbon',
        'liverpool', 'london', 'los angeles', 'macau', 'madrid', 'malang',
        'mandalay', 'manhattan', 'manila', 'mecca', 'melbourne', 'memphis',
        'mexico city', 'milan', 'monterey', 'montreal', 'moscow', 'mumbai',
        'munich', 'muscat', 'nanjing', 'napa', 'naples', 'nashville',
        'new york city', 'nottingham', 'odessa', 'oklahoma city', 'osaka',
        'oslo', 'ottawa', 'padang', 'paris', 'perth', 'philadelphia', 'phoenix',
        'port elizabeth', 'port-au-prince', 'portland', 'prague', 'pyongyang',
        'qingdao', 'quebec', 'queens', 'queenstown', 'reno', 'rio de janeiro',
        'rome', 'saint petersburg', 'salvador', 'san diego', 'san francisco',
        'san jose', 'sao paulo', 'sapporo', 'seattle', 'seoul', 'shanghai',
        'shenzhen', 'singapore', 'stockholm', 'sydney', 'tainan', 'taipei',
        'tangshan', 'tianjin', 'tijuana', 'tokyo', 'toronto', 'tucson', 'tunis',
        'vancouver', 'vienna', 'warsaw', 'washington dc', 'wellington',
        'winnipeg', 'wuhan', 'xian', 'yokohama']

t = Trie()
t.add_words(keys)
