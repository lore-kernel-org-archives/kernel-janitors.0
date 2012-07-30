From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Mon, 30 Jul 2012 12:47:39 +0000
Subject: Re: [vhost:vhost-net-next 61/99] drivers/net/can/janz-ican3.c:964:7: warning: unused variable 'ret'
Message-Id: <5016826B.1080905@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enig7E2F1622276A5725EEFF38DC"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120728102443.GB10759@localhost>
In-Reply-To: <20120728102443.GB10759@localhost>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig7E2F1622276A5725EEFF38DC
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 07/28/2012 12:24 PM, Fengguang Wu wrote:
> There are new compile warnings show up in
>=20
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vho=
st-net-next
> head:   163049aefdc04323a2d17ec9f2862027b43b0502
> commit: 83702f69272e4591a91a27eb58eade1bcd361dae [61/99] can: janz-ican=
3: fix support for CAN_RAW_RECV_OWN_MSGS
>=20
> All error/warnings:
>=20
> drivers/net/can/janz-ican3.c: In function 'ican3_handle_cevtind':
> drivers/net/can/janz-ican3.c:964:7: warning: unused variable 'ret' [-Wu=
nused-variable]

Good catch, this warning occurs in the middle a series of patches, but
not after the full series has been applied. Next time we'll check better
for bisecability.

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig7E2F1622276A5725EEFF38DC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlAWgm4ACgkQjTAFq1RaXHPHlACgiJzsWkHlceWr0DybFqoTfQF2
g1sAn3vxAtXBUBS4fAHhf+Iugv8OfQZS
=0LWm
-----END PGP SIGNATURE-----

--------------enig7E2F1622276A5725EEFF38DC--
