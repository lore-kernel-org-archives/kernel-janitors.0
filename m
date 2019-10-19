From: Joe Perches <joe@perches.com>
Date: Sat, 19 Oct 2019 22:13:24 +0000
Subject: Re: coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <c8816d85b696cb96318e17b7010b84f09bc67bf7.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
 <693a3b68-a0f1-81fe-40ce-2b6ba189450c@web.de>
 <868spgzcti.wl-maz@kernel.org>
In-Reply-To: <868spgzcti.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Zyngier <maz@kernel.org>, Markus Elfring <Markus.Elfring@web.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michal Marek <michal.lkml@markovi.net>, YueHaibing <yuehaibing@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, Linus Torvalds <torvalds@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Coccinelle <cocci@systeme.lip6.fr>

On Sat, 2019-10-19 at 21:43 +0100, Marc Zyngier wrote:
> Providing Coccinelle scripts that scream about perfectly valid code is
> pointless, and the result is actively harmful.

Doubtful.

If the new code is smaller object code and correct
than the conversion is worthwhile.

fyi:

There are already ~450 uses of this function and maybe
~800 possible additional conversions.

> If said script was providing a correct semantic patch instead of being
> an incentive for people to churn untested patches that span the whole
> tree, that'd be a different story.

Right.
