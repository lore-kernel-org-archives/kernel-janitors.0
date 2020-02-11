From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Tue, 11 Feb 2020 08:01:38 +0000
Subject: Re: [PATCH] gpio: siox: potentially enabling IRQs too early
Message-Id: <20200211080138.6bm5toge74wjncxw@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200211073511.r24n3bygyjxrsuez@kili.mountain>
In-Reply-To: <20200211073511.r24n3bygyjxrsuez@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Thorsten Scherer <t.scherer@eckelmann.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

[Dropped Gavin Schenk from recipients as he left Eckelmann. Added tglx.]

Hello,

On Tue, Feb 11, 2020 at 10:35:44AM +0300, Dan Carpenter wrote:
> Smatch thinks that gpio_siox_irq_set_type() can be called from
> probe_irq_on().  In that case the call to spin_unlock_irq() would
> renable IRQs too early.
>=20
> Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpio/gpio-siox.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
> index 311f66757b92..578b71760939 100644
> --- a/drivers/gpio/gpio-siox.c
> +++ b/drivers/gpio/gpio-siox.c
> @@ -133,10 +133,11 @@ static int gpio_siox_irq_set_type(struct irq_data *=
d, u32 type)
>  	struct irq_chip *ic =3D irq_data_get_irq_chip(d);
>  	struct gpio_siox_ddata *ddata >  		container_of(ic, struct gpio_siox_dd=
ata, ichip);
> +	unsigned long flags;
> =20
> -	spin_lock_irq(&ddata->irqlock);
> +	spin_lock_irqsave(&ddata->irqlock, flags);
>  	ddata->irq_type[d->hwirq] =3D type;
> -	spin_unlock_irq(&ddata->irqlock);
> +	spin_unlock_irqrestore(&ddata->irqlock, flags);

"Normally" the .irq_set_type() callback is called from irq_set_irq_type.
There desc->lock is taken with raw_spin_lock_irqsave (as part of
irq_get_desc_buslock()), so I assume irqs are always disabled when the
type changes? tglx?

If so, the better fix would be to change to spin_lock/spin_unlock
instead. Also given that a raw spinlock is taken, the irqlock here
should be changed to a raw one, too?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
