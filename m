From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 08 Nov 2004 17:35:40 +0000
Subject: Re: [KJ] how can I declare a char[][] module parameter?
Message-Id: <200411081835.41173.arnd@arndb.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1381303253331565=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041107212209.GA11291@dice.seeling33.de>
In-Reply-To: <20041107212209.GA11291@dice.seeling33.de>
To: kernel-janitors@vger.kernel.org


--===============1381303253331565==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_t56jB3GUVkTlklK";
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit


--Boundary-02=_t56jB3GUVkTlklK
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On S=FCnndag 07 November 2004 22:22, Stefan Sperling wrote:
> This is the best conversion I came up with, but it discards information:
>=20
> =A0 =A0 module_param_array(name, charp, WAVELAN_P_NAME_LEN, 0444);
>=20
> How can I declare an array of char*, without loosing the
> information that each char* points to a buffer of IFNAMESIZ bytes?

You don't need that information. The parameter is used in only one
place, and there, you can use strncpy instead of memcpy to access
it.

It probably wasn't a particularly good idea to make the interface
name a module parameter anyway, but it's too late for that decision
now.

	Arnd <><



--Boundary-02=_t56jB3GUVkTlklK
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBj65t5t5GS2LDRf4RAqh4AKCKTDZ8qbLbHPyutPDmKAD/gm/lrwCfUjzq
gn/OUl1L+PDn5juuXuUMrw4=
=7jpj
-----END PGP SIGNATURE-----

--Boundary-02=_t56jB3GUVkTlklK--

--===============1381303253331565==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1381303253331565==--
