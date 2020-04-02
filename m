From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Thu, 02 Apr 2020 14:15:10 +0000
Subject: Re: [PATCH] pwm: meson: remove redundant assignment to variable fin_freq
Message-Id: <20200402141510.yrjqhmccz6xjaknv@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402110857.509844-1-colin.king@canonical.com>
In-Reply-To: <20200402110857.509844-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org

On Thu, Apr 02, 2020 at 12:08:57PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable fin_freq is being initialized with a value that is never
> read and it is being updated later with a new value. The initialization
> is redundant and can be removed.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This was introduced in 211ed630753d ("pwm: Add support for Meson PWM
Controller"), adding Neil To Cc:.

I don't think this was added to cope for a compiler not being able to
see the variable is used initialized only.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 8cf9129caa39..bd0d7336b898 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -163,7 +163,7 @@ static int meson_pwm_calc(struct meson_pwm *meson, st=
ruct pwm_device *pwm,
>  {
>  	struct meson_pwm_channel *channel =3D pwm_get_chip_data(pwm);
>  	unsigned int duty, period, pre_div, cnt, duty_cnt;
> -	unsigned long fin_freq =3D -1;
> +	unsigned long fin_freq;
> =20
>  	duty =3D state->duty_cycle;
>  	period =3D state->period;

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
