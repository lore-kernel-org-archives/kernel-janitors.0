From: Martin Hecht <hecht@hlrs.de>
Date: Fri, 14 Oct 2016 10:36:25 +0000
Subject: Re: [lustre-devel] [patch] Staging: lustre: indent an if statement
Message-Id: <3ea7f15f-4f53-c303-3c38-064432cb599c@hlrs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------ms020507090802070504030908"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013085202.GE16198@mwanda>
	<alpine.LFD.2.20.1610132338200.18218@casper.infradead.org>
In-Reply-To: <alpine.LFD.2.20.1610132338200.18218@casper.infradead.org>
To: lustre-devel@lists.lustre.org

This is a cryptographically signed message in MIME format.

--------------ms020507090802070504030908
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 10/14/2016 12:38 AM, James Simmons wrote:
>> This if statement wasn't intended.
just to be sure: in conjunction with the subject of the mail this should
read "indented" instead of "intended", right?
- otherwise this would result in a slightly different patch...


> Acked-by: James Simmons <jsimmons@infradead.org>
> =20
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/staging/lustre/lustre/obdclass/cl_object.c b/driv=
ers/staging/lustre/lustre/obdclass/cl_object.c
>> index 3199dd4..a102c36 100644
>> --- a/drivers/staging/lustre/lustre/obdclass/cl_object.c
>> +++ b/drivers/staging/lustre/lustre/obdclass/cl_object.c
>> @@ -335,7 +335,7 @@ int cl_object_getstripe(const struct lu_env *env, =
struct cl_object *obj,
>>  		if (obj->co_ops->coo_getstripe) {
>>  			result =3D obj->co_ops->coo_getstripe(env, obj, uarg);
>>  			if (result)
>> -			break;
>> +				break;
>>  		}
>>  	}
>>  	return result;
>>
> _______________________________________________
> lustre-devel mailing list
> lustre-devel@lists.lustre.org
> http://lists.lustre.org/listinfo.cgi/lustre-devel-lustre.org



