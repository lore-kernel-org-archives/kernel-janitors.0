From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 30 Jan 2005 16:02:50 +0000
Subject: [KJ] [PATCH] pci_register_driver() for drivers/media/common
Message-Id: <20050130165744.GA5437@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="S1BNGpv0yoYahz37"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050128110438.GA8645@rhum.iomeda.fr>
In-Reply-To: <20050128110438.GA8645@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--===============68274825101717096==
Content-Disposition: inline
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"


--S1BNGpv0yoYahz37
Content-Type: multipart/mixed; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Description:
From : http://kerneljanitors.org/TODO
>-  convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
--=20
Christophe

--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci-register-drivers_media_common.patch"
Content-Transfer-Encoding: quoted-printable

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/c=
ommon/saa7146_core.c linux-2.6.11-rc2/drivers/media/common/saa7146_core.c
--- linux-2.6.11-rc2-vanilla/drivers/media/common/saa7146_core.c	2005-01-26=
 08:31:13.000000000 +0100
+++ linux-2.6.11-rc2/drivers/media/common/saa7146_core.c	2005-01-26 10:00:5=
1.000000000 +0100
@@ -539,7 +539,7 @@ int saa7146_register_extension(struct sa
 	ext->driver.remove =3D saa7146_remove_one;
=20
 	printk("saa7146: register extension '%s'.\n",ext->name);
-	return pci_module_init(&ext->driver);
+	return pci_register_driver(&ext->driver);
 }
=20
 int saa7146_unregister_extension(struct saa7146_extension* ext)

--61jdw2sOBCFtR2d/--

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFB/RII/ILOPx6HyHQRAnM3AJ97BpMBNT0ZgaWnHe5kIFFjXfEi0gCgpTTy
bzOgBU8GV+w1GewnsG/RVLQ=
=sO8J
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--


--===============68274825101717096==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68274825101717096==--
