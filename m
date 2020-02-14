From: Thorsten Scherer <thorsten.scherer@eckelmann.de>
Date: Fri, 14 Feb 2020 11:02:38 +0000
Subject: Re: [PATCH] gpio: siox: use raw spinlock for irq related locking
Message-Id: <20200214110238.zkbfyzfjvkzipgjr@ws067.eckelmann.group>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87d0al4600.fsf@nanos.tec.linutronix.de>
 <20200211135121.15752-1-uwe@kleine-koenig.org>
In-Reply-To: <20200211135121.15752-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org

Hello,

AFAICT this is all good.

Unfortunately i don't have any idea on how to test out the difference
this patch makes on a real SIOX.

Any hints? Is it necessary at all?

Thank you.

Kind regards
Thorsten

Acked-by: Thorsten Scherer <t.scherer@eckelmann.de>

On Tue, Feb 11, 2020 at 02:51:21PM +0100, Uwe Kleine-K=F6nig wrote:
> All the irq related callbacks are called with the (raw) spinlock
> desc->lock being held. So the lock here must be raw as well. Also irqs
> were already disabled by the caller for the irq chip callbacks, so the
> non-irq variants of spin_lock must be used there.
>=20
> Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
> Signed-off-by: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> ---
> >=20
> > I explicitely said: "for all irqchip callbacks".
> >=20
> > gpio_siox_get_data() is not a irq chip callback, right? So obviously it
> > has to stay there.
>=20
> Ah, I read "irqchip callbacks" as "spinlock calls". Thanks to restate
> this for me.
>=20
> Thanks
> Uwe
>=20
>  drivers/gpio/gpio-siox.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
> index 311f66757b92..26e1fe092304 100644
> --- a/drivers/gpio/gpio-siox.c
> +++ b/drivers/gpio/gpio-siox.c
> @@ -15,7 +15,7 @@ struct gpio_siox_ddata {
>  	u8 setdata[1];
>  	u8 getdata[3];
> =20
> -	spinlock_t irqlock;
> +	raw_spinlock_t irqlock;
>  	u32 irq_enable;
>  	u32 irq_status;
>  	u32 irq_type[20];
> @@ -44,7 +44,7 @@ static int gpio_siox_get_data(struct siox_device *sdevi=
ce, const u8 buf[])
> =20
>  	mutex_lock(&ddata->lock);
> =20
> -	spin_lock_irq(&ddata->irqlock);
> +	raw_spin_lock_irq(&ddata->irqlock);
> =20
>  	for (offset =3D 0; offset < 12; ++offset) {
>  		unsigned int bitpos =3D 11 - offset;
> @@ -66,7 +66,7 @@ static int gpio_siox_get_data(struct siox_device *sdevi=
ce, const u8 buf[])
> =20
>  	trigger =3D ddata->irq_status & ddata->irq_enable;
> =20
> -	spin_unlock_irq(&ddata->irqlock);
> +	raw_spin_unlock_irq(&ddata->irqlock);
> =20
>  	ddata->getdata[0] =3D buf[0];
>  	ddata->getdata[1] =3D buf[1];
> @@ -84,9 +84,9 @@ static int gpio_siox_get_data(struct siox_device *sdevi=
ce, const u8 buf[])
>  			 * handler of the irq chip. But it doesn't, so we have
>  			 * to clean the irq_status here.
>  			 */
> -			spin_lock_irq(&ddata->irqlock);
> +			raw_spin_lock_irq(&ddata->irqlock);
>  			ddata->irq_status &=3D ~(1 << offset);
> -			spin_unlock_irq(&ddata->irqlock);
> +			raw_spin_unlock_irq(&ddata->irqlock);
> =20
>  			handle_nested_irq(irq);
>  		}
> @@ -101,9 +101,9 @@ static void gpio_siox_irq_ack(struct irq_data *d)
>  	struct gpio_siox_ddata *ddata >  		container_of(ic, struct gpio_siox_dd=
ata, ichip);
> =20
> -	spin_lock_irq(&ddata->irqlock);
> +	raw_spin_lock(&ddata->irqlock);
>  	ddata->irq_status &=3D ~(1 << d->hwirq);
> -	spin_unlock_irq(&ddata->irqlock);
> +	raw_spin_unlock(&ddata->irqlock);
>  }
> =20
>  static void gpio_siox_irq_mask(struct irq_data *d)
> @@ -112,9 +112,9 @@ static void gpio_siox_irq_mask(struct irq_data *d)
>  	struct gpio_siox_ddata *ddata >  		container_of(ic, struct gpio_siox_dd=
ata, ichip);
> =20
> -	spin_lock_irq(&ddata->irqlock);
> +	raw_spin_lock(&ddata->irqlock);
>  	ddata->irq_enable &=3D ~(1 << d->hwirq);
> -	spin_unlock_irq(&ddata->irqlock);
> +	raw_spin_unlock(&ddata->irqlock);
>  }
> =20
>  static void gpio_siox_irq_unmask(struct irq_data *d)
> @@ -123,9 +123,9 @@ static void gpio_siox_irq_unmask(struct irq_data *d)
>  	struct gpio_siox_ddata *ddata >  		container_of(ic, struct gpio_siox_dd=
ata, ichip);
> =20
> -	spin_lock_irq(&ddata->irqlock);
> +	raw_spin_lock(&ddata->irqlock);
>  	ddata->irq_enable |=3D 1 << d->hwirq;
> -	spin_unlock_irq(&ddata->irqlock);
> +	raw_spin_unlock(&ddata->irqlock);
>  }
> =20
>  static int gpio_siox_irq_set_type(struct irq_data *d, u32 type)
> @@ -134,9 +134,9 @@ static int gpio_siox_irq_set_type(struct irq_data *d,=
 u32 type)
>  	struct gpio_siox_ddata *ddata >  		container_of(ic, struct gpio_siox_dd=
ata, ichip);
> =20
> -	spin_lock_irq(&ddata->irqlock);
> +	raw_spin_lock(&ddata->irqlock);
>  	ddata->irq_type[d->hwirq] =3D type;
> -	spin_unlock_irq(&ddata->irqlock);
> +	raw_spin_unlock(&ddata->irqlock);
> =20
>  	return 0;
>  }
> @@ -222,7 +222,7 @@ static int gpio_siox_probe(struct siox_device *sdevic=
e)
>  	dev_set_drvdata(dev, ddata);
> =20
>  	mutex_init(&ddata->lock);
> -	spin_lock_init(&ddata->irqlock);
> +	raw_spin_lock_init(&ddata->irqlock);
> =20
>  	ddata->gchip.base =3D -1;
>  	ddata->gchip.can_sleep =3D 1;
> --=20
> 2.24.0
>=20

--
Thorsten Scherer | Eckelmann AG | www.eckelmann.de |
