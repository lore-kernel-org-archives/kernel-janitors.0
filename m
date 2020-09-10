From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Sep 2020 10:19:50 +0000
Subject: Re: [PATCH] drm/vc4: hdmi: Fix off by ones in vc4_hdmi_read/write()
Message-Id: <20200910101950.vgolpbskn64evnyk@gilmour.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="tq5daj5t3ijdco2q"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200910100748.GA79916@mwanda>
In-Reply-To: <20200910100748.GA79916@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.duckdns.org>


--tq5daj5t3ijdco2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 01:07:48PM +0300, Dan Carpenter wrote:
> The variant->registers[] has ->num_registers elements so the >
> comparison needs to be changes to >=3D to prevent an out of bounds
> access.
>=20
> Fixes: 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout abstract=
ion")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
Maxime

--tq5daj5t3ijdco2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1n9xgAKCRDj7w1vZxhR
xbQTAQDUfacjuhgX28Cj9vVmIezT6QLQoMhITiWlhN7fLiKYFgD9GTqvCdM3B2Nv
TfTH7a+W93y4WcNIvcdtGV78EaNejgA=
=F0K8
-----END PGP SIGNATURE-----

--tq5daj5t3ijdco2q--
