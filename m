From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Sat, 19 Oct 2019 14:29:49 +0000
Subject: Re: [PATCH] coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <CAMpxmJVEXubtBhQs5wH00wvK=yp8nr0cZ04x9t8eCTLVU=O1JA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191017142237.9734-1-alexandre.belloni@bootlin.com>
 <81269cd6-e26d-b8aa-cf17-3a2285851564@web.de>
 <20191019120941.GL3125@piout.net>
In-Reply-To: <20191019120941.GL3125@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linuxfoundation.org>, Markus Elfring <Markus.Elfring@web.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Coccinelle <cocci@systeme.lip6.fr>

sob., 19 paź 2019 o 14:09 Alexandre Belloni
<alexandre.belloni@bootlin.com> napisał(a):
>
> On 19/10/2019 11:00:47+0200, Markus Elfring wrote:
> > > While it is useful for new drivers to use devm_platform_ioremap_resource,
> >
> > This is nice.
> >
> >
> > > this script is currently used to spam maintainers,
> >
> > This view is unfortunate.
> >
> > Do we stumble on a target conflict again?
> >
> >
> > > often updating very old drivers.
> >
> > This can also happen.
> >
> >
> > > The net benefit is the removal of 2 lines of code in the driver
> >
> > Additional effects can be reconsidered, can't they?
> >
>
> What are the additional effects? What is the end goal of converting all
> the existing drivers to devm_platform_ioremap_resource? The existing
> code is currently always correct and it is difficult to see how this
> would lead to any bug avoidance in the long term.
>
> > > but the review load for the maintainers is huge.
> >
> > Does collateral evolution trigger a remarkable amount of changes occasionally?
> >
>
> This is not an evolution, it is unnecessary churn. Those patches have no
> benefit and eat up very valuable reviewer time.
>
> >
> > How will such feedback influence the development and integration of
> > further scripts for the semantic patch language (Coccinelle software)?
> >
>
> There are a few other scripts that have no added value when applied to
> existing code, like ptr_ret.cocci.
>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Hi Alexandre,

Markus has been black-listed by several core maintainers already, I
think you're wasting your time arguing. WRT the patch: when
introducing this wrapper, I definitely didn't expect people to send
hundreds of often wrong patches based on coccinelle reports, so I
guess removing the script is correct.

Bart
