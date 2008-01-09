From: Andre Noll <maan@systemlinux.org>
Date: Wed, 09 Jan 2008 13:33:23 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080109133323.GD16462@skl-net.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="XvKFcGCOAo53UbWW"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <20080109103459.GC16462@skl-net.de> <4784C96D.5030805@student.ltu.se>
In-Reply-To: <4784C96D.5030805@student.ltu.se>
To: Richard Knutsson <ricknu-0@student.ltu.se>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, paolo.ciarrocchi@gmail.com, gorcunov@gmail.com


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14:17, Richard Knutsson wrote:

> Would had preferred:
>=20
> if (x) {
>    result =3D -Exxxx;
>    goto out;
> }
>=20
> then:
>=20
> result =3D -Exxxx;
> if (x)
>    goto out;
>=20

AFAIK, the second form is preferred in Linux because it is better
readable and it generates slightly better code.

Thanks for the review.
Andre
--=20
The only person who always got his work done by Friday was Robinson Crusoe

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFHhM0jWto1QDEAkw8RAhw8AJ4x2Jt2rknSfKQRxn8+4/t1ly+WAgCfZNRr
vBjDHDAL+TsEaBbDDD6ZnHQ=
=n25R
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
