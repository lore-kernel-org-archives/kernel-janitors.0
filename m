From: Jaco Kroon <jaco@kroon.co.za>
Date: Sat, 04 Feb 2006 16:17:49 +0000
Subject: Re: [KJ] [PATCH] - request_region
Message-Id: <43E4D3AD.7040001@kroon.co.za>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10480560108303671=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060204104722.3vjv1fgevs0kwcs4@webmail.rongage.org>
In-Reply-To: <20060204104722.3vjv1fgevs0kwcs4@webmail.rongage.org>
To: kernel-janitors@vger.kernel.org

This is a cryptographically signed message in MIME format.

--===============10480560108303671==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms070805060207060404030904"

This is a cryptographically signed message in MIME format.

--------------ms070805060207060404030904
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ron Gage wrote:
> Greetings:
> 
> Trial patch - want to make sure that I am doing things "correctly" before I dive
> in too far...
> 
> diff -ur linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c
> linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c

I don't think there is a reason to show the diff command.

> --- linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c  2006-01-02
> 21:21:10.000000000 -0600
> +++ linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c       2006-02-04
> 10:29:03.000000000 -0600

line wrapped.

> @@ -142,9 +142,12 @@
>                 tmp = inl (PCI_REG(SH7751_PCIPAR));
>                 outl (0x80000000, PCI_REG(SH7751_PCIPAR));
>                 if (inl (PCI_REG(SH7751_PCIPAR)) == 0x80000000) {
> +                       struct resource *region;
>                         outl (tmp, PCI_REG(SH7751_PCIPAR));
>                         printk(KERN_INFO "PCI: Using configuration type 1\n");
> -                       request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI conf1");
> +                       region = request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI
> conf1");
> +                       if (!region)
> +                               return -EBUSY;
>                         return 0;
>                 }
>                 outl (tmp, PCI_REG(SH7751_PCIPAR));

the leading whitespace in this case is spaces, it should be tabs.
Easily converted with the unexpand utility but that is an extra step and
will break the patch as one will then need to also add an extra space in
for every line that doesn't start with a + or a -.

Jaco
-- 
There are only 10 kinds of people in this world,
  those that understand binary and those that don't.
http://www.kroon.co.za/

--------------ms070805060207060404030904
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
CQUxDxcNMDYwMjA0MTYxNzQ5WjAjBgkqhkiG9w0BCQQxFgQUUrtUuEra7H01wZpeSdF396l9
AEEwUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZI
hvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgYUGCSsGAQQBgjcQBDF4MHYwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAq
BgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF
5x4JcaGHMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAhBgjisiMD4fzvLF5x4JcaGHMA0GCSqGSIb3DQEBAQUABIIB
AE6kBBj5RGbA5SPYs1KWH27RUWKTGv9l7cSjDWUMr0R80uDwhcv4LmPjzxNZUQlSFqhVe0Cz
zNyFtj6Ongkvs+BaLOn5yTjmXtk6zbJCBNi5z5bnwosZP8iGho5PjkRKA6isjw3yF3aWGk+g
9af9sfYbFzWBYm1+V+r5bsHmNVCDJBlFsHN1RDG06B2VvnW5WhG2UT7CDzghaaY7rnbnQPKX
h85e68zwt/Wr11VHnO7GGRd7OdgVAF3bVQ7KwH+Q+7TUKfmna1yQR+Odg6hSbyzT9dPJssqw
cvh2WS5FTIX8dj84G5CeEHNV8sbWMeAfl9Ouz9SkyiShWYRIE4qrDjQAAAAAAAA=
--------------ms070805060207060404030904--

--===============10480560108303671==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10480560108303671==--
