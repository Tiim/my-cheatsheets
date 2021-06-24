#TLS

## generate new self signed certificate

`openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365`

## remove key password

`openssl rsa -in key.pem -out newkey.pem`
