import unittest
import hashlib

class TestStringMethods(unittest.TestCase):

    def test_upper(self):
        self.assertEqual('foo'.upper(), 'FOO')

    def test_isupper(self):
        self.assertTrue('FOO'.isupper())
        self.assertFalse('Foo'.isupper())

    def test_split(self):
        s = 'hello world'
        self.assertEqual(s.split(), ['hello', 'world'])
        # check that s.split fails when the separator is not a string
        with self.assertRaises(TypeError):
            s.split(2)

class TestOutputFiles(unittest.TestCase):

    def test_dummy_file(self):
        ref_hash = get_sha256(filepath="/tests/files/dummy_output.txt")
        test_hash = get_sha256(filepath="/dummy_output.txt")
        self.assertEqual(test_hash.hexdigest(), ref_hash.hexdigest())

# Thanks: https://www.quickprogrammingtips.com/python/how-to-calculate-sha256-hash-of-a-file-in-python.html
def get_sha256(filepath):
    sha256_hash = hashlib.sha256()
    with open(filepath,"rb") as f:
        # Read and update hash string value in blocks of 4K
        for byte_block in iter(lambda: f.read(4096),b""):
            sha256_hash.update(byte_block)
    return sha256_hash

if __name__ == '__main__':
    unittest.main()