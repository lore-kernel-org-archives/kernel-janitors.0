From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 21 Jan 2021 07:37:20 +0000
Subject: Re: [PATCH can tree] can: dev: prevent potential information leak in can_fill_info()
Message-Id: <20210121073720.zlskqgitnod3w6hf@hardanger.blackshift.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="sif3h2wey4pwemlu"
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAkaRdRJncsJO8Ve@mwanda>
In-Reply-To: <YAkaRdRJncsJO8Ve@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wolfgang Grandegger <wg@grandegger.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-can@vger.kernel.org, kernel-janitors@vger.kernel.org


--sif3h2wey4pwemlu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Dan,

On Thu, Jan 21, 2021 at 09:08:05AM +0300, Dan Carpenter wrote:
> The "bec" struct isn't necessarily always initialized.  For example,
> the mcp251xfd_get_berr_counter() function doesn't initialize anything
> if the interface is down.
>=20
> Fixes: 52c793f24054 ("can: netlink support for bus-error reporting and co=
unters")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch. As this is a fix, I've backported it to net/master, w=
hich
is before the split of the dev.c into separate files. Applied to
linux-can/testing.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--sif3h2wey4pwemlu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmAJLykACgkQqclaivrt
76kByAf/dri0xzZQz/DzfMzagXjus6P5AAV6R3awzjWURGIXH1NwljIAeHn/Swt6
+zHwRZInKI8d0c9puZ1KPOUjebA9tQXB9ghni2PfPSQL6RMrpBpG+MnXdF1nH+kc
T5rIZ75ehwTkkmXx7iFMTEh41+jeTgqBFtwmMK64GKSmxv/0ex6crCsFBT7YXdW7
DbXFoTVIGJI9qfw5aTb+j4U/fepo+iR3dmurG9Cvc9PmqYgEAFYrufqYitNR4bPb
LGNsCxjJWJWnFrkE02Sq/ZIl8vATYDmAGKyJrcHStUDChmvF4v8CREROnXrl1zKD
tJXn1a5Yb5bxoxsRoX0PBY3tbTxNKw==
=e/IK
-----END PGP SIGNATURE-----

--sif3h2wey4pwemlu--
