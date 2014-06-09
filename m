From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Jun 2014 19:58:53 +0000
Subject: Re: [patch] regulator: 88pm800: remove duplicate PM800_BUCK3 define
Message-Id: <20140609195853.GM5099@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="iym2iLi12j4kk03o"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140609150951.GD9600@mwanda>
In-Reply-To: <20140609150951.GD9600@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--iym2iLi12j4kk03o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 09, 2014 at 06:09:52PM +0300, Dan Carpenter wrote:
> The PM800_BUCK3 define is cut and pasted twice so we can remove the
> second instance.

Applied, thanks.

--iym2iLi12j4kk03o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTlhH6AAoJELSic+t+oim9P1wP/3TKoOlZlE7tQnfX2R0j3XwS
gqkErSkQQAi7NpIfNG/IZa7BW+oi7a2o2kgQDDtKZh2KIKRKHlqTmyqvhc2wsStd
4w9c9otDj0t6y5g2BhNDHfaoIfqvvsz0IcAQXI4JvPgvzcBRt8Y6EgSfmRq+eIgm
50+6cE+hRTHCaQriKDI5AzuWKiZKtFyrIvRFHUXOT1Pu3I+ePyiLCRJNFn2hoEIR
8RY05gG0l+NWHEgVw4qrVhIJm/mYTJXRgSqfxk5yNizwf4sPP0sVFTn+bh/smGme
7wI/CAvHc1ELJnBZAGXJ/ons0qHLXsUN4PXKQ41xUoCRJBJamRW7HkxJ765/y2ia
mYQgV5KQWsTwinihAzx7RND3wW9IyaAAiDkM2Wcuy0rD0KCmq95wmuad79wnKPLm
m8vIEEWHZgd6VFpXmjg5luyu6dFwzrCPECqV7KyEq9ZeF+8K3YcXbBcR5pr0H+lP
EXgv1P0mbsAtfD6DmJb/7RANdWn5mjuMtEh5Rd0gQnBq3gXPO0UITJS513DckmU+
zITLigQQ7ywH5RkrXKIA0To79TCtag0tYHzk+kDuBPWIX99VVZBjSFXnATeqnbdG
3cAL9MclIevoGVk5ID7LDM2hmfif171NHWQs6dthm1S5kTqGDYdu/SRfRi7mtMrj
7qS8HRDWDbZJpDy3ntBY
=iZJI
-----END PGP SIGNATURE-----

--iym2iLi12j4kk03o--
