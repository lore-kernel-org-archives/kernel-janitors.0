From: Jaco Kroon <jaco@kroon.co.za>
Date: Fri, 09 Feb 2007 17:55:18 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <45CCB586.1010709@kroon.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0338289959=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
To: kernel-janitors@vger.kernel.org

This is a cryptographically signed message in MIME format.

--===============0338289959==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms010305030604090806020701"

This is a cryptographically signed message in MIME format.

--------------ms010305030604090806020701
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Milind Choudhary wrote:
> On 2/8/07, walter harms <wharms@bfs.de> wrote:
> 
>>
>>>There are different variants of BIT using (long|unsigned
>>>long|unsigned|unsigned char) etc.
>>>Do we need to create different macros for each type
>>>Or a single one which takes type as input?
>>
>>bit operations make only sense on integer, so why not stay with long
>>and cast it down if needed ? so you have only one function doing so.
> 
> 
> Michael Veeck  had submitted a patch for the same before
> http://lists.osdl.org/pipermail/kernel-janitors/2005-August/004737.html
> 
> there was some discussion on the list,which did not reach any
> conclusion I guess.
> so we have

> #define BIT(x) (1UL << (x) )
> #define BIT(x) (1UL << ((x) % BITS_PER_LONG))

These two are identical (on x86 hardware at least), except that
BITS_PER_LONG depends on the architecture, 32 on x86 and 64 on x86_64,
and the modulus applied by the CPU depends on the size of x ...

> #define BIT(x) (1ULL << (__builtin_constant_p(x) ? (x) : (x) % 64)

This won't compile (bracket mismatch), but I can't see why you'd want to
differentiate between x being a compiletime constant or a runtime
calculated value ... it just doesn't make sense for me.

Jaco

--------------ms010305030604090806020701
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII/zCC
AtowggJDoAMCAQICEAc4X0nacvPi37jqp2ACtCAwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UE
BhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA3MDIwNTIwMjQyM1oX
DTA4MDIwNTIwMjQyM1owQjEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEfMB0G
CSqGSIb3DQEJARYQamFjb0Brcm9vbi5jby56YTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBALmesqrYuYXZV4SGeKK6kojSi4T6xF4tkd+fD0kFR8Npdp6f3X8KCoIA/Wiy/Y3O
8ggsBBdIht7dF3BGD1nvFUuLYBWp8hVRmdpepVkSbSK68pxUpdv7VJ69PWC29l5mJAXScARs
5TmJxkswasF1eH1qSGQfXlezs7nRS/6XBjfO1qeaPemG3sbbr4VUkugrg3DkbviAU8DR2ER0
mklbSnTHHv05E31iG9d+MmtobskoBlFGLAQnYij/NUcMiTygnmtWu/zRw14BhoTmg3WOGMlc
0yKgh2u30NroBEJNceF3I9suuNMUoGAf8Fg2BAcrYbMSVvKf1i5hEQ4qV6/RoiECAwEAAaMt
MCswGwYDVR0RBBQwEoEQamFjb0Brcm9vbi5jby56YTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3
DQEBBQUAA4GBAIWEb9zolNYvYAv0mV8prJTLB/I32XFGWUDq0h2ZQuaM9X+NZ6s6Aw4enuJR
jscpGXXZAQHF97+nkXfL73H+FS+8ndM2nx/xrjMgFX8HyAXwhfUl1galRkDhWKSI/jEgoLAp
Z+D9HpSGn1RKj4iMi/2Usk+7T1uXzFlXqefiE40TMIIC2jCCAkOgAwIBAgIQBzhfSdpy8+Lf
uOqnYAK0IDANBgkqhkiG9w0BAQUFADBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3Rl
IENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0EwHhcNMDcwMjA1MjAyNDIzWhcNMDgwMjA1MjAyNDIzWjBCMR8wHQYD
VQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMR8wHQYJKoZIhvcNAQkBFhBqYWNvQGtyb29u
LmNvLnphMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuZ6yqti5hdlXhIZ4orqS
iNKLhPrEXi2R358PSQVHw2l2np/dfwoKggD9aLL9jc7yCCwEF0iG3t0XcEYPWe8VS4tgFany
FVGZ2l6lWRJtIrrynFSl2/tUnr09YLb2XmYkBdJwBGzlOYnGSzBqwXV4fWpIZB9eV7OzudFL
/pcGN87Wp5o96YbextuvhVSS6CuDcORu+IBTwNHYRHSaSVtKdMce/TkTfWIb134ya2huySgG
UUYsBCdiKP81RwyJPKCea1a7/NHDXgGGhOaDdY4YyVzTIqCHa7fQ2ugEQk1x4Xcj2y640xSg
YB/wWDYEBythsxJW8p/WLmERDipXr9GiIQIDAQABoy0wKzAbBgNVHREEFDASgRBqYWNvQGty
b29uLmNvLnphMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEFBQADgYEAhYRv3OiU1i9gC/SZ
XymslMsH8jfZcUZZQOrSHZlC5oz1f41nqzoDDh6e4lGOxykZddkBAcX3v6eRd8vvcf4VL7yd
0zafH/GuMyAVfwfIBfCF9SXWBqVGQOFYpIj+MSCgsCln4P0elIafVEqPiIyL/ZSyT7tPW5fM
WVep5+ITjRMwggM/MIICqKADAgECAgENMA0GCSqGSIb3DQEBBQUAMIHRMQswCQYDVQQGEwJa
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
AxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECEAc4X0nacvPi37jqp2AC
tCAwCQYFKw4DAhoFAKCCAcMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMDcwMjA5MTc1NTE4WjAjBgkqhkiG9w0BCQQxFgQUiXnXgtFHoUyk8g6K8VUacIcV
mnswUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZI
hvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgYUGCSsGAQQBgjcQBDF4MHYwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAHOF9J2nLz4t+4
6qdgArQgMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAhAHOF9J2nLz4t+46qdgArQgMA0GCSqGSIb3DQEBAQUABIIB
AInvZ8iuGOVcYGca1vmoPN0RgysShn3rPV+7Kg3SeC9hpAGtlJ2k9DQ2TvSgKIXsvbYNM22N
B3lYgqyYdkXt6uzdJuNxMMWOUa47Ps4ihwrXSFpSP125MAIvBz830CtJHofpXKe+DC2B5V0M
LHPlzf5tXWC2MgKBrLoB3fDzIeP48VdwUOWSMtfFMzGFg7JEupNtqzGwNoPDnFuqdgSb/ePJ
P++1mux4XjCtGdjpUNN9kHwxqqttK8jBBHHqvDb4PDBGqMagG1WjdB3sOUqIv9FNRjkZoPPk
oU1xA1UPNHFMB0Ky2Ot0FF7tSYwR7QY6u99cAsujNYUfABMPAQ0I2uUAAAAAAAA=
--------------ms010305030604090806020701--

--===============0338289959==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0338289959==--
