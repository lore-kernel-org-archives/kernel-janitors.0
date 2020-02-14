From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Fri, 14 Feb 2020 12:20:36 +0000
Subject: Re: [PATCH] gpio: siox: use raw spinlock for irq related locking
Message-Id: <20200214122036.n3zjx25b7kxqlr4o@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87d0al4600.fsf@nanos.tec.linutronix.de>
 <20200211135121.15752-1-uwe@kleine-koenig.org>
 <20200214110238.zkbfyzfjvkzipgjr@ws067.eckelmann.group>
In-Reply-To: <20200214110238.zkbfyzfjvkzipgjr@ws067.eckelmann.group>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Thorsten Scherer <thorsten.scherer@eckelmann.de>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Dan Carpenter <dan.carpenter@oracle.com>

Hello Thorsten,

On Fri, Feb 14, 2020 at 12:02:38PM +0100, Thorsten Scherer wrote:
> AFAICT this is all good.
>=20
> Unfortunately i don't have any idea on how to test out the difference
> this patch makes on a real SIOX.

When I started looking into the problem I expected that the lock
debugging would catch these problems. But either I did something wrong
or there is no mechanism that catches

 - a spinlock is taken when there is already a raw spinlock taken
 - spin_lock_irq is used with irqs already off

And I wonder if there are reasons I don't see that make these two tests
a bad idea.

> Any hints? Is it necessary at all?

Apart from "normal" testing that SIOX still works I have no good
suggestion. Having said that I would be surprised if my patch breaked
something. (But it wouldn't be the first time such a surprise happens
:-)

Best regards
Uwe
--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
