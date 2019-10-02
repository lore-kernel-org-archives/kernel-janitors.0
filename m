From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Wed, 02 Oct 2019 10:16:24 +0000
Subject: Re: [PATCH] pwm: sun4i: redundant assignment to variable pval
Message-Id: <20191002101624.gljyf7g4nia2rcbx@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191002100844.10490-1-colin.king@canonical.com>
In-Reply-To: <20191002100844.10490-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org

On Wed, Oct 02, 2019 at 11:08:44AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Variable pval is being assigned a value that is never read. The
> assignment is redundant and hence can be removed.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pwm/pwm-sun4i.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index 6f5840a1a82d..53970d4ba695 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -156,7 +156,6 @@ static int sun4i_pwm_calculate(struct sun4i_pwm_chip =
*sun4i_pwm,
>  	if (sun4i_pwm->data->has_prescaler_bypass) {
>  		/* First, test without any prescaler when available */
>  		prescaler =3D PWM_PRESCAL_MASK;
> -		pval =3D 1;
>  		/*
>  		 * When not using any prescaler, the clock period in nanoseconds
>  		 * is not an integer so round it half up instead of

Looks fine, the issue exists since
deb9c462f4e539cc7f8389b9855eb7a507c78e7e.

You can even make pval a local variable for the second for loop.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