--------------ms020507090802070504030908
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
BTcwggUzMIIEG6ADAgECAgcbQV1Cw6KrMA0GCSqGSIb3DQEBCwUAMFgxCzAJBgNVBAYTAkRF
MRMwEQYDVQQKEwpERk4tVmVyZWluMRAwDgYDVQQLEwdERk4tUEtJMSIwIAYDVQQDExlERk4t
VmVyZWluIFBDQSBHcmlkIC0gRzAxMB4XDTE2MDQyODEwMDIyNloXDTE3MDUyNjEwMDIyNlow
ajELMAkGA1UEBhMCREUxFDASBgNVBAoMC0dyaWRHZXJtYW55MR8wHQYDVQQLDBZVbml2ZXJz
aXRhZXQgU3R1dHRnYXJ0MQ0wCwYDVQQLDARITFJTMRUwEwYDVQQDDAxNYXJ0aW4gSGVjaHQw
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDqWHOhADaliqBmViFhCd9ajPmGIOy+
9p+ncoWkLUpS0GtOa3X3+NW3UF8whSIvNavppRkY63207ZqbnS2QWu6FeL859zXyL10maFZd
o80UXpKzRXYq7pStQpWLY4X5CsvdVwFR9ohSZ76jeV2iOr9BbA5fp91KUeXGnT+VLTDOft8u
HYe455vckb1esr5Ar3qJHwxUTesugHDZzpo8VFQVsckQTREi9Vy5q5d4lA0mxbZCEUQQoTZJ
vmY9inm0BY7Fj7YuT0X9lqoxH87tQ8L0cGs3eO7q6GRAOgWlBogapJ1GXseysREeyzb5/+QS
ypZrs4RKv9jdJulfAAEiIoBjAgMBAAGjggHuMIIB6jAMBgNVHRMBAf8EAjAAMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwHQYDVR0OBBYEFHumFD70
J0mTEOjTPSDZFkTRb2iBMB8GA1UdIwQYMBaAFJbs3K2aw/5Qozwi5T3Cxf/K2SLGMBgGA1Ud
EQQRMA+BDWhlY2h0QGhscnMuZGUwKgYDVR0gBCMwITARBg8rBgEEAYGtIYIsAQEDAQYwDAYK
KoZIhvdMBQICATCBgwYDVR0fBHwwejA7oDmgN4Y1aHR0cDovL2NkcDEucGNhLmRmbi5kZS9n
cmlkLXJvb3QtY2EvcHViL2NybC9jYWNybC5jcmwwO6A5oDeGNWh0dHA6Ly9jZHAyLnBjYS5k
Zm4uZGUvZ3JpZC1yb290LWNhL3B1Yi9jcmwvY2FjcmwuY3JsMIGeBggrBgEFBQcBAQSBkTCB
jjBFBggrBgEFBQcwAoY5aHR0cDovL2NkcDEucGNhLmRmbi5kZS9ncmlkLXJvb3QtY2EvcHVi
L2NhY2VydC9jYWNlcnQuY3J0MEUGCCsGAQUFBzAChjlodHRwOi8vY2RwMi5wY2EuZGZuLmRl
L2dyaWQtcm9vdC1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQELBQADggEB
ADp/M9sXjCEVOVOL+pQK9jrKHtUGVRuEdkgAVqZtZoQwalhvx5WoRkXcqILVbw0/HP159UWt
79biquHrBD0ohyvuqimVRLPdQsmFKK/mUWrY3rhZkuCg8u+dLc4rnCWoIV+5I7qtUxb3lXhj
EbuQMAQmYw2A9pI5V6By0OnQcNEESNarN77okuZPMB+mtupvnl9m9mIp2sohG7spaKWUNMTy
tyzdwib1fCnpt75TxqQ3kuOV9AdOln7mhWmSGh4K0b30w/oooGwOoFTrbu1CmGLQP4MiAZdY
+PZCXkmjtyol0YkDTIouxkZd65yADVeC1zYlSjto9nz7eWCBicpQAbwxggNTMIIDTwIBATBj
MFgxCzAJBgNVBAYTAkRFMRMwEQYDVQQKEwpERk4tVmVyZWluMRAwDgYDVQQLEwdERk4tUEtJ
MSIwIAYDVQQDExlERk4tVmVyZWluIFBDQSBHcmlkIC0gRzAxAgcbQV1Cw6KrMA0GCWCGSAFl
AwQCAQUAoIIBwTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0x
NjEwMTQxMDM2MjVaMC8GCSqGSIb3DQEJBDEiBCByupiIZgglckPaCuQ18dvfFCLRvKuQpeDW
0Ot5PaEA0TBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYI
KoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqG
SIb3DQMCAgEoMHIGCSsGAQQBgjcQBDFlMGMwWDELMAkGA1UEBhMCREUxEzARBgNVBAoTCkRG
Ti1WZXJlaW4xEDAOBgNVBAsTB0RGTi1QS0kxIjAgBgNVBAMTGURGTi1WZXJlaW4gUENBIEdy
aWQgLSBHMDECBxtBXULDoqswdAYLKoZIhvcNAQkQAgsxZaBjMFgxCzAJBgNVBAYTAkRFMRMw
EQYDVQQKEwpERk4tVmVyZWluMRAwDgYDVQQLEwdERk4tUEtJMSIwIAYDVQQDExlERk4tVmVy
ZWluIFBDQSBHcmlkIC0gRzAxAgcbQV1Cw6KrMA0GCSqGSIb3DQEBAQUABIIBABCYJaRJUkpE
KEuLXySyZydPYF9mEBRYVNEbigzIZ+jNTFLGA8SDh8uOt1icuQ4RT/Rz8l0e0NALSV87K1/3
gIm7XAXrjSBtBPKywNkCC0AxTeu2e4gayJvzAHwZZjTF7S+f6cYBAE5syVBDscpuM7opQD5U
8g6mLQy62Niz1bNfa+PFjbf59Jv8662zcBDJo/qQ6tJ2wTIXgplwT8UQIl+/x1uOfW68R75m
2GD/hYj3o88Iu4HBoBMNHqv7rs6Q06u/ocLzdxv+hZGYkyRbAh7bPy8G+hig0WTFdvJ0SCzK
xCTjO/TfMoyruKPnmIoFYwrw/VFT9bm+zXaQd3v9BGwAAAAAAAA=
--------------ms020507090802070504030908--
