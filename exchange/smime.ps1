Install-Module -Name ExchangeOnlineManagement -force
Update-Module -Name ExchangeOnlineManagement                                    Import-Module ExchangeOnlineManagement              

Connect-ExchangeOnline -UserPrincipalName oliver.jehle@h35.li
get-smimeconfig
set-smimeconfig -SMIMECertificateIssuingCA ([System.IO.File]::ReadAllBytes('C:\My
Documents\myvirtualcertcollection.sst'))
