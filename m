From: <surya.prabhakar@wipro.com>
Date: Wed, 06 Jun 2007 06:49:03 +0000
Subject: Re: [KJ] [patch] Use DMA_32BIT_MASK where appropriate
Message-Id: <1181111823.17735.16.camel@bluegenie>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4587795181208913650=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <ab8e556c0706052115uf8e3e13g6a01207eb7b1166a@mail.gmail.com>
In-Reply-To: <ab8e556c0706052115uf8e3e13g6a01207eb7b1166a@mail.gmail.com>
To: kernel-janitors@vger.kernel.org


--===============4587795181208913650==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="=-A8W2PqDjHcCAVPrUyiht"
Content-class: urn:content-classes:message


--=-A8W2PqDjHcCAVPrUyiht
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2007-06-06 at 13:16 +0700, Kev Jackson wrote:
> From: Kev Jackson <foamdino@gmail.com>
>=20
> -Remove TW_DMA_MASK and use DMA_32BIT_MASK instead as recommended by
> kernel janitors TODO list
>=20
> Signed-off-by: Kev Jackson <foamdino@gmail.com>
>=20
failed again

patching file drivers/scsi/3w-xxxx.c
patch: **** malformed patch at line 10: *pdev, const struct
pci_device_id *
------
check line number 10, I think it could be a problem with your mail
client. First send the patch to yourself and apply it.
If it goes fine, you can be sure it goes with others.


> ---
>=20
>  drivers/scsi/3w-xxxx.c |    2 +-
>  drivers/scsi/3w-xxxx.h |    1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/scsi/3w-xxxx.c b/drivers/scsi/3w-xxxx.c
> index 656bdb1..15ca2a0 100644
> --- a/drivers/scsi/3w-xxxx.c
> +++ b/drivers/scsi/3w-xxxx.c
> @@ -2338,7 +2338,7 @@ static int __devinit tw_probe(struct pci_dev
> *pdev, const struct pci_device_id *
>=20
>  	pci_set_master(pdev);
>=20
> -	retval =3D pci_set_dma_mask(pdev, TW_DMA_MASK);
> +	retval =3D pci_set_dma_mask(pdev, DMA_32BIT_MASK);
>  	if (retval) {
>  		printk(KERN_WARNING "3w-xxxx: Failed to set dma mask.");
>  		goto out_disable_device;
> diff --git a/drivers/scsi/3w-xxxx.h b/drivers/scsi/3w-xxxx.h
> index 0742e68..4efd6c2 100644
> --- a/drivers/scsi/3w-xxxx.h
> +++ b/drivers/scsi/3w-xxxx.h
> @@ -234,7 +234,6 @@ static unsigned char tw_sense_table[][4] =3D
>  #define TW_IOCTL_TIMEOUT                      25 /* 25 seconds */
>  #define TW_IOCTL_CHRDEV_TIMEOUT               60 /* 60 seconds */
>  #define TW_IOCTL_CHRDEV_FREE                  -1
> -#define TW_DMA_MASK			      DMA_32BIT_MASK
>  #define TW_MAX_CDB_LEN			      16
>=20
>  /* Bitmask macros to eliminate bitfields */
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--=20
surya.
06/06/2007

--=-A8W2PqDjHcCAVPrUyiht
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
BgkqhkiG9w0BCQUxDxcNMDcwNjA2MDYzNzAyWjAjBgkqhkiG9w0BCQQxFgQU2DTTA36UIhojkHm4
gSLL2LBI/yIwgYUGCSsGAQQBgjcQBDF4MHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0
ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBAhBvM37Rpr2H0nigNRYrIQbpMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkG
A1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhBvM37Rpr2H0nigNRYrIQbpMA0G
CSqGSIb3DQEBAQUABIIBALPFS/nL3bStcuYnSXsCS060GrWV9JC9rZrVUp3o2N6Hg3kVqnmEQbk+
+PityEWGYyjFLRZuLVjk7H2NO8wLzdy9lbzM5FzM+gBWzQwTcChRjkC4EOpUTTsKYOigJ5PKDAdj
rtElt3Jwl/wsCIP6KF0oLE8lrYoQjHrY/oQDRZl+nvw8HHSQj+kwo6dHcQbq3+DPcHjfsWlkkCv7
2LMJ1jWGvCJZlvejlB0nSH2G7COwW5HI6WNDlLxTvhomUsHlrebHz7xmFG2igmKmpiHiIB8bGNw9
4u+spdCEW5O+rMYM/NCt6WHL9p+zMJ8fuVYDJR8hsxc5nREoedsfucCoyEIAAAAAAAA=


--=-A8W2PqDjHcCAVPrUyiht--

--===============4587795181208913650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============4587795181208913650==--
