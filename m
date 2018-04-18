From: Mark Brown <broonie@kernel.org>
Date: Wed, 18 Apr 2018 16:23:15 +0000
Subject: Re: [PATCH][next] spi: pxa2xx: make function pxa2xx_spi_transfer_one static
Message-Id: <20180418162315.GF10061@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="QXO0/MSS4VvK6f+D"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180418161842.19846-1-colin.king@canonical.com>
In-Reply-To: <20180418161842.19846-1-colin.king@canonical.com>
To: linux-arm-kernel@lists.infradead.org


--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2018 at 05:18:42PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The function pxa2xx_spi_transfer_one is local to the source and
> do not need to be in global scope, so make it static.

Someone already sent a patch for this which I applied earlier today.

--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlrXcPIACgkQJNaLcl1U
h9CCIAf/eF+L52UsAb/zYblEOaMrc+d+LbuwcYm8vq8Z6QXi/ASvHx/Yi/mkbc2g
zFmKpjzK+a3cm2eUBSGOqOxyF2SqUmoZYMZjHs5V4eJtK379G9B/Ok+tksj2R6Ir
TsYnt6xbUoGwnTGozSQ7kyb/Girjqpd9uq/tx7bNF7dg6BVCyk9fCbvsYGFJlyLE
rPvfl/avZTlByWLmGYKIxbJtV0h206PtJHvI5I9klxMx3dAfSmxwHd5d+k9qeb10
BzI16/pCmih6dewa+p0sfhiBB+Y0qPbjOzdmZYJ/qk1YZ+kyJ3LnhQEf21GuuaCt
5DHAFxRc1x1Z+2ZFO2FvvTvOCcgsNw==
=Mul6
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--
