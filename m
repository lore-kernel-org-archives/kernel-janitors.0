From: Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 11 Feb 2020 13:18:23 +0000
Subject: Re: [PATCH] gpio: siox: potentially enabling IRQs too early
Message-Id: <87d0al4600.fsf@nanos.tec.linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200211073511.r24n3bygyjxrsuez@kili.mountain> <20200211080138.6bm5toge74wjncxw@pengutronix.de> <87r1z14hzh.fsf@nanos.tec.linutronix.de> <20200211121748.woeix5ovpeo3gfc7@pengutronix.de>
In-Reply-To: <20200211121748.woeix5ovpeo3gfc7@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Thorsten Scherer <t.scherer@eckelmann.de>, Pengutronix Kernel Team <kernel@pengutronix.de>

Uwe,

Uwe Kleine-König <u.kleine-koenig@pengutronix.de> writes:
> On Tue, Feb 11, 2020 at 09:59:30AM +0100, Thomas Gleixner wrote:
>> Uwe Kleine-König <u.kleine-koenig@pengutronix.de> writes:
>> Indeed. Looking at the driver, all of the spin_lock_irq() usage in the
>> irqchip callbacks is broken.
>> 
>> So this needs two changes:
>> 
>>    1) Convert to raw spin lock, as this won't work on RT otherwise
>> 
>>    2) s/lock_irq/lock/ for all irqchip callbacks.
>
> Are you sure about the calls in gpio_siox_get_data()? This is only
> called by siox_poll() which doesn't disable irqs.

I explicitely said: "for all irqchip callbacks".

gpio_siox_get_data() is not a irq chip callback, right? So obviously it
has to stay there.

Thanks,

        tglx




  
