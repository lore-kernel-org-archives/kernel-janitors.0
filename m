From: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 02 May 2014 11:21:11 +0000
Subject: Re: [patch] drm/panel: s6e8aa0: silence array overflow warning
Message-Id: <20140502112109.GA18693@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="lrZ03NoBR/3+SXJZ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140409152112.GD24536@mwanda>
In-Reply-To: <20140409152112.GD24536@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 06:21:12PM +0300, Dan Carpenter wrote:
> Smatch complains that we are reading beyond the end of the array here:
>=20
> 	drivers/gpu/drm/panel/panel-s6e8aa0.c:852 s6e8aa0_read_mtp_id()
> 	warn: buffer overflow 's6e8aa0_variants' 4 <=3D 4
>=20
> We set the error code, so it's not harmful but it looks like a return
> was intended here so lets add that and silence the warning.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

Thierry

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTY3+lAAoJEN0jrNd/PrOh4QEP/ROsugmi/IXkqW6uAXJKnS+8
cPza0VO6cPxE3tsPm3ArR3tvY6Qgx6D6z1Jl5bN3tast30vt9QalkCvqgK4HOljk
KlUPnleVJj1SZbUM1BJH/n+NCmeMo1VnXBxsUe6fqE3Jk/WFcKbRfoyt1KKiet1D
KnHopPE5cc0Iansu8Fiwl5Ewn3R+xU54a/j5d9Dz2Ov2l6NVCHFXMEd59A+37aIU
3dmID0fkxOsksxHTep94pt+YcqdN9yKV1/JdM1Q2ItpBc4qSRdGSARLcBAGAMGqP
Ts3xZSfU2qJuyc/UnhV6/BvLB3kzIoz7YJJgMoO7B1GkexaUl+CiPoLksTmDBF9v
Xr0S59N/2v1HAjuv75mAUmkI5IWk92E1EkHKiwJY10bdneopYPlsX9ax3ZrVwJRw
0msQvZZe9sAS7NTccQJTRKN037zaemaN1SZi6k0AE/Y/1V5ebEGcXNTMPJFzF+qR
/BU3bTsWgARvXruHmt3TOAgEx51wqtgYC58dvSNmVB9iRQ5wJj8qA0gP+VqoKG88
6yufxIe4T21SWAZ8zAT4WtWV1LhoZ89sFFRVZ7UkvAsIG+QpOAH56Xw6RBvHDikx
xPyZFNIPrTTpavrYiBLDn4O2Z9xMQ9rs1fWZjBJNpGU/yy6qJPcjuBuG/yEiK6D2
//EfySrU81Z4FrQbP8+m
=Uy2x
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
