p12=$1
pass=$2

openssl pkcs12 -clcerts -nokeys -in $p12 \
      -out certificate.crt -password pass:$pass -passin pass:$pass

openssl pkcs12 -cacerts -nokeys -in $p12 \
      -out ca-cert.ca -password pass:$pass -passin pass:$pass

openssl pkcs12 -nocerts -in $p12 \
      -out private.key -password pass:$pass -passin pass:$pass \
      -passout pass:TemporaryPassword

openssl rsa -in private.key -out "NewKeyFile.key" \
      -passin pass:TemporaryPassword

cat "NewKeyFile.key"  \
      "certificate.crt" \
      "ca-cert.ca" > PEM.pem

openssl pkcs12 -export -nodes -CAfile ca-cert.ca \
      -passin pass: -password pass: -in PEM.pem -out "${p12}.new"
