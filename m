From: Jaco Kroon <jaco@kroon.co.za>
Date: Fri, 09 Feb 2007 09:56:29 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <45CC454D.30805@kroon.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1635477853=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
To: kernel-janitors@vger.kernel.org

This is a cryptographically signed message in MIME format.

--===============1635477853==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms070702020709020108020607"

This is a cryptographically signed message in MIME format.

--------------ms070702020709020108020607
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Vignesh Babu BM wrote:
> On Fri, 2007-02-09 at 09:55 +0100, Richard Knutsson wrote:
> 
>>Vignesh Babu BM wrote:
>>
>>>Just went through the archives....
>>>
>>>        I tried to recreate the compile-failure (was some time ago since
>>>        it 
>>>        happened) when using min()/max() in a struct but it happily compiled it 
>>>        so (thankfully) you are correct, just need to use min()/max(). :)
>>>        
>>>        Richard Knutsson
>>>        
>>>Do you mean to say that you were able to compile when the macros were used inside struct?
>>>Im still not able to get that to happen...
>>>
>>>I tried that change in linux-2.6/fs/lockd/mon.c
>>>
>>>static struct rpc_procinfo	nsm_procedures[] = {
>>>[SM_MON] = {
>>>		.p_proc		= SM_MON,
>>>		.p_encode	= (kxdrproc_t) xdr_encode_mon,
>>>		.p_decode	= (kxdrproc_t) xdr_decode_stat_res,
>>>		.p_bufsiz	= max(SM_mon_sz, SM_monres_sz) << 2,

Will work since both SM_mon_sz and SM_monres_sz are compile-time
constants, not true?

[ ... snip ... ]

Jaco

--------------ms070702020709020108020607
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
CQUxDxcNMDcwMjA5MDk1NjI5WjAjBgkqhkiG9w0BCQQxFgQUtA/gSHNaf8imLu5TfKgCCeZ6
Yi4wUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZI
hvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgYUGCSsGAQQBgjcQBDF4MHYwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAHOF9J2nLz4t+4
6qdgArQgMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAhAHOF9J2nLz4t+46qdgArQgMA0GCSqGSIb3DQEBAQUABIIB
ACIJYUCBYMeQfPXqfjKXrX1QFyrvUgji2rP0abdlKjQaE1qBnQ9pNqYa8hPIovmK57INCSCQ
i2f3r+5119UhfXAYmLGeSaWqZs57wqNMFg2Ad6MFyx8qMqI6a2dzlwt0UPa18D2hdA1p8U0I
KZH59zfDqtKwk6MDP7QqZ5gKFbXq7/j3X2MyB88I5yGmwfE/3GvW61SC80xS6zdBrpzdc+gd
6xBC8uBOkWjObWUc1uUG0WbXVMBj9B092+D0Az5RD0rpeOBUGDmWpO2MAv6G2aDz8LXmKDNA
v39O/bwcwEuR9mg/6Qez2lmvqLyPj4LymvxqI6fZkHlqm52NECVer2EAAAAAAAA=
--------------ms070702020709020108020607--

--===============1635477853==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1635477853==--
