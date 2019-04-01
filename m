From: Mark Brown <broonie@kernel.org>
Date: Mon, 01 Apr 2019 03:19:31 +0000
Subject: Re: [PATCH] spi: oc-tiny: fix negative loop bound error on for loop
Message-Id: <20190401031931.GB2059@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="VrqPEDrXMn8OVzN4"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330212300.11675-1-colin.king@canonical.com>
In-Reply-To: <20190330212300.11675-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 30, 2019 at 09:23:00PM +0000, Colin King wrote:

> Fixes: ca632f556697 ("spi: reorganize drivers")

Please think about the fixes tags you're applying, this is obviously not
the source of the issue.

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlyhg0IACgkQJNaLcl1U
h9Cs6Qf9Fpbz2BMlEdLo7nS++JCHNNgHm4Bze8OKx/kUYqaoIGevJQa3I+XiiwdV
gEiumPsY5r9I12LcUrzCS82kjns6BelBI8d+tDc/rQLwC2L/J8g6ykWbT7FW/2Op
18R6ghzM+Ht99Yh2QlUm4GBF8iRw6WhUvdUlPIGRXK6abwJSR+4Pt7WpbB6ulFv2
wwk4He5BTE3IQgRD2IrkWvFrx5YCTP2/x9ObdngJC3cMd/HehIF57JO3LKz9HmVL
fVcODQ16aLBAF+Ju6U9C9aULv6gfMw5ueVQv7uWiq3mTNlrXqbgX+U4QBJVIhZR9
6pQGzyzYs6+8TO7YnESyWZNgoaImJA==
=Q9Dc
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
