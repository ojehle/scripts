$StoreName = [System.Security.Cryptography.X509Certificates.StoreName]
$StoreLocation = [System.Security.Cryptography.X509Certificates.StoreLocation]
$OpenFlags = [System.Security.Cryptography.X509Certificates.OpenFlags]
$Store = [System.Security.Cryptography.X509Certificates.X509Store]::new( $StoreName::My, $StoreLocation::CurrentUser)

# In researching supported and unsupported features in .NET core's Web Cmdlets I discovered that the certificate stores are working in .NET on both Linux and macOS. they can be directly manipulated via the .NET APIs through pwsh. On Linux, the current user my store gets created in ~/.dotnet/corefx/cryptography/x509stores/my. on macOS it is using Apple's Security.Framework API.

# Get a certificate
$X509Certificate2 = [System.Security.Cryptography.X509Certificates.X509Certificate2]
$CertPath = (Resolve-Path 'ClientCert.pfx').Path
$Cert = $X509Certificate2::New($CertPath, 'password')

# Open the store, Add the cert, Close the store.
$Store.Open($OpenFlags::ReadWrite)
$Store.Add($Cert)
$Store.Close()
