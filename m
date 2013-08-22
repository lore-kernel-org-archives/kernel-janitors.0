From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2013 10:15:16 +0000
Subject: Re: [PATCH 5/6] regulator: ti-abb: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <20130822101516.GZ26118@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1ozVqH6bFr/3sC51"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376902316-18520-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376902316-18520-6-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--1ozVqH6bFr/3sC51
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2013 at 10:51:55AM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Remove unneeded error handling on the result of a call to
> platform_get_resource_byname when the value is passed to devm_ioremap_res=
ource.

Applied, thanks.

--1ozVqH6bFr/3sC51
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSFeSxAAoJELSic+t+oim9UYcQAIvEKGo4Au36PHdBri/AWDFP
ABSu+lrEju4vBHXwuKdbYVbP2nfB9Scr87Sw+boCqCZD+6MU/2pnHPS/ou9mpLOV
XQqDKcX547OpO4cyK0vhx2y9/5gbYq9IQMGZ5O7D25djGCts+Fk4INc6G3UYkp9q
iEoWAivQw3iS+KZ2xdaWLgr6m6DVhtt9r8nbuQ2N5hAZpfktaVdE51Tpnr0BgyUH
rRhIuzU9FHMGMNq3XCjBWYYM24oNUL0HA+mSFwiKJSrE3xcmebd0hPJSbV+nIVih
uuTwPrph+58wKFuFlnWNXAtui7ScDiSQCmdb/JNYnd22iLVBfRlIwgY3B1UTtsBo
XEgREKis0pBUpoBg1azt8LTKLvbDpmEC+a9H0av7y6A+gNBBGomj+etW29EjSepQ
5ditARUcU6w2IASxxdUR3vzZENHhXhXs9bkQhqIq+qf8qYJ1m5Q9dYfnd5Y0mGYJ
Ms3zEHZ0nKF1GzCvLdQNACeHpCWvLWZeoMJg8MNWJC6TbdvItAaWDV+LN0MNPV4O
6qniH21PaG15GMA79A4iZ3ErjLsjoquXLum8B2feTP6/e2h5Vh0LuaLfXTYkR5GL
M3GDqod0jaRF5Tm9ULFjtCcTsadZCbEzo9UROL/f5mi0AkeUoshHoUD7h6M+aqsi
Ca/R3JnP8oBIQDjjh0OQ
=rClA
-----END PGP SIGNATURE-----

--1ozVqH6bFr/3sC51--
