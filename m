From: Mike Day <ncmike@ncultra.org>
Date: Tue, 24 Oct 2006 12:41:42 +0000
Subject: [KJ] gcc 4x warnings, x86_64
Message-Id: <20061024124142.GA10832@silverwood.ncultra.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0814558102=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--===============0814558102==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

A lot of drivers are producing warnings and I would like to submit
some patches to clean the warnings up. However, a lot of the drivers
are for devices or chips for which I don't have access and am unable
to test. Is it OK to submit patches like this or should I limit my
patches to drivers/code I can actually test?

Mike Day
--=20
Mike Day
http://www.ncultra.org
AIM: ncmikeday  Yahoo: ultra.runner
PGP key: http://www.ncultra.org/ncmike/pubkey.asc

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFFPgoGOycxVEUrfCERAojHAKCHxpU1yqZmZ6JhLCKshX5isBeJyQCaAvAb
ZFMLarKRFHcamMzcFy2nFNs=
=7uvF
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--

--===============0814558102==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0814558102==--
