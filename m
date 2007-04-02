From: <surya.prabhakar@wipro.com>
Date: Mon, 02 Apr 2007 03:39:21 +0000
Subject: Re: [KJ] my first janitorial
Message-Id: <1175484441.3236.4.camel@bluegenie>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0756237579=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
In-Reply-To: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
To: kernel-janitors@vger.kernel.org


--===============0756237579==
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-Dqw+GYgNWN2l2iRxsgrU"
Content-class: urn:content-classes:message


--=-Dqw+GYgNWN2l2iRxsgrU
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Greg,
   In my earlier mails I did send patches for cleanup related to almost
all instances of pci_find_device cleanup ( archives can be checked ) .
Unfortunately the driver maintainer never responded. And people are
doing the same thing again.
thanks.


On Sat, 2007-03-31 at 07:32 -0700, Greg KH wrote:
> On Sat, Mar 31, 2007 at 06:39:01AM -0700, Pedram M wrote:
> > for: drivers/char/istallion.c
> >=20
> >=20
> > @@ -4590,7 +4590,7 @@
> >         printk("stli_findpcibrds()\n");
> >  #endif
> >=20
> > -       while ((dev =3D pci_find_device(PCI_VENDOR_ID_STALLION,
> > +       while ((dev =3D pci_get_device(PCI_VENDOR_ID_STALLION,
>=20
> I think this leaks the reference count on the pci device.  Where do you
> decrement it?
>=20
> Please read the documentation for the pci_get_device() function, it is
> not a simple search-and-replace fix for this task.
>=20
> thanks,
>=20
> greg k-h
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--=20
surya.
02/04/2007

--=-Dqw+GYgNWN2l2iRxsgrU
Content-Type: application/x-pkcs7-signature; name=smime.p7s
Content-Disposition: attachment; filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJIzCCAuww
ggJVoAMCAQICEG8zftGmvYfSeKA1FishBukwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA3MDMyMjExNTExNloXDTA4MDMyMTExNTEx
NlowSzEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEoMCYGCSqGSIb3DQEJARYZc3Vy
eWEucHJhYmhha2FyQHdpcHJvLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAN/+
l9Kx40VowHNy1cV5enxc1UE6Dw52tCjR1fyyTrYXdb8Xir04OhwY+++irn6eIMFclcTVAHfTXgWR
rXgBmi1AcFPy2zhDwHOc9f4Kj+KMddJYKe5zSdh8KqRXgAr8MoZ1fBiq/KrKZq9vUzwCW3Q0nJDC
S8c3zG1GPQMmQZCYdoXiuFEmPOYqiNmu3gCJicTs9lgxB6j+5XiGcHrn8KHlHe3kqODpMHfVnxmk
Y/Z1A0NkDfFwbqNj/85zTAusk3ZLqvSRScR0F3AA132aZ1LA0tVG6a1u8Ki5cpQrgFvkF1eFqUiu
DMht+EUkzaW25I8Lbon1YCEko5DARpRhc9ECAwEAAaM2MDQwJAYDVR0RBB0wG4EZc3VyeWEucHJh
Ymhha2FyQHdpcHJvLmNvbTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBAAMG17rbLz6X
A1n8zcIjX8+oGrJIaOo2metS9rZ/muMfvz5tqhrrWGaFxbwjy6czu13wkryXnEHuzQ+P1RYi4MLe
ai6xAXzfjDIbJvUfbhp4gUxtDgJQa+QjS3BDwh55iG2KuBLa3yM6Z1ot4i6J4+rUcMSrlAaDx+e2
yEPbqp8gMIIC7DCCAlWgAwIBAgIQbzN+0aa9h9J4oDUWKyEG6TANBgkqhkiG9w0BAQUFADBiMQsw
CQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UE
AxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDcwMzIyMTE1MTE2WhcN
MDgwMzIxMTE1MTE2WjBLMR8wHQYDVQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMSgwJgYJKoZI
hvcNAQkBFhlzdXJ5YS5wcmFiaGFrYXJAd2lwcm8uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEA3/6X0rHjRWjAc3LVxXl6fFzVQToPDna0KNHV/LJOthd1vxeKvTg6HBj776Kufp4g
wVyVxNUAd9NeBZGteAGaLUBwU/LbOEPAc5z1/gqP4ox10lgp7nNJ2HwqpFeACvwyhnV8GKr8qspm
r29TPAJbdDSckMJLxzfMbUY9AyZBkJh2heK4USY85iqI2a7eAImJxOz2WDEHqP7leIZweufwoeUd
7eSo4Okwd9WfGaRj9nUDQ2QN8XBuo2P/znNMC6yTdkuq9JFJxHQXcADXfZpnUsDS1UbprW7wqLly
lCuAW+QXV4WpSK4MyG34RSTNpbbkjwtuifVgISSjkMBGlGFz0QIDAQABozYwNDAkBgNVHREEHTAb
gRlzdXJ5YS5wcmFiaGFrYXJAd2lwcm8uY29tMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEFBQAD
gYEAAwbXutsvPpcDWfzNwiNfz6gaskho6jaZ61L2tn+a4x+/Pm2qGutYZoXFvCPLpzO7XfCSvJec
Qe7ND4/VFiLgwt5qLrEBfN+MMhsm9R9uGniBTG0OAlBr5CNLcEPCHnmIbYq4EtrfIzpnWi3iLonj
6tRwxKuUBoPH57bIQ9uqnyAwggM/MIICqKADAgECAgENMA0GCSqGSIb3DQEBBQUAMIHRMQswCQYD
VQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNV
BAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERp
dmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0B
CQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0ZS5jb20wHhcNMDMwNzE3MDAwMDAwWhcNMTMwNzE2
MjM1OTU5WjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkg
THRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwgZ8wDQYJ
KoZIhvcNAQEBBQADgY0AMIGJAoGBAMSmPFVzVftOucqZWh5owHUEcJ3f6f+jHuy9zfVb8hp2vX8M
OmHyv1HOAdTlUAow1wJjWiyJFXCO3cnwK4Vaqj9xVsuvPAsH5/EfkTYkKhPPK9Xzgnc9A74r/rsY
Pge/QIACZNenprufZdHFKlSFD0gEf6e20TxhBEAeZBlyYLf7AgMBAAGjgZQwgZEwEgYDVR0TAQH/
BAgwBgEB/wIBADBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsLnRoYXd0ZS5jb20vVGhhd3Rl
UGVyc29uYWxGcmVlbWFpbENBLmNybDALBgNVHQ8EBAMCAQYwKQYDVR0RBCIwIKQeMBwxGjAYBgNV
BAMTEVByaXZhdGVMYWJlbDItMTM4MA0GCSqGSIb3DQEBBQUAA4GBAEiM0VCD6gsuzA2jZqxnD3+v
rL7CF6FDlpSdf0whuPg2H6otnzYvwPQcUCCTcDz9reFhYsPZOhl+hLGZGwDFGguCdJ4lUJRix9sn
cVcljd2pnDmOjCBPZV+V2vf3h9bGCE6u9uo05RAaWzVNd+NWIXiC3CEZNd4ksdMdRv9dX2VPMYID
EDCCAwwCAQEwdjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0
eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECEG8z
ftGmvYfSeKA1FishBukwCQYFKw4DAhoFAKCCAW8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAc
BgkqhkiG9w0BCQUxDxcNMDcwNDAyMDMyNzIxWjAjBgkqhkiG9w0BCQQxFgQUeoxAImI/2PpxtJut
OZf7EjIZAIowgYUGCSsGAQQBgjcQBDF4MHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0
ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBAhBvM37Rpr2H0nigNRYrIQbpMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkG
A1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhBvM37Rpr2H0nigNRYrIQbpMA0G
CSqGSIb3DQEBAQUABIIBAH0mt5AnPzmAFlCJprwOCJkFlYMatpc+uhYU/BjsXnJXrfiHI7Wwm3Hf
YXbpOtU6+BrO8isL3hv3y6pL/SoF+eQ7bNOQwdw2R2QInS/0iPNJb9lf/Hvrh3X1rfJdvTT96i7i
0Q/ZUHUc8AZXNyCeKheZqx+mUZOUNmTAP9mq1Za+u38V534lTDU0rzFOVemx8TO43pT1uMKjepMG
eIhCLLnPK6UwiuqHRR9IEFe8FbDkd9kqSQazM8AbsCT0tBeQliBBstfxCdNfWaMKtNKjOgkkVOzY
LujRmVPc3b/gZ3vOpDvGPTLycpuKHWIO8nG1Oaxev/vo960ldtGmVUFroOUAAAAAAAA=


--=-Dqw+GYgNWN2l2iRxsgrU--

--===============0756237579==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

--===============0756237579==--
