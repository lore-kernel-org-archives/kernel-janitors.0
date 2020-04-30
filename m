From: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 30 Apr 2020 14:07:12 +0000
Subject: Re: [PATCH] i2c: stm32f7: prevent array underflow in stm32f7_get_lower_rate()
Message-Id: <20200430140712.GA3355@ninjato>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="oyUTqETQ0mS9luUI"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429132323.GB815283@mwanda>
In-Reply-To: <20200429132323.GB815283@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Alain Volmat <alain.volmat@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 04:23:23PM +0300, Dan Carpenter wrote:
> We want to break with "i" set to zero whether we find the rate we want
> or not.  In the current code, if we don't find the rate we want then it
> exits the loop with "i" set to -1 and results in an array underflow.
>=20
> Fixes: 09cc9a3bce91 ("i2c: stm32f7: allows for any bus frequency")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-next, thanks!


--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6q24wACgkQFA3kzBSg
KbY5gA/6AzWyIXBatskD8xK+ZAovWjUjVQp5YTU97M1XZE2JP583MJkhqUjhd9Yg
o/qYLs0VwUfk+Beir3RwwWmO6Kk0LoSs1ppxFcc0FKM69w7hQyU73T5sTWZTrEvH
7m2wuhrTfLOHEIMCIrOzET+WXJF53PAJmyBpBtcO1kVLRT2lW7KILYc3pgRlgoI3
WhOvgt8VhHmII4+qE7lZ/UhYdtwrIu0I9lcAPcfBndqCUKWLL8kKX1H5/AqSE2De
+R6Pce6v478wDnJ7FrSlgerJ+Kv/54NipuYzRyEm3tgEXJm5uQApMXulxi7Bhese
E0ebjkvsLdfA842MS/+fIdxRSoyyZGgqS7zq6pOhubjsxdOo5evRDI3NdTcQhznZ
XHvPUs9Cu0PBuyCanUPsfI7yxe/zLHY8wWCiLoZcSepLwp7ApU7aJSXqRTE/oCBZ
1iorrv/gfPxLUA+KwhpeYE4pL+lX1p6l6zsSA1GItZzJrWUF9bnwXAHaw9eeJMIQ
Srtbra0sUqqrVq3OkQvwC8erJ2GXbxe/NCVuU4OFAOtwq7zousxfVmI6l6N/+Ido
Vs1wgDnBqvE57pl+LswFfVC25PR5MQ5C3Rxv6Lqi2N7o1lXFIAoXuON1tw/ymzB1
Z3VZEApncCTQ4Mt5pXopoWGP8O8FAKAgzudUrjLsJfMUVVF+U6Y=
=XwWa
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
