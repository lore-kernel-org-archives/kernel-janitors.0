From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Sat, 11 Apr 2020 16:37:36 +0000
Subject: Re: [PATCH] pwm: Add missing '\n' in log messages
Message-Id: <20200411163736.mcxk5ujzjy5mzjib@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200411153528.30130-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200411153528.30130-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: thierry.reding@gmail.com, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello,

On Sat, Apr 11, 2020 at 05:35:28PM +0200, Christophe JAILLET wrote:
> Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
>=20
> Fixes: 3ad1f3a33286 ("pwm: Implement some checks for lowlevel drivers")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/pwm/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 9973c442b455..bca04965bfe6 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -537,7 +537,7 @@ static void pwm_apply_state_debug(struct pwm_device *=
pwm,
> =20
>  	if (!state->enabled && s2.enabled && s2.duty_cycle > 0)
>  		dev_warn(chip->dev,
> -			 "requested disabled, but yielded enabled with duty > 0");
> +			 "requested disabled, but yielded enabled with duty > 0\n");

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
