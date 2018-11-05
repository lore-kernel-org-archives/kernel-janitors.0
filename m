From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 05 Nov 2018 15:25:40 +0000
Subject: Re: [PATCH][staging-next] drivers: staging: cedrus: find ctx before dereferencing it ctx
Message-Id: <20181105152540.htkdtrcdsnngu7pk@flea>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="qrokgdyikkbb3l7i"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181102190126.5628-1-colin.king@canonical.com>
In-Reply-To: <20181102190126.5628-1-colin.king@canonical.com>
To: linux-arm-kernel@lists.infradead.org


--qrokgdyikkbb3l7i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 02, 2018 at 07:01:26PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently if count is an invalid value the v4l2_info message will
> dereference a null ctx pointer to get the dev information. Fix
> this by finding ctx first and then checking for an invalid count,
> this way ctxt will be non-null hence avoiding the null pointer
> dereference.
>=20
> Detected by CoverityScan, CID#1475337 ("Explicit null dereferenced")
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qrokgdyikkbb3l7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+Bg9AAKCRDj7w1vZxhR
xZUqAQDGGL3Cal9ZlDCJ14U0DlM9zhHuK4KtiYu61PvfaYkZBwEAlg4GtFWZ8CNj
Eqj7X17qQd5grDaN0mMyJYUuh0wfSwI=
=bM2L
-----END PGP SIGNATURE-----

--qrokgdyikkbb3l7i--
