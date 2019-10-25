From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 25 Oct 2019 08:38:00 +0000
Subject: Re: coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <alpine.DEB.2.21.1910251028260.2787@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
 <693a3b68-a0f1-81fe-40ce-2b6ba189450c@web.de> <868spgzcti.wl-maz@kernel.org>
 <c8816d85b696cb96318e17b7010b84f09bc67bf7.camel@perches.com>
 <CAK7LNAQqSThGRM_wRGR2ou3B+Oqpr0nF9Fg4rhSR4Hvnxwnj3g@mail.gmail.com>
 <20191025080843.GG32742@smile.fi.intel.com>
In-Reply-To: <20191025080843.GG32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michal Marek <michal.lkml@markovi.net>, YueHaibing <yuehaibing@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linuxfoundation.org>, Markus Elfring <Markus.Elfring@web.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Nicolas Palix <nicolas.palix@imag.fr>, Coccinelle <cocci@systeme.lip6.fr>



On Fri, 25 Oct 2019, Andy Shevchenko wrote:

> On Fri, Oct 25, 2019 at 12:40:52AM +0900, Masahiro Yamada wrote:
> > On Sun, Oct 20, 2019 at 7:13 AM Joe Perches <joe@perches.com> wrote:
> > > On Sat, 2019-10-19 at 21:43 +0100, Marc Zyngier wrote:
>
> > Alexandre Belloni used
> > https://lore.kernel.org/lkml/9bbcce19c777583815c92ce3c2ff2586@www.loen.fr/
> > as a reference, but this is not the output from coccicheck.
> > The patch author just created a wrong patch by hand.
>
> Exactly. Removal of the script is a mistake. Like I said before is a healing
> (incorrect by the way!) by symptoms.
>
> > The deleted semantic patch supports MODE=patch,
> > which creates a correct patch, and is useful.
>
> Right!

I ran it on the version of Linux that still has the script:

fe7d2c23d748e4206f4bef9330d0dff9abed7411

and managed to compile 341 of the generated files in the time I had
available, and all compiled successfully.  I can let it run again, and see
how it goes for the rest.  Perhaps it would be acceptable if there was no
report, and people would be forced to use the generated patch?

If someone is writing lots of patches on this issue by hand, then perhaps
they don't have make coccicheck to produce patches, and then would
overlook this case completely.

If it would be helpful, I could group the generated patches by maintainer
or by subdirectory and send them out, if it would be easier to review them
all at once.

Anyway, the rule is not in the kernel at the moment.  For it's future, I'm
open to whatever people find best.  Personally, I prefer when same things
are done in the same way - it makes the code easier to understand and
makes it simpler to address other issues when they arise.

julia
