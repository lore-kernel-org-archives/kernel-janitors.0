From: Wolfram Sang <wsa@kernel.org>
Date: Mon, 08 Jun 2020 20:30:55 +0000
Subject: Re: [PATCH] i2c: npcm7xx: Fix a couple error codes in probe
Message-Id: <20200608203055.GA917@ninjato>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="5vNYLRcllDrimb99"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200608141727.GC1912173@mwanda>
In-Reply-To: <20200608141727.GC1912173@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tali Perry <tali.perry1@gmail.com>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2020 at 05:17:27PM +0300, Dan Carpenter wrote:
> The code here is accidentally returning IS_ERR() which is 1 but it
> should be returning negative error codes with PTR_ERR().
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-5.8, thanks!


--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7en/sACgkQFA3kzBSg
KbZttQ/9Ey8Kf2SvVwUBxEWRZzA0wki7LFu+OIJR8IdQvyx13t2rYOSLZ8Rh7ehZ
GYENcTfBohlyr0V2Rd0sVL0MjhwpDjUYFyBvMlz9fOP2+xmlq2uF+iOINIToz0CJ
RTqYfOXxbqfcnQBUXuQWKJJc7rQyhwEWOS3VdTUt/khe2Kg60hfrYO5jkXwucm0B
ULVWXiu5UYWLo0xwstbUPPkFk8dUleR6wnNqVhtgmG5RdbUnNCxpGhVqAymqzX0l
YQUpURv9HP+wZERAIryr0nk+P9h41Wfh/pG1vXQkQ1i1zl9yU35yS9tpZnRJeVW3
7FkjsNO9ZSlmKIjMI7lpPZgOI7jLL3a764UmUM2tSy/KgDFdzWkZ8065U+rx8nOE
8Yc3Rw3xQsZb8xorwn/a1UtpY25uEBM1oxKMsgXvvNW/zbyxMu9Pw0PJSWB5WCXp
pvcY+Wfec6v6CGX66Wm3OqHfZquMwcn5xUp+zdX5SouNIuQw8lVZksh91ZGBxakZ
4uVm1JGYPJoZvMY1UDLFZ1AadeODlsCIr4GOkDyfFL7M9XJ/Un6/gsAjpAtAsQx0
iUJPvdcuJE5T6vW2K1+TkyjabjpSHc/zoJ3SOzgO8MKrQZOLqUPUn4RziIxglqMm
rzkMUWqK034wLy9uzYgPZo+7JnhvyFNRM2sBxldH4q/IcFOOrPI=
=IgmB
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
