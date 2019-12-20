From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Fri, 20 Dec 2019 09:58:36 +0000
Subject: Re: [PATCH] clocksource/drivers/bcm2835_timer: fix memory leak of timer
Message-Id: <85475b50-5617-1ed0-3fe6-3dbaa18c236c@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191219213246.34437-1-colin.king@canonical.com>
In-Reply-To: <20191219213246.34437-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org


Applied, thanks!

On 19/12/2019 22:32, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently when setup_irq fails the error exit path will leak the
> recently allocated timer structure.  Originally the code would
> throw a panic but a later commit changed the behaviour to return
> via the err_iounmap path and hence we now have a memory leak. Fix
> this by adding a err_timer_free error path that kfree's timer.
>=20
> Addresses-Coverity: ("Resource Leak")
> Fixes: 524a7f08983d ("clocksource/drivers/bcm2835_timer: Convert init fun=
ction to return error")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/clocksource/bcm2835_timer.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clocksource/bcm2835_timer.c b/drivers/clocksource/bc=
m2835_timer.c
> index 2b196cbfadb6..b235f446ee50 100644
> --- a/drivers/clocksource/bcm2835_timer.c
> +++ b/drivers/clocksource/bcm2835_timer.c
> @@ -121,7 +121,7 @@ static int __init bcm2835_timer_init(struct device_no=
de *node)
>  	ret =3D setup_irq(irq, &timer->act);
>  	if (ret) {
>  		pr_err("Can't set up timer IRQ\n");
> -		goto err_iounmap;
> +		goto err_timer_free;
>  	}
> =20
>  	clockevents_config_and_register(&timer->evt, freq, 0xf, 0xffffffff);
> @@ -130,6 +130,9 @@ static int __init bcm2835_timer_init(struct device_no=
de *node)
> =20
>  	return 0;
> =20
> +err_timer_free:
> +	kfree(timer);
> +
>  err_iounmap:
>  	iounmap(base);
>  	return ret;
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
