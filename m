From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 12 Mar 2018 09:44:13 +0000
Subject: Re: [PATCH] drm/sun4i: Fix an error handling path in 'sun4i_drv_bind()'
Message-Id: <20180312094413.zck7apzghxs7brfr@flea>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="kwv5wwbq7piw4224"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180311231909.5381-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180311231909.5381-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@linux.ie, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org, linux-arm-kernel@lists.infradead.org


--kwv5wwbq7piw4224
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2018 at 12:19:09AM +0100, Christophe JAILLET wrote:
> Commit 070badfab767 ("drm/sun4i: call drm_vblank_init with correct number
> of crtcs") has moved some code without updating the error handling gotos
> accordingly.
>=20
> Branch to the correct label and remove a now unused lablel.
>=20
> Fixes: 070badfab767 ("drm/sun4i: call drm_vblank_init with correct number=
 of crtcs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--kwv5wwbq7piw4224
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqmS+wACgkQ0rTAlCFN
r3S8yw/+OuCmCIGSO3r8wrt8W+x1Xs0hCJiJdP8US0ohUvX/B6VbynAmmfTd34U5
KoYr2Nr7mULmad+20XdxSpCpWFFDg4PS7UrZy0TRYH5K3WR7lI5suiv1HJ9bGPai
F+90vNq/VkbkFco5mvkowbcP91ZR4v1CJuQ/tzF8mJEkrrrwh58jLAxaIoqHQq0+
Kgih5Ln85cPcynsxzbeLzyz9tJ0OaauSn9y3gFo3YFxLdGUVvQyrzKaZqfgaGOuX
sOcw0JllYCK5TCVyJQUfcqWEaRedBJmSHaZxOvB93N5Lb6Yb8UGT6YtoKFWLgldA
OEvJXWQl6t2Q8m27ygqD4MB3CvbEM0Ao5f08B+LwdltKWCfFny+yNsy+v6L3nRCn
MHFuzVGCBKl/SZegraX2zm2ZQDHeIOPs4CKNiWaLUWT9PrM0b1ybMelHaR3PPCkD
dIdaU6CsBj7UA/Ah2TDpLzcTQyuaqXNqIVHWa9o+0aeoZ5d2YEr6AbEo6QrPommg
VBpzJLT9ymbPOmp/VMEEYVChl4ylKhXK0P3pagej85sbGPv5pfIpY7t6YRnlaUfo
NRR129CsU7961xn/Bwsgv53cBS4eQzcLNZSFTkJ3Y9t3d5Y9rr+LrRNvh6N8/+2u
uatfCcwPjk2TI8U2PKNvp7Ek8yvDvaxqHvgVXn8HBQwaOcMfUJI=
=K0H1
-----END PGP SIGNATURE-----

--kwv5wwbq7piw4224--
