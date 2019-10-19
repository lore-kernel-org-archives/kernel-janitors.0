From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 19 Oct 2019 14:06:52 +0000
Subject: Re: coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <389d4ad6-7f57-2060-f00a-ac2295052b22@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191017142237.9734-1-alexandre.belloni@bootlin.com>
 <81269cd6-e26d-b8aa-cf17-3a2285851564@web.de>
 <20191019120941.GL3125@piout.net>
In-Reply-To: <20191019120941.GL3125@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Himanshu Jha <himanshujha199640@gmail.com>, kernel-janitors@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Michal Marek <michal.lkml@markovi.net>, YueHaibing <yuehaibing@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> What are the additional effects?

I suggest to take another look at the commit 7945f929f1a77a1c8887a97ca07f87626858ff42
("drivers: provide devm_platform_ioremap_resource()" from 2019-02-20)
which triggered the discussed software evolution.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/base/platform.c


> What is the end goal of converting all the existing drivers to devm_platform_ioremap_resource?

It was accepted by well-known Linux developers to put two function calls
into another wrapper function.


> This is not an evolution, it is unnecessary churn. Those patches have no
> benefit and eat up very valuable reviewer time.

I am curious if other contributors would like to describe more variants
of software development opinions in affected areas.


>> How will such feedback influence the development and integration of
>> further scripts for the semantic patch language (Coccinelle software)?
>
> There are a few other scripts that have no added value when applied to
> existing code, like ptr_ret.cocci.

Would you like to clarify concerns around such source code transformation
approaches in more detail?

Regards,
Markus
