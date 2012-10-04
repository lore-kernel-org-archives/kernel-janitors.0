From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 04 Oct 2012 09:30:30 +0000
Subject: Re: [PATCH 4/20] drivers/net/can/sja1000/peak_pcmcia.c: fix error return code
Message-Id: <506D5736.7040402@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enig7B4637FB16C5DFEA20C6B149"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349281090-10013-3-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1349281090-10013-3-git-send-email-peter.senna@gmail.com>
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: wg@grandegger.com, kernel-janitors@vger.kernel.org, linux@dominikbrodowski.net, linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig7B4637FB16C5DFEA20C6B149
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 10/03/2012 06:17 PM, Peter Senna Tschudin wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
>=20
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.
>=20
> A simplified version of the semantic match that finds this problem is a=
s
> follows: (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret !=3D 0\))
>  { ... return ret; }
> |
> ret@p1 =3D 0
> )
> ... when !=3D ret =3D e1
>     when !=3D &ret
> *if(...)
> {
>   ... when !=3D ret =3D e2
>       when forall
>  return ret;
> }
> // </smpl>
>=20
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Applied to can.
tnx, Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig7B4637FB16C5DFEA20C6B149
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iEYEARECAAYFAlBtVzsACgkQjTAFq1RaXHNpJQCfWJ+um+x/TY9S8z6q2C6BJxfk
0D0AnRZe4rev5vLW10iV5qO4WQc+Iwlw
=KBwg
-----END PGP SIGNATURE-----

--------------enig7B4637FB16C5DFEA20C6B149--
