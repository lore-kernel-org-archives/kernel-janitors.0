From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 19 Oct 2019 11:35:49 +0000
Subject: Re: coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <693a3b68-a0f1-81fe-40ce-2b6ba189450c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
In-Reply-To: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Zyngier <maz@kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michal Marek <michal.lkml@markovi.net>, YueHaibing <yuehaibing@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Torvalds <torvalds@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> I think part of the issue is that the script reports a WARNING

How much does this information influence really the stress tolerance
and change resistance (or acceptance) for the presented collateral evolution?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci


> for something that is definitely correct code,

Can related software improvement possibilities be taken into account
again under other circumstances?


> and could instead be simply toned down.

Does this view mean that the mentioned script for the semantic patch language
should get another chance for integration?


> Anyway, FWIW:
>
> Acked-by: Marc Zyngier <maz@kernel.org>

Would you like to share any more constructive feedback?


Will similar source file mass updates be better picked up
by other well-known Linux developers?

Regards,
Markus
