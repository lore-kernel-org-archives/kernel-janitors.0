From: Jaco Kroon <jaco@kroon.co.za>
Date: Thu, 11 Jan 2007 06:41:02 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <45A5DBFE.1080102@kroon.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1075071582=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

This is a cryptographically signed message in MIME format.

--===============1075071582==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms090909010001050509040802"

This is a cryptographically signed message in MIME format.

--------------ms090909010001050509040802
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Robert P. J. Day wrote:
> On Thu, 11 Jan 2007, Darren Jenkins wrote:
> 
> 
>>also was thinking we should add
>>
>>static inline unsigned long round_down_to_power_of_2(unsigned long i)
>>{
>>
>>+     i &= ~(i>>1);    ????
>>   while (i & (i - 1))
>>       i &= (i - 1);
>>
>>   return i;
>>}
>>
>>which follows from my eirlier idea.
> 
> 
> sorry, what was the rationale for that extra line up there?

It presumably gets rids of a few zeros.  Take for example 11111 as
input.  The first line will actually get the right answer off the bat as
it'll mask out the bottom 4 bits.  However, with something like 11011
it'll leave us with 10010 which will again at the very least reduce the
number of iterations through the loop.  In this case one iteration vs three.

I saw a similar idea for the round-up case where we actually test if we
don't already have a power of two, shift-left by one and and with ~i
(which is then essentially the exact same of what happens above).
Whilst it took me a few minutes to just convince myself that the
orriginal algorithms even work (one of those jewel cases) these
enhancements are pretty impressive and make mathematical sense.

For reference, here is the round-up "initialisation" statement:

    i = (i & (i-1)) ? ((i<<1) & ~i) : i )

Jaco

--------------ms090909010001050509040802
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
CQUxDxcNMDcwMTExMDY0MTAyWjAjBgkqhkiG9w0BCQQxFgQUVZ2rleIHLUqR0FIHcCzZyno6
e/swUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZI
hvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgYUGCSsGAQQBgjcQBDF4MHYwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF
5x4JcaGHMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF5x4JcaGHMA0GCSqGSIb3DQEBAQUABIIB
AMRPUschYeerj8ivPL6qAMIW5lYCS4spLAvf4eUK05TKpODL+/lZvnVl8Avq5LeosM5rEmix
4SjIvoEToAjmKc1UruPJYg4544uUQcJWj1UN/B1EDu8KFpdi81y8t39ZUCVjCk+GUYUVsY3J
5vjltTl2+LsDuYzkfyo4rIYaGoepjxNwLE3yco4OxanrDHvfOHPF0rBp8rM6X8113GJE7viF
LEJmJXp1cSwsNzd8gUnfbcyyjWxNUJPAmAEkoQj1zXIN0ent4H0/HQQJ14TfucIb6TCwCCAU
2dGr8Om4Wgve181XAyFWc0rcjjgtsGKrc79hPyO9Z4VGQXUi/F3jLUMAAAAAAAA=
--------------ms090909010001050509040802--

--===============1075071582==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1075071582==--
