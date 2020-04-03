From: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 03 Apr 2020 19:43:55 +0000
Subject: Re: [PATCH] pwm: meson: remove redundant assignment to variable fin_freq
Message-Id: <20200403194355.GB201060@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="tjCHc7DPkfUGtrlw"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402110857.509844-1-colin.king@canonical.com>
In-Reply-To: <20200402110857.509844-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: linux-pwm@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2020 at 12:08:57PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable fin_freq is being initialized with a value that is never
> read and it is being updated later with a new value. The initialization
> is redundant and can be removed.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pwm/pwm-meson.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6HkfsACgkQ3SOs138+
s6HHhg//ZVsyNF1NKEv48QDcFr5adCAieVaCKk7J+kqjK7w2X2fnDrjuWXbmtlpb
drMho5uh8b597B5cDcFoprjQSeHl0D56JKiLgBYsBuBxeRsFcVUVS5zXxt8mlvFc
AIGKEPSSZsg+LFqlR5Msxf58M4YGYvG3lbFFQUOEN0I5K6W3wvfRY0+xGUvL0TC+
1kOy5HmhM8lFPv5h/zgs0biiFg32D5ghmaLduZN9VjUJLgPmnlR3nESaWbjiFdZv
XjGDkXPwx9+tJML2TzROxMWcBFFx7zBDfxHBvRfovv272QzMtpb7eT73Fh/cZSKQ
hMCslpZy5Vj/2HcHkRY/w1MN/NZAdX/mNhQaIw1gz2P30mJxvUUDOoOaAGk3k8p6
K2fUxY6YMthq7T731bAhROz1gxt4Ra0IMVksfAUSjBvHduIvOjikBJqTu+5TKIe3
FnXfzaOODWL9+DQwHZtYJIRv4z21DfPFJunzohcsHKptPf1AqMW1BJX+4XX5rIbn
dl0WS2h5BZ3lf/OU4FqXE6c9rKEj8NIZAYoYHTX1yDdQSI2G5GtFO811eGsN7h2C
uVtwi5Jj2Js8rSxFQDj4d/jIKpxppzOvTGEXl1/Xz5XzMwD4TBl7ILKFryCnYCN5
L6Y59GbxDRXjBGJuVj3HhV1bFnBcVqSFz5swfsnvXCMTNKp0wlk=
=9i9z
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
