From: Thierry Reding <thierry.reding@gmail.com>
Date: Tue, 10 Jul 2018 11:12:48 +0000
Subject: Re: [PATCH] drm/panel: type promotion bug in s6e8aa0_read_mtp_id()
Message-Id: <20180710111248.GA13242@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="M9NhX3UHpAaciwkO"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093807.s3lqsb2v6dg2k43d@kili.mountain>
In-Reply-To: <20180704093807.s3lqsb2v6dg2k43d@kili.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 04, 2018 at 12:38:09PM +0300, Dan Carpenter wrote:
> The ARRAY_SIZE() macro is type size_t.  If s6e8aa0_dcs_read() returns a
> negative error code, then "ret < ARRAY_SIZE(id)" is false because the
> negative error code is type promoted to a high positive value.
>=20
> Fixes: 02051ca06371 ("drm/panel: add S6E8AA0 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

Thierry

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltElLAACgkQ3SOs138+
s6ES+w//bJuN6bbtmCz1IjJZUrb42RFIFalSlYWsmTFpYRAgb778kV/CpiyhB+qf
h8SxZ+WtvfbkoZc2XCJkcNchlNonnGja2d4vDRds1+wB4MWFxCWgqWv7A7aVwBQI
O3SY5qO+XUFGoGYxE97ttVa3JGUZkbcCWjjlSdrPdAI2BmsoPVy5m7nkWNl6f+ci
BMdQkC1ESTeI5E/SThpnBoVDv8HzwMA0OIKDhEy52OL5O7ynWQ4drAXeVewG3K7i
YnJ3rfTKVn+53MRAyuuD9+PzO9rf/Gnp9IjqVDxOB5BNeq61KukPHNzzVmfpIep0
Cvgn9grLm7mRXI8zkgCGMYukc2kOWBD3pBl5oNc9hJUKLP6enXvI1PVt48F0wlF2
tkjzaNfdEpmBJqemgI59aYRu5/3NkDRv1xCNJsgGXWE47UDbZgCqHrcfitjYq1dW
A722vHnK3RixUqNKXgy4yRh69EgY7A/Ku3gcbUJD+6oYHQIjGYgSgdUv3ynPDZYd
USGe46ZGLl1ewnUMIs5YCBk4C3+BLLz9K4kB+ktj6caB7RoS30EnDYeW1zf19uTo
aIIRX922Km3+GeywiF9navynJCcKVeoHdboMNDL5zp0XPTqi/olmrCkjhvAwFXoo
hJWl3M/vtc7C+vipXrDFAeIBNAviiUEdVRZQo/lzSX8JEp0OJe0=
=iCTp
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
