From: Mark Brown <broonie@kernel.org>
Date: Wed, 14 Aug 2013 18:09:07 +0000
Subject: Re: [PATCH 25/29] drivers/spi/spi-sirf.c: simplify use of devm_ioremap_resource
Message-Id: <20130814180907.GE2401@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="5Mfx4RzfBqgnTE/w"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376471493-22215-26-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-26-git-send-email-Julia.Lawall@lip6.fr>
To: linux-arm-kernel@lists.infradead.org


--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 11:11:29AM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.

Applied, thanks.

--5Mfx4RzfBqgnTE/w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSC8fAAAoJELSic+t+oim9bggP/R6LtCCXRFnBopJg0oymKvWL
6TRQrua89PUx05BFqg7CsSyaemU6DKh3RmojruXTfgbjXtd+/YdzuIBwMu/ou8c8
oNXTZjzogMa2JctE4vAvIq3y/Pxh9BFc7WLrq9X08NlA7jEZ9eXgs1+HiOneHya9
wAlDwAK6SpVF7BC5h0x0N7v7l43tkBce+SlZblGpEQzm/NhF4EIsASExc9Uc0DAa
QUfuc8Y2iC/A9XAXZhGJWvk+mEPb9YKu6kRCLASQFaIe630wrsdVxupcAui46Cf4
pRGBhUohjrA+Wa+3YHPtVOMosjgrbXD57erilwQqrMmU2XvzOWDWqfwvjW3FwYXN
JHS2cWplR7WwyFLq8VTbqRGTxPr5HtCYR+TYZkxmw+jOzJJqUKR3Ovn6IbZO8EG/
E4UDushEJAlxFvRSdWbBnIPvc9uMhHlkuNKeRpWEXDq5OOoc6Vo9yohHrmW+lzMk
ZFZUQWRSzK56Ez6ho5X2jQ8Qf0lQZQdVSZwFYgZj7Tm7rl0RBw0dauCVhg0ui6+a
MoMZ32TbU746YA1zCIbjcPYHYB9OVucSPmMixjFcl9YC0GEnrc2TW128rDQZRw/D
OjkFrchh2k2kj7nI4NeUWgvUbiomLQB7viq4TOciiDzk9+g+6TAeoHHof+aknd3B
H+9SvVv0atuPYDPStlse
=OAMf
-----END PGP SIGNATURE-----

--5Mfx4RzfBqgnTE/w--
