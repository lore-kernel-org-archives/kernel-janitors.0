From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Feb 2020 13:52:54 +0000
Subject: Re: [PATCH] gpio: siox: use raw spinlock for irq related locking
Message-Id: <CACRpkdYXBn+30HJWU7rbvfkgmwxxiRs7k3H9KWNb-X1WLEgt4w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87d0al4600.fsf@nanos.tec.linutronix.de> <20200211135121.15752-1-uwe@kleine-koenig.org>
In-Reply-To: <20200211135121.15752-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Thorsten Scherer <t.scherer@eckelmann.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>

On Tue, Feb 11, 2020 at 2:59 PM Uwe Kleine-König <uwe@kleine-koenig.org> wrote:

> All the irq related callbacks are called with the (raw) spinlock
> desc->lock being held. So the lock here must be raw as well. Also irqs
> were already disabled by the caller for the irq chip callbacks, so the
> non-irq variants of spin_lock must be used there.
>
> Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>

Patch applied. Is this a regression so I should put it in fixes?
I put it for v5.7 for now but I can easily change that.

Yours,
Linus Walleij
