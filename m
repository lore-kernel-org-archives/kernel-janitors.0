From: Jaco Kroon <jaco@kroon.co.za>
Date: Sat, 06 Jan 2007 07:47:26 +0000
Subject: Re: [KJ] proper casting (if any) in copy_to_user() calls?
Message-Id: <459F540E.90707@kroon.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0825081415=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

This is a cryptographically signed message in MIME format.

--===============0825081415==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms000502040604070501020000"

This is a cryptographically signed message in MIME format.

--------------ms000502040604070501020000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Ahmed S. Darwish wrote:
> On Fri, Jan 05, 2007 at 08:54:28AM -0500, Robert P. J. Day wrote:
> 
>>you'll notice that numerous calls to copy_to_user() insist on casting
>>the pointer type of the first argument, despite the fact that that
>>first pointer is declared as being of type "void __user *" for the
>>routine itself, so it would seem no pointer is casting is required.
>>
>>  and yet, you can see that calls to copy_to_user() are casting the
>>first argument to (among other types) "char *" and "char __user *" and
>>"void *" and "void __user *" and "unsigned long *" and ... well, you
>>get the idea.  (the same can be said for the second argument to
>>copy_from_user().)
>>
>>  what is the proper rule for casting in this situation?  one would
>>think most of those casts are totally superfluous, no?
> 
> 
> I've written a patch to remove 30 unneeded copy_to_user casts in the infinband 
> subsystem (drivers/infiniband/core) and the result ?. I got 30 warning from 
> gcc while compiling :(.
> 
> The reason of the warnings was that the first argument of copy_to_user is
> unsigned long and not a pointer. so I get the infamous warning:
>  warning: passing argument 1 of ‘copy_to_user’ makes pointer from integer 
>  without a cast
> 
> So Janitors, I think it's better to remove the casts _only_ when the given 
> argument is a pointer and not an unsigned long (why do people use unsigned 
> long and not void* in the beginning anyway ?).

To prevent dereferencing an __user pointer?  But then imho that should
be standard right through the kernel and copy_(to,from)_user should take
unsigned long to begin with.

Jaco

--------------ms000502040604070501020000
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII/zCC
AtowggJDoAMCAQICEGCOKyIwPh/O8sXnHglxoYcwDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UE
BhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA2MDEzMTIwMzYzMloX
DTA3MDEzMTIwMzYzMlowQjEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEfMB0G
CSqGSIb3DQEJARYQamFjb0Brcm9vbi5jby56YTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAM+crsvygldZBbroFVKXOL/kr9Uvdqu1Dy/mOLws6U8LJ3+I4X9DtNnod0u+kzkS
DrEBkLqkD+JtZBwcKp50hFreguFdHQf8Q008Dzb0fxWAPcgxm8TyNRZX8gApa4HtSkBXq739
NM2PqwDfB7TvaS3UQkqzWEQp0a8lggdMtQ4Y/2TlyHt2LDrxwvKiqDDn7frRnI498UoM8hRv
OdSNcIop1MkkYTs1Ln0a05nKsrJZduz5DE0i+gljx7hDxXxdMoDjiORXnyjJSEl/YVvueq7B
yM/XFpT1WAzAiGKrbqxPsxLulpoiar7px39CTU2Dwkee5wqSnRdyEQYLsdcEfzkCAwEAAaMt
MCswGwYDVR0RBBQwEoEQamFjb0Brcm9vbi5jby56YTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3
DQEBBAUAA4GBACMDnVVMrJkMcbDapRLLi4iPjSoU7uTsM2EpBcgMJZeAAHPziTo3ig0UfpFH
d0j0thg2u+7/mYJhwk1Zyy26oQmWIW9PSwzEBDuQ/ORc7z5Gtn0QSqRmVJuuIFtrolU1p7Eg
8Yw8sXzMIWAN4ibEfdokWX51q8IY71oXvECC+SeiMIIC2jCCAkOgAwIBAgIQYI4rIjA+H87y
xeceCXGhhzANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3Rl
IENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0EwHhcNMDYwMTMxMjAzNjMyWhcNMDcwMTMxMjAzNjMyWjBCMR8wHQYD
VQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMR8wHQYJKoZIhvcNAQkBFhBqYWNvQGtyb29u
LmNvLnphMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz5yuy/KCV1kFuugVUpc4
v+Sv1S92q7UPL+Y4vCzpTwsnf4jhf0O02eh3S76TORIOsQGQuqQP4m1kHBwqnnSEWt6C4V0d
B/xDTTwPNvR/FYA9yDGbxPI1FlfyAClrge1KQFervf00zY+rAN8HtO9pLdRCSrNYRCnRryWC
B0y1Dhj/ZOXIe3YsOvHC8qKoMOft+tGcjj3xSgzyFG851I1wiinUySRhOzUufRrTmcqysll2
7PkMTSL6CWPHuEPFfF0ygOOI5FefKMlISX9hW+56rsHIz9cWlPVYDMCIYqturE+zEu6WmiJq
vunHf0JNTYPCR57nCpKdF3IRBgux1wR/OQIDAQABoy0wKzAbBgNVHREEFDASgRBqYWNvQGty
b29uLmNvLnphMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEAIwOdVUysmQxxsNql
EsuLiI+NKhTu5OwzYSkFyAwll4AAc/OJOjeKDRR+kUd3SPS2GDa77v+ZgmHCTVnLLbqhCZYh
b09LDMQEO5D85FzvPka2fRBKpGZUm64gW2uiVTWnsSDxjDyxfMwhYA3iJsR92iRZfnWrwhjv
Whe8QIL5J6IwggM/MIICqKADAgECAgENMA0GCSqGSIb3DQEBBQUAMIHRMQswCQYDVQQGEwJa
QTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoT
EVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERp
dmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG
9w0BCQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0ZS5jb20wHhcNMDMwNzE3MDAwMDAwWhcN
MTMwNzE2MjM1OTU5WjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRp
bmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3Vp
bmcgQ0EwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMSmPFVzVftOucqZWh5owHUEcJ3f
6f+jHuy9zfVb8hp2vX8MOmHyv1HOAdTlUAow1wJjWiyJFXCO3cnwK4Vaqj9xVsuvPAsH5/Ef
kTYkKhPPK9Xzgnc9A74r/rsYPge/QIACZNenprufZdHFKlSFD0gEf6e20TxhBEAeZBlyYLf7
AgMBAAGjgZQwgZEwEgYDVR0TAQH/BAgwBgEB/wIBADBDBgNVHR8EPDA6MDigNqA0hjJodHRw
Oi8vY3JsLnRoYXd0ZS5jb20vVGhhd3RlUGVyc29uYWxGcmVlbWFpbENBLmNybDALBgNVHQ8E
BAMCAQYwKQYDVR0RBCIwIKQeMBwxGjAYBgNVBAMTEVByaXZhdGVMYWJlbDItMTM4MA0GCSqG
SIb3DQEBBQUAA4GBAEiM0VCD6gsuzA2jZqxnD3+vrL7CF6FDlpSdf0whuPg2H6otnzYvwPQc
UCCTcDz9reFhYsPZOhl+hLGZGwDFGguCdJ4lUJRix9sncVcljd2pnDmOjCBPZV+V2vf3h9bG
CE6u9uo05RAaWzVNd+NWIXiC3CEZNd4ksdMdRv9dX2VPMYIDZDCCA2ACAQEwdjBiMQswCQYD
VQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UE
AxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECEGCOKyIwPh/O8sXnHglx
oYcwCQYFKw4DAhoFAKCCAcMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMDcwMTA2MDc0NzI2WjAjBgkqhkiG9w0BCQQxFgQUAvZ1K80Xnx/hB5D7eHNAe5Xt
lGgwUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZI
hvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgYUGCSsGAQQBgjcQBDF4MHYwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF
5x4JcaGHMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF5x4JcaGHMA0GCSqGSIb3DQEBAQUABIIB
AGf4VNoauVFPVrgjAUsQ2viu5vAVXGiF4gKzIW370B50mJgOeW0I1A/0hN7iPx8Gsp44YQm8
eKuMNsmm/CRX5MAfp/ocmKU1jWZZy8HUrOFLhP4+huxG10RHAxJIanvCEVJE8tt8K1loZ8Tp
gPjgds0C7JDZw2GPVGX3+7pmBUDQtC/s6ROaf525dd8txCdWaRxT2y/4UkdKC3N3fOTO7wiC
YfcLV0QVGV9z/TfYJkrnCVXBuIXggl0fntFHaw4FgyzHHY6m/qkKaDQhzomaREVt+9nXXk79
cEW7VKify8QuX7Arxz9IR8uZbxs+csEg7JHUDZtH/BWZsEHy2vpo1f0AAAAAAAA=
--------------ms000502040604070501020000--

--===============0825081415==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0825081415==--
