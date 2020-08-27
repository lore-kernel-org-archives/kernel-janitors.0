From: Sebastian Reichel <sre@kernel.org>
Date: Thu, 27 Aug 2020 22:03:20 +0000
Subject: Re: [PATCH] power: pm2301_charger: fix spelling mistake "chargind" -> "charging"
Message-Id: <20200827220320.emd326ges4xvmh57@earth.universe>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="irgerrldmpxdwxr5"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805103857.15725-1-colin.king@canonical.com>
In-Reply-To: <20200805103857.15725-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--irgerrldmpxdwxr5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 05, 2020 at 11:38:57AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in a dev_dbg message. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks, queued.

-- Sebastian

>  drivers/power/supply/pm2301_charger.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/supply/pm2301_charger.c b/drivers/power/supply=
/pm2301_charger.c
> index 17749fc90e16..787867805944 100644
> --- a/drivers/power/supply/pm2301_charger.c
> +++ b/drivers/power/supply/pm2301_charger.c
> @@ -396,7 +396,7 @@ static int pm2_int_reg3(void *pm2_data, int val)
> =20
>  	if (val & (PM2XXX_INT4_ITCHARGINGON)) {
>  		dev_dbg(pm2->dev ,
> -			"chargind operation has started\n");
> +			"charging operation has started\n");
>  	}
> =20
>  	if (val & (PM2XXX_INT4_ITVRESUME)) {
> --=20
> 2.27.0
>=20

--irgerrldmpxdwxr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl9ILagACgkQ2O7X88g7
+poolg//QUkPRykffzY0baeQLXfefP7obgkkjTBU5f2BsgVEKU4AJFEGKVf30srg
nJRXNGfdka6mikKDiWDXEzo7BhwxdYs+pyno0EaIQKnI5rbWaoqeLoUKlGOjrAoO
/3pgc/HU6wmkTRgkcw2KW1DCbIcP+xsaNXZenlLQDMamHDwT7zQJtaW7LsCufVsz
fFwkJX0WCn0EzEX+OHHo4eyCWM1xib/a8creF7kmohspXlgiBFq1HvMZbH3mLm5R
ryU+QoXFht1ViJkwOJ2egChd8rDnOMyfj3AgvFpZbPsYK/arbC1jelMYJX+JELUE
/4VfJLl2WcM/Vx4KeVql7nwIbkn8aGFWZl5ZLFkNaicq6aUTaRdl9YTm7VUWKZkF
75yHqAoXDSCb+yAvjVkcOiidu/tnI02nIW/ZbJHCWiwI2/uNX7bPQp2sAXKS1t9O
MQkTv7Lf+6DT0rFrti3xh9/MbsunusIoARKiz5yipNkqAUW284rrH3lq9GRpK2bU
upC6hfUGo4k++LHc38zscH5SO1QGaQxo7zaHoYm6FzPF6qfIbfWMG0koLi1QSww4
3xD/xzufgftvo51LU3CkUpiAcpgTweQtattoEcgzsl0NJr4fNI3d9X7VGUrTX1xJ
GadXsz25HD4pZu1A4H7cPD7nj8jM4TlvRLx4kPS6ga/MjjgOrUI=
=0Lqn
-----END PGP SIGNATURE-----

--irgerrldmpxdwxr5--
