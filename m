From: <surya.prabhakar@wipro.com>
Date: Mon, 16 Apr 2007 07:31:43 +0000
Subject: [KJ] Trivial patch:changing const char foo* to const char foo[]
Message-Id: <1176707983.13603.9.camel@bluegenie>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1190445567=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--===============1190445567==
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-pWUy7nsRXC4JfDwEezZO"
Content-class: urn:content-classes:message


--=-pWUy7nsRXC4JfDwEezZO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Files modified=20

arch/i386/boot/compressed/relocs.c
arch/i386/kernel/vmi.c

As suggested by Jeff Garzik,=20
----
>The string form [const] char *foo =3D "blah";
>creates two variables in the final assembly output, a static string,
>and
>a char pointer to the static string. The alternate string form
>[const] char foo[] =3D "blah"; is better because it declares a single
>variable.
------

Cleaned up for the new modifications.=20


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
---

diff --git a/arch/i386/boot/compressed/relocs.c
b/arch/i386/boot/compressed/relocs.c
index ce4fda2..0beeea1 100644
--- a/arch/i386/boot/compressed/relocs.c
+++ b/arch/i386/boot/compressed/relocs.c
@@ -71,7 +71,7 @@ static const char *sym_type(unsigned type)
 		SYM_TYPE(STT_TLS),
 #undef SYM_TYPE
 	};
-	const char *name =3D "unknown sym type name";
+	const char name[] =3D "unknown sym type name";
 	if (type < ARRAY_SIZE(type_name)) {
 		name =3D type_name[type];
 	}
@@ -87,7 +87,7 @@ static const char *sym_bind(unsigned bind)
 		SYM_BIND(STB_WEAK),
 #undef SYM_BIND
 	};
-	const char *name =3D "unknown sym bind name";
+	const char name[] =3D "unknown sym bind name";
 	if (bind < ARRAY_SIZE(bind_name)) {
 		name =3D bind_name[bind];
 	}
@@ -104,7 +104,7 @@ static const char *sym_visibility(unsigned
visibility)
 		SYM_VISIBILITY(STV_PROTECTED),
 #undef SYM_VISIBILITY
 	};
-	const char *name =3D "unknown sym visibility name";
+	const char name[] =3D "unknown sym visibility name";
 	if (visibility < ARRAY_SIZE(visibility_name)) {
 		name =3D visibility_name[visibility];
 	}
@@ -128,7 +128,7 @@ static const char *rel_type(unsigned type)
 		REL_TYPE(R_386_GOTPC),
 #undef REL_TYPE
 	};
-	const char *name =3D "unknown type rel type name";
+	const char name[] =3D "unknown type rel type name";
 	if (type < ARRAY_SIZE(type_name)) {
 		name =3D type_name[type];
 	}
diff --git a/arch/i386/kernel/vmi.c b/arch/i386/kernel/vmi.c
index edc339f..895f546 100644
--- a/arch/i386/kernel/vmi.c
+++ b/arch/i386/kernel/vmi.c
@@ -599,9 +599,9 @@ static inline int __init check_vmi_rom(struct
vrom_header *rom)
 {
 	struct pci_header *pci;
 	struct pnp_header *pnp;
-	const char *manufacturer =3D "UNKNOWN";
-	const char *product =3D "UNKNOWN";
-	const char *license =3D "unspecified";
+	const char manufacturer[] =3D "UNKNOWN";
+	const char product[] =3D "UNKNOWN";
+	const char license[] =3D "unspecified";
=20
 	if (rom->rom_signature !=3D 0xaa55)
 		return 0;


--=20
surya.
16/04/2007

--=-pWUy7nsRXC4JfDwEezZO
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
BgkqhkiG9w0BCQUxDxcNMDcwNDE2MDcxOTM4WjAjBgkqhkiG9w0BCQQxFgQUpnignZPA0NBqzjFD
ziYBsMQ+8hAwgYUGCSsGAQQBgjcQBDF4MHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0
ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBAhBvM37Rpr2H0nigNRYrIQbpMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkG
A1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhBvM37Rpr2H0nigNRYrIQbpMA0G
CSqGSIb3DQEBAQUABIIBAGoFN7RqRG+IOj6SFGbGc/LA6pusO6HMGt9OigxH103/qOMOO8kjtrTx
hjrs4MdXIOEbM59omTJS2P7EQCmo3wzm290wU5gjpimA2CnpctZtgF8edB1u1/AjuR3bE/APlY61
tRVphc3qxB/1lIySNbNlY/Je843Bp2JhC52uQ5JSDTsNZFbouyMzcaWmcL25SkjVuwiU7hIwgnCO
qOYjVt/H+kf8tSeUZdBMYSSDicc8eXRi4sbjUhhFJ25HrWijL9M+UHAvmTW8/GrfMl4Nzf7Z9REV
jCTGMnRW2ZhujxJmYHkCGmAGvPdNTSiSUiig+6RkZ8N+UeLkZjkBn8WxGqkAAAAAAAA=


--=-pWUy7nsRXC4JfDwEezZO--

--===============1190445567==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

--===============1190445567==--
