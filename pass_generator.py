# first simple version of password generator

from random import *
import string


characters = string.ascii_letters + string.punctuation  + string.digits
password =  "".join(choice(characters) for x in range(randint(6, 12)))
print(password)