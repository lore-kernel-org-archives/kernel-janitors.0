From: Jaco Kroon <jaco@kroon.co.za>
Date: Sun, 05 Mar 2006 21:09:19 +0000
Subject: Re: [KJ] [Patch] kzalloc() conversion in  lib/
Message-Id: <440B537F.2040300@kroon.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63647812329445053=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141548097.6426.9.camel@alice>
In-Reply-To: <1141548097.6426.9.camel@alice>
To: kernel-janitors@vger.kernel.org

This is a cryptographically signed message in MIME format.

--===============63647812329445053==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms030800060001090100090608"

This is a cryptographically signed message in MIME format.

--------------ms030800060001090100090608
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Eric Sesterhenn wrote:
> hi,
> 
> 
>>>--- linux-2.6.16-rc5-mm1/lib/genalloc.c.orig
>>>+++ linux-2.6.16-rc5-mm1/lib/genalloc.c
>>>@@ -47,20 +47,17 @@ struct gen_pool *gen_pool_create(int nr_
>>> 	if (!max_chunk_shift)
>>> 		max_chunk_shift = PAGE_SHIFT;
>>>
>>>-	poolp = kmalloc(sizeof(struct gen_pool), GFP_KERNEL);
>>>+	poolp = kzalloc(sizeof(struct gen_pool), GFP_KERNEL);
>>> 	if (!poolp)
>>> 		return NULL;
>>>-	memset(poolp, 0, sizeof(struct gen_pool));
>>>-	poolp->h = kmalloc(sizeof(struct gen_pool_link) *
>>>-			   (max_chunk_shift - ALLOC_MIN_SHIFT + 1),
>>>-			   GFP_KERNEL);
>>>+	poolp->h = kcalloc((max_chunk_shift - ALLOC_MIN_SHIFT + ),
>>
>>This will screw ia64.
> 
> attached patch below. Is there something like a cross compiler live cd,
> so one can put time where concentration is missing to catch such stuff?

Why would you need a cross-compiler live cd?  I've used the Gentoo
crossdev package on Friday to build cross-compilers on my system for
other architectures which would allow you to pass two flags to the
kernel build process, for example:

$ make ARCH=ia64 CROSS_COMPILE=x86_64-pc-linux-gnu- allyesconfig
$ make ARCH=ia64 CROSS_COMPILE=x86_64-pc-linux-gnu-

to build for ia64, or to build for armeb:

$ make ARCH=arm CROSS_COMPILE=armeb-unknown-linux-gnu- ixdp2801_defconfig
$ make ARCH=arm CROSS_COMPILE=armeb-unknown-linux-gnu-

And so forth.  This of course assumes that the required compilers exist.

Jaco
-- 
There are only 10 kinds of people in this world,
  those that understand binary and those that don't.
http://www.kroon.co.za/

--------------ms030800060001090100090608
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
CQUxDxcNMDYwMzA1MjEwOTE5WjAjBgkqhkiG9w0BCQQxFgQUCy7rJWx9Rx/Suc2csDgQR+hg
/K0wUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZI
hvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgYUGCSsGAQQBgjcQBDF4MHYwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF
5x4JcaGHMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF5x4JcaGHMA0GCSqGSIb3DQEBAQUABIIB
ACmjbFPndi2NMWSphNjxY5yjnd3tgiMdyU67/2+gXFLTKt85guI6ldX1MWEC5Y1sjlMOVosU
GgFomtxv4YHMlpw6zKNpzZxfK4Kn4RMLRBrdbpvjjmvNSc1jnSAjL9J6LNjtxv7cvhMAYCQb
/oc3NeGYuLexnmNfBMD2Agt9KgOBKp4dNACI6jQgjdWlbDTIFA8fXiLK+qlq4tP1rtDUKTBQ
V6fuA0OC1/6b+/0TuYWjsk8KRLyMX0yB6Mz2TuVdAtdDSQ1INsXVKFPpWdzF0+bsPRe8B+7v
eO/ZdN+5cfEai6YmIv0eNHTuX1o8IJ7zZlhJP4rieuw9XCWe7+ryTMwAAAAAAAA=
--------------ms030800060001090100090608--

--===============63647812329445053==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63647812329445053==--
