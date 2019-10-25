From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 25 Oct 2019 08:08:43 +0000
Subject: Re: coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <20191025080843.GG32742@smile.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
 <693a3b68-a0f1-81fe-40ce-2b6ba189450c@web.de>
 <868spgzcti.wl-maz@kernel.org>
 <c8816d85b696cb96318e17b7010b84f09bc67bf7.camel@perches.com>
 <CAK7LNAQqSThGRM_wRGR2ou3B+Oqpr0nF9Fg4rhSR4Hvnxwnj3g@mail.gmail.com>
In-Reply-To: <CAK7LNAQqSThGRM_wRGR2ou3B+Oqpr0nF9Fg4rhSR4Hvnxwnj3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michal Marek <michal.lkml@markovi.net>, YueHaibing <yuehaibing@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linuxfoundation.org>, Markus Elfring <Markus.Elfring@web.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, Nicolas Palix <nicolas.palix@imag.fr>, Coccinelle <cocci@systeme.lip6.fr>

On Fri, Oct 25, 2019 at 12:40:52AM +0900, Masahiro Yamada wrote:
> On Sun, Oct 20, 2019 at 7:13 AM Joe Perches <joe@perches.com> wrote:
> > On Sat, 2019-10-19 at 21:43 +0100, Marc Zyngier wrote:

> Alexandre Belloni used
> https://lore.kernel.org/lkml/9bbcce19c777583815c92ce3c2ff2586@www.loen.fr/
> as a reference, but this is not the output from coccicheck.
> The patch author just created a wrong patch by hand.

Exactly. Removal of the script is a mistake. Like I said before is a healing
(incorrect by the way!) by symptoms.

> The deleted semantic patch supports MODE=patch,
> which creates a correct patch, and is useful.

Right!

-- 
With Best Regards,
Andy Shevchenko
