From: Thomas Petazzoni <thomas.petazzoni@enix.org>
Date: Sun, 24 Sep 2006 11:04:05 +0000
Subject: Re: [KJ] [PATCH] Prevent multiple inclusion of linux/sysrq.h
Message-Id: <20060924130405.6c7250c9@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1993638003=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <E1GQtbr-0005Or-LP@localhost.localdomain>
In-Reply-To: <E1GQtbr-0005Or-LP@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============1993638003==
Content-Type: multipart/signed; boundary="Sig_Hp/tTY=DGPTQmPkZNKgoRsh";
	protocol="application/pgp-signature"; micalg=PGP-SHA1

--Sig_Hp/tTY=DGPTQmPkZNKgoRsh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le Sat, 23 Sep 2006 00:35:03 +0200,
Thomas Petazzoni <thomas.petazzoni@enix.org> a =C3=A9crit :

> Prevent multiple inclusions of include/linux/sysrq.h using traditional
> #ifndef..#endif.
>=20
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@enix.org>

To who should I send this patch for inclusion ? The
include/linux/sysrq.h is not really part of a driver nor a
subsystem, so there's seems to be no maintainer listed in the
MAINTAINERS file.

Any suggestion ?

Thanks,

Thomas
--=20
PETAZZONI Thomas - thomas.petazzoni@enix.org=20
http://{thomas,sos,kos}.enix.org - Jabber: thomas.petazzoni@jabber.dk
http://{agenda,livret}dulibre.org - http://www.toulibre.org
Fingerprint : 0BE1 4CF3 CEA4 AC9D CC6E  1624 F653 CB30 98D3 F7A7

--Sig_Hp/tTY=DGPTQmPkZNKgoRsh
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFFmYo9lPLMJjT96cRAlDqAKCXNFjt1B+sz0os8CUGTXQDcnDeHgCfTvz9
bj07rNATnXWfKDprJ6ArjLs=
=iF0T
-----END PGP SIGNATURE-----

--Sig_Hp/tTY=DGPTQmPkZNKgoRsh--

--===============1993638003==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1993638003==--
