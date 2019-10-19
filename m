From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 19 Oct 2019 16:36:08 +0000
Subject: Re: [PATCH] coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <88b84610-0789-3bdf-affe-de242f84554d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191017142237.9734-1-alexandre.belloni@bootlin.com>
 <81269cd6-e26d-b8aa-cf17-3a2285851564@web.de>
 <20191019120941.GL3125@piout.net>
 <CAMpxmJVEXubtBhQs5wH00wvK=yp8nr0cZ04x9t8eCTLVU=O1JA@mail.gmail.com>
In-Reply-To: <CAMpxmJVEXubtBhQs5wH00wvK=yp8nr0cZ04x9t8eCTLVU=O1JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel-janitors@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Markus has been black-listed by several core maintainers already,

I am still curious if this communication filter will ever be adjusted
in more positive directions.


> I think you're wasting your time arguing.

I hope that also this software development discussion can become
more constructive.


> WRT the patch: when introducing this wrapper, I definitely didn't expect
> people to send hundreds of often wrong patches based on coccinelle reports,

The reality can provide various surprises.


> so I guess removing the script is correct.

I suggest to reconsider this conclusion once more.
The application of SmPL script variants can be continued despite
of the recently committed file removal.


The constraints for the usage of available scripts for the semantic patch language
are explained to some degree.
https://bottest.wiki.kernel.org/coccicheck

Regards,
Markus
