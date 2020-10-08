From: Sebastian Reichel <sre@kernel.org>
Date: Thu, 08 Oct 2020 22:37:16 +0000
Subject: Re: [PATCH][next] charger-manager: fix incorrect check on charging_duration_ms
Message-Id: <20201008223716.353rpnkvte7q3miv@earth.universe>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="wyfglm34rtjztloq"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200902133117.108025-1-colin.king@canonical.com>
In-Reply-To: <20200902133117.108025-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--wyfglm34rtjztloq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Colin,

On Wed, Sep 02, 2020 at 02:31:17PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the duration check on the discharging duration setting is
> checking the charging duration rather than the discharging duration
> due to a cut-n-paste coding error. Fix this by checking the value
> desc->charging_max_duration_ms.
>=20
> Addresses-Coverity: ("Copy-paste-error")
> Fixes: 8fcfe088e21a ("charger-manager: Support limit of maximum possible")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks, queued.

-- Sebastian

>  drivers/power/supply/charger-manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/supply/charger-manager.c b/drivers/power/suppl=
y/charger-manager.c
> index 07992821e252..44d919954e9e 100644
> --- a/drivers/power/supply/charger-manager.c
> +++ b/drivers/power/supply/charger-manager.c
> @@ -471,7 +471,7 @@ static int check_charging_duration(struct charger_man=
ager *cm)
>  	} else if (cm->battery_status =3D=3D POWER_SUPPLY_STATUS_NOT_CHARGING) {
>  		duration =3D curr - cm->charging_end_time;
> =20
> -		if (duration > desc->charging_max_duration_ms) {
> +		if (duration > desc->discharging_max_duration_ms) {
>  			dev_info(cm->dev, "Discharging duration exceed %ums\n",
>  				 desc->discharging_max_duration_ms);
>  			ret =3D true;
> --=20
> 2.27.0
>=20

--wyfglm34rtjztloq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl9/lJwACgkQ2O7X88g7
+pozdQ//V0Z7wo7rb2YBOxWmUcpp1KjqM12cynFCTDgE7ydMT64gZKFnNjQBk9zg
Y/WesekfwYIDdqt/7/sXHzNitNZjn/WeyBIaJBx7L9eVpTYsQNHDdwgNEIzQByDP
9SlzveKeVDdxpGacfsrEsBVnIo70LKunZ0TUb5wZcpWzDWN1xBi6xnYAMPRrWhrp
HXIst3Jl8tAWQWCVu+kzY5SVUA2TmPAbNrtrJExpUcwX7/sajhgUv2g6qPPkOvaN
UM9DS+kS3GPPM7raHUmL4Ph1gzuFsXemUCnTuQUq0uQJSQzVWaR82kSUcGTearP9
lJXbbMFOx2eai6qHGaJnafJRNOsYW2xU8Lxqv/HfD/M0b9KZr71jy2NoQFMYR0Bm
/ZH2pczf2t70QqzpIo7ScZYXl6pwDmiyxbMLorybAyc9sSIErqa/qeX0vx9t30TK
uyLv+uqNoKziiQe+D5FfkH1Mc3be2iSZJ2G+z3Z2mGlPGQDDB4ETcCUudL2nVgjD
3z9Te0FqZ9QaslzTiZqiyd3tIt7gZbKp++DxdBcodwPkagI6D/4ZcVof5YKpLTYx
zzqa9fKWOdw8sYVQ2cUlcvgFsI9tA3cfE3+l6D2QckdKN5MTcEErHZKm6ISahgd2
2Y9nMid6NJ2psIG0ancF/o2D1p56G5B3D8lSNYLiyoDWhhOGQms=
=Cx8z
-----END PGP SIGNATURE-----

--wyfglm34rtjztloq--
