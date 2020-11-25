From: Pavel Machek <pavel@ucw.cz>
Date: Wed, 25 Nov 2020 11:01:05 +0000
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in 'lp50xx_probe_dt()'
Message-Id: <20201125110105.GH25562@amd>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="IbVRjBtIbJdbeK1C"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dmurphy@ti.com, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--IbVRjBtIbJdbeK1C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-09-22 23:05:15, Christophe JAILLET wrote:
> In case of memory allocation failure, we must release some resources as
> done in all other error handling paths of the function.
>=20
> 'goto child_out' instead of a direct return so that 'fwnode_handle_put()'
> is called when we break out of a 'device_for_each_child_node' loop.
>=20
> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED =
driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, applied.

Best regards,
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--IbVRjBtIbJdbeK1C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++OXEACgkQMOfwapXb+vKXnACgkMTa2dISLqXMqzMQj+tAOgUF
mXcAoJTgoFHTSKW3ivAiNiznNo/aX0If
=Fc+b
-----END PGP SIGNATURE-----

--IbVRjBtIbJdbeK1C--
