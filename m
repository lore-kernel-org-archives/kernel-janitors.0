From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 19 Oct 2019 09:00:47 +0000
Subject: Re: [PATCH] coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <81269cd6-e26d-b8aa-cf17-3a2285851564@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191017142237.9734-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20191017142237.9734-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, kernel-janitors@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Torvalds <torvalds@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> While it is useful for new drivers to use devm_platform_ioremap_resource,

This is nice.


> this script is currently used to spam maintainers,

This view is unfortunate.

Do we stumble on a target conflict again?


> often updating very old drivers.

This can also happen.


> The net benefit is the removal of 2 lines of code in the driver

Additional effects can be reconsidered, can't they?


> but the review load for the maintainers is huge.

Does collateral evolution trigger a remarkable amount of changes occasionally?


How will such feedback influence the development and integration of
further scripts for the semantic patch language (Coccinelle software)?

Regards,
Markus
