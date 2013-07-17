From: Mark Brown <broonie@kernel.org>
Date: Wed, 17 Jul 2013 15:05:38 +0000
Subject: Re: [patch] spi/xilinx: signedness issue checking platform_get_irq()
Message-Id: <20130717150538.GT22506@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="VB8cwN2oRT/o81UX"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130717122638.GB4851@elgon.mountain>
In-Reply-To: <20130717122638.GB4851-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--VB8cwN2oRT/o81UX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 17, 2013 at 03:26:38PM +0300, Dan Carpenter wrote:
> "xspi->irq" is unsigned int so it's never less than zero.  I have added
> a cast.

Why is this better than changing irq to a signed type?

--VB8cwN2oRT/o81UX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5rK/AAoJELSic+t+oim9yC4P/jzZrli1NzhT08IAou2U5EeH
TXWx/qwCESDWJXrrhfPGf3GV/csuJGgMJpIKP8yzB/TNQZhMe442mR2cdjwzHF8A
a9p2MmnksKrH9kJ8T81OQcITiMH0Wt1/N3UVlNwdTSQlK970GCNbY9udixSETT4c
MJhx91jXLg5t6qFixjQAmVnc0gxDFzEbHkfWPov92rmXDCLukFp8d7l7Ss/I/a/+
wy4/owCP13f227qgXlYgxCYW7qvm5e5rN98PnHpsBvreKqQxU4Axd0J7oZOx8YhS
D/0/AXWW6bwg11Szux9/8s+udYKVwd/Khb1KnoXFkikCutjDrvqJ5vhow9GKDqcZ
5UkDYjcmzt9hxRe20Z8bJxhjeKTetEtkXooUOIWTTGpx8gIVFgcQ5WAqT5NyE++D
r845x+XGioOo5/xixCx5qoo1QgvTs4AS//7W6OmzJmnOKwyZQjLb7wObXQVgkSTP
oNBhd7k1LhfEj+Wwgy6Odj+7wEwDc02rJbaxVroST+ksS2tD4OmTxr7GUoHs7fEs
V1umtT4UKFp19jb9hToMhKgi3an2FQzIuplmAWtzcN+vBq4WT+XApwVIN9ZZ2lUj
1pPD/c+/5tA2sEy/cbvlxG4U8ExkXwLTAjgs3RwFVblqWat3WgORub3gkf+oHDIV
D5A9bvXvZEXe3cm4mxkq
=dhmT
-----END PGP SIGNATURE-----

--VB8cwN2oRT/o81UX--
