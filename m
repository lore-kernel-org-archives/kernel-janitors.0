From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 24 Jan 2005 16:25:46 +0000
Subject: [KJ] [PATCH] unified spinlock initialization
Message-Id: <20050124162546.GA32674@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Yylu36WmvOXNoKYn"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org


--===============92655985430799481==
Content-Disposition: inline
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"


--Yylu36WmvOXNoKYn
Content-Type: multipart/mixed; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In: drivers/misc/ibmasm/module.c

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
--=20
Christophe

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="ibmmasm-module-unified-spinlock.patch"
Content-Transfer-Encoding: quoted-printable

diff -urbNB linux-2.6.10-vanilla/drivers/misc/ibmasm/module.c linux-2.6.10/=
drivers/misc/ibmasm/module.c
--- linux-2.6.10-vanilla/drivers/misc/ibmasm/module.c	2005-01-24 17:08:09.0=
00000000 +0100
+++ linux-2.6.10/drivers/misc/ibmasm/module.c	2005-01-24 17:18:31.000000000=
 +0100
@@ -107,7 +107,7 @@
 		goto error_remote_queue;
 	}
=20
-	sp->lock =3D SPIN_LOCK_UNLOCKED;
+	spin_lock_init( &sp->lock );
 	INIT_LIST_HEAD(&sp->command_queue);
=20
 	result =3D request_irq(sp->irq, ibmasm_interrupt_handler, SA_SHIRQ, sp->d=
evname, (void*)sp);

--Dxnq1zWXvFF0Q93v--

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFB9SGK/ILOPx6HyHQRAlldAKCaV00bTmvOlJcInxDOk1WRU2+v5QCfT9jY
ez345FDqdRK0wYshyJa61jw=
=KUyY
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--


--===============92655985430799481==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92655985430799481==--
