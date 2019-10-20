From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 20 Oct 2019 05:38:30 +0000
Subject: Re: coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <alpine.DEB.2.21.1910200735400.3689@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
 <693a3b68-a0f1-81fe-40ce-2b6ba189450c@web.de> <868spgzcti.wl-maz@kernel.org>
In-Reply-To: <868spgzcti.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Zyngier <maz@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michal Marek <michal.lkml@markovi.net>, YueHaibing <yuehaibing@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, Linus Torvalds <torvalds@linuxfoundation.org>, Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Coccinelle <cocci@systeme.lip6.fr>

> If said script was providing a correct semantic patch instead of being
> an incentive for people to churn untested patches that span the whole
> tree, that'd be a different story. But that's not what this is about.

What is the actual incorrectness with the script?

An option could be to adjust the rule such that it can be run with an
extra command line option, like -D developer but is not run by default by
make coccicheck.

thanks,
julia
