From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Sep 2020 10:20:05 +0000
Subject: Re: [PATCH] drm/vc4: hdmi: Fix NULL vs IS_ERR() checks in vc5_hdmi_init_resources()
Message-Id: <20200910102005.puj7gscpnfczdrll@gilmour.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ry3egkt6pariiyt3"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200910100825.GC79916@mwanda>
In-Reply-To: <20200910100825.GC79916@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.duckdns.org>


--ry3egkt6pariiyt3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 01:08:25PM +0300, Dan Carpenter wrote:
> The devm_ioremap() function never returns error pointers, it returns
> NULL.
>=20
> Fixes: 8323989140f3 ("drm/vc4: hdmi: Support the BCM2711 HDMI controllers=
")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
Maxime

--ry3egkt6pariiyt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1n91QAKCRDj7w1vZxhR
xVV4AQD88CcY9D0XYtm4MoYKOItUhKdUW84yZ2VzgqVPja0a8AEA6EoiURAIXd0L
ZlJXZg8kdHtpbegQw4NfyW8cwZ0oywk=
=lspq
-----END PGP SIGNATURE-----

--ry3egkt6pariiyt3--
