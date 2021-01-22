import socket

HOSTS = [
    'www.yahoo.com',
    'www.python.org',
    'www.onet.pl',
]

for host in HOSTS:
    print(host)
    try:
        name, aliases, addresses = socket.gethostbyname_ex(host)
        print('Hostname:', name)
        print('Aliases:', aliases)
        print('Addresses:', addresses)
    except socket.error as msg:
        print('ERROR:', msg)
    print()


# example of output
# www.yahoo.com
# Hostname: new-fp-shed.wg1.b.yahoo.com
# Aliases: ['www.yahoo.com']
# Addresses: ['87.248.100.215', '87.248.100.216']
