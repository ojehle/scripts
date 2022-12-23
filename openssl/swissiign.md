# Swisssign

## pkcs12

```bash
openssl pkcs12 -clcerts -nokeys -in oliver.jehle@h35.li.p12 -out certficiate.pem
openssl pkcs12 -nocerts -in oliver.jehle@h35.li.p12 -out key.pem -password xxxx
openssl rsa -in key.pem -out key.pem.nopass
cat swisssign_rsa_smime_lcp_ica_2021_2.pem swisssign_rsa_smime_root_ca_2021_1.pem swisssign_gold_g2.pem > ca-cert.pem
cat key.pem certficiate.pem swisssign_rsa_smime_lcp_ica_2021_2.pem swisssign_rsa_smime_root_ca_2021_1.pem swisssign_gold_g2.pem > cert.pem
openssl pkcs12 -export -nodes -CAfile ca-cert.pem -in cert.pem -out oliver.jehle@h35.li.pkcs12
```

## Exchange

Install p12 in windows
 -> export all CA Certificates as SST -> swisssign.sst

```pwsh
Install-Module -Name ExchangeOnlineManagement -force
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline -UserPrincipalName oliver.jehle@h35.li
Set-SmimeConfig -SMIMECertificateIssuingCA ([System.IO.File]::ReadAllBytes('C:\My
Documents\myvirtualcertcollection.sst'))
```

install pkcs12 to outlook (send pkcs12 via email )

wait 12 hours to update for ios outlook

