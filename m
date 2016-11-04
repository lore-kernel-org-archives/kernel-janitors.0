From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 04 Nov 2016 07:48:40 +0000
Subject: Re: [PATCH] drm/sun4i: Propagate error to the caller
Message-Id: <20161104074840.ybklkvgp5p4bgyvj@lukather>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="palutzuu4bvql54w"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161104061352.12596-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161104061352.12596-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: wens@csie.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--palutzuu4bvql54w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2016 at 07:13:52AM +0100, Christophe JAILLET wrote:
> If 'sun4i_layers_init()' returns an error, propagate it instead of
> returning -EINVAL unconditionally.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--palutzuu4bvql54w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYHD1TAAoJEBx+YmzsjxAg/HcP/05yOpMwR2YkOAzCnlgsfDxh
1bK7Vkfi4QOp1r7peJXDIC6N/B5lj3b3I0RyndAQc4CjAM8Uia+OPJm+AQ236aii
RuIM1G884rznQAHCpD6YyFcr7g1LQl3G4yyvTOBmGsqHOkNyx4ZNUEgHmyL2Hnyx
8pzLhHLi6WmesxOTvT6ScuKobl/TQQXT2YoCDOuBDlj2EkB9rjzPLN4ROiGuQA+u
1eXdU+ZaMD5U3P2p/qRGnhI+8x/CaIEQV3Sb6eP9jThohoZwKEu4BYnHnQQ8Slb3
SHwB2a1ZZ45dUB4yC0Dibkrt3o2g6XHPsLgEJ6Ell3aW9EK1udojZe8XIvYzsEjX
KrZGvBxyesEu2GK42sPB/JHrSvifJToWBCw87VuDBwy1mWhds75yPeYak+V/I/oo
rtCUGAGt98o8yePXCwyDNKEf6QeAU+pNa6Cl3XzkcTH55AZgxN4qVmd4OIVoKgnj
ml3dOhiiprYSg/TYyq6N+UzlzzDCsb0KlH0UlXfVZALiYAg+hJVpop1CWmiXjAZs
lNKKVV45q+4K1iTIIkDTUHM8WLLhiyCr1e0Fyuazu5RZTVKIchcYNdw7bxmlym2S
+qD3GbWuD/lSGw3m6Elgg6pcPK8qTDaizbXi7WZMwP0BBC6ObT6TyRECXcIbkhBw
xbVpxIrskx7HOKSvA+ff
=4PVz
-----END PGP SIGNATURE-----

--palutzuu4bvql54w--
