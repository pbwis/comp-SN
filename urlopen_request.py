from urllib import request

response = request.urlopen('http://google.com')  # example
print('RESPONSE: ', response)
print('URL: ', response.geturl())

headers = response.info()
print('DATE: ', headers['date'])
print('HEADERS: ')
print('------------------')
print(headers)

data = response.read()  # .decode('utf-8') if required. Returns encode error.
print('LENGTH: ', len(data))
print('DATA: ')
print('------------------')
print(data)