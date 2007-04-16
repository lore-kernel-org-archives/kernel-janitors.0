From: <vignesh.babu@wipro.com>
Date: Mon, 16 Apr 2007 06:08:11 +0000
Subject: [KJ] [PATCH]cfi_probe.c-kzalloc
Message-Id: <1176702971.12205.1.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1231122123=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--===============1231122123==
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-ZTQ5GteX3R7LzTNsPtIu"
Content-class: urn:content-classes:message


--=-ZTQ5GteX3R7LzTNsPtIu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



Replacing kmalloc/memset combination with kzalloc.

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index 60e11a0..efb51f7 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -203,14 +203,12 @@ static int __xipram cfi_chip_setup(struct map_info *m=
ap,
 	if (!num_erase_regions)
 		return 0;
=20
-	cfi->cfiq =3D kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, G=
FP_KERNEL);
+	cfi->cfiq =3D kzalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, G=
FP_KERNEL);
 	if (!cfi->cfiq) {
 		printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map-=
>name);
 		return 0;
 	}
=20
-	memset(cfi->cfiq,0,sizeof(struct cfi_ident));
-
 	cfi->cfi_mode =3D CFI_MODE_CFI;
=20
 	/* Read the CFI info structure */
diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_prob=
e.c
index 58e561e..ba5fc39 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1853,14 +1853,12 @@ static int cfi_jedec_setup(struct cfi_private *p_cf=
i, int index)
=20
 	num_erase_regions =3D jedec_table[index].NumEraseRegions;
=20
-	p_cfi->cfiq =3D kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4,=
 GFP_KERNEL);
+	p_cfi->cfiq =3D kzalloc(sizeof(struct cfi_ident) + num_erase_regions * 4,=
 GFP_KERNEL);
 	if (!p_cfi->cfiq) {
 		//xx printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n",=
 map->name);
 		return 0;
 	}
=20
-	memset(p_cfi->cfiq,0,sizeof(struct cfi_ident));
-
 	p_cfi->cfiq->P_ID =3D jedec_table[index].CmdSet;
 	p_cfi->cfiq->NumEraseRegions =3D jedec_table[index].NumEraseRegions;
 	p_cfi->cfiq->DevSize =3D jedec_table[index].DevSize;
diff --git a/drivers/mtd/devices/docprobe.c b/drivers/mtd/devices/docprobe.=
c
index 78872c3..0cb6a66 100644
--- a/drivers/mtd/devices/docprobe.c
+++ b/drivers/mtd/devices/docprobe.c
@@ -257,7 +257,7 @@ static void __init DoC_Probe(unsigned long physadr)
 			return;
 		}
 		docfound =3D 1;
-		mtd =3D kmalloc(sizeof(struct DiskOnChip) + sizeof(struct mtd_info), GFP=
_KERNEL);
+		mtd =3D kzalloc(sizeof(struct DiskOnChip) + sizeof(struct mtd_info), GFP=
_KERNEL);
=20
 		if (!mtd) {
 			printk(KERN_WARNING "Cannot allocate memory for data structures. Droppi=
ng.\n");
@@ -267,9 +267,6 @@ static void __init DoC_Probe(unsigned long physadr)
=20
 		this =3D (struct DiskOnChip *)(&mtd[1]);
=20
-		memset((char *)mtd,0, sizeof(struct mtd_info));
-		memset((char *)this, 0, sizeof(struct DiskOnChip));
-
 		mtd->priv =3D this;
 		this->virtadr =3D docptr;
 		this->physadr =3D physadr;

--=20
Regards, =20
Vignesh Babu BM =20
_____________________________________________________________ =20
"Why is it that every time I'm with you, makes me believe in magic?"

--=-ZTQ5GteX3R7LzTNsPtIu
Content-Type: application/x-pkcs7-signature; name=smime.p7s
Content-Disposition: attachment; filename=smime.p7s
Content-Transfer-Encoding: base64

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
CQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UE
AxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwgZ8wDQYJKoZIhvcNAQEBBQAD
gY0AMIGJAoGBAMSmPFVzVftOucqZWh5owHUEcJ3f6f+jHuy9zfVb8hp2vX8MOmHyv1HOAdTlUAow
1wJjWiyJFXCO3cnwK4Vaqj9xVsuvPAsH5/EfkTYkKhPPK9Xzgnc9A74r/rsYPge/QIACZNenpruf
ZdHFKlSFD0gEf6e20TxhBEAeZBlyYLf7AgMBAAGjgZQwgZEwEgYDVR0TAQH/BAgwBgEB/wIBADBD
BgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsLnRoYXd0ZS5jb20vVGhhd3RlUGVyc29uYWxGcmVl
bWFpbENBLmNybDALBgNVHQ8EBAMCAQYwKQYDVR0RBCIwIKQeMBwxGjAYBgNVBAMTEVByaXZhdGVM
YWJlbDItMTM4MA0GCSqGSIb3DQEBBQUAA4GBAEiM0VCD6gsuzA2jZqxnD3+vrL7CF6FDlpSdf0wh
uPg2H6otnzYvwPQcUCCTcDz9reFhYsPZOhl+hLGZGwDFGguCdJ4lUJRix9sncVcljd2pnDmOjCBP
ZV+V2vf3h9bGCE6u9uo05RAaWzVNd+NWIXiC3CEZNd4ksdMdRv9dX2VPMYIDEDCCAwwCAQEwdjBi
MQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoG
A1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECEBRBWlnPDDQELOU4iM67
/5AwCQYFKw4DAhoFAKCCAW8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUx
DxcNMDcwNDE2MDU1NjA3WjAjBgkqhkiG9w0BCQQxFgQU/j5R7NuWQ70c9zp2CZu/CVOOiVQwgYUG
CSsGAQQBgjcQBDF4MHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5n
IChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENB
AhAUQVpZzww0BCzlOIjOu/+QMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkGA1UEBhMCWkExJTAj
BgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJz
b25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAUQVpZzww0BCzlOIjOu/+QMA0GCSqGSIb3DQEBAQUA
BIIBAKx5iBwJZp5jSJHqgR9rNTTHWXFjqlmXrA7FIGADJrljMNzGXiyfboQNE0tE661JqZ+LEQZ7
/JB4MhsAoHXrqbQ1Z4rCXW1j+xIQy62Z5kAfICz6dUFOKW+r+RFGIbZMtDAAxWwzNdo8Kt8zQZtP
ZeG4wMGvHqXVBMfxGhN5juD6ISgnZJjOBfwXqI3gaN7WdBRxqe3vsftNFK2nrWHzM954hDKuvLhx
iuxZ5bMHocLp43KP92t7ENF4kbr3TP20e5Zp8SWfnVveX3Gc7EcnIlrcaccyu34CzKOLlN8M7Q+6
oUoyO00Eni9hMSAwrsYv/R+fnKSffu0oy53i4ZIzV4QAAAAAAAA=


--=-ZTQ5GteX3R7LzTNsPtIu--

--===============1231122123==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

--===============1231122123==--
