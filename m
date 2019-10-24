From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 24 Oct 2019 15:40:52 +0000
Subject: Re: coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <CAK7LNAQqSThGRM_wRGR2ou3B+Oqpr0nF9Fg4rhSR4Hvnxwnj3g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
 <693a3b68-a0f1-81fe-40ce-2b6ba189450c@web.de>
 <868spgzcti.wl-maz@kernel.org>
 <c8816d85b696cb96318e17b7010b84f09bc67bf7.camel@perches.com>
In-Reply-To: <c8816d85b696cb96318e17b7010b84f09bc67bf7.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michal Marek <michal.lkml@markovi.net>, YueHaibing <yuehaibing@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Linus Torvalds <torvalds@linuxfoundation.org>, Markus Elfring <Markus.Elfring@web.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Coccinelle <cocci@systeme.lip6.fr>

On Sun, Oct 20, 2019 at 7:13 AM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2019-10-19 at 21:43 +0100, Marc Zyngier wrote:
> > Providing Coccinelle scripts that scream about perfectly valid code is
> > pointless, and the result is actively harmful.
>
> Doubtful.
>
> If the new code is smaller object code and correct
> than the conversion is worthwhile.

I agree.

We use multi-platform defconfig.
I always appreciate the code refactoring
that reduces the object size.



> fyi:
>
> There are already ~450 uses of this function and maybe
> ~800 possible additional conversions.
>
> > If said script was providing a correct semantic patch instead of being
> > an incentive for people to churn untested patches that span the whole
> > tree, that'd be a different story.
>
> Right.
>
>


Alexandre Belloni used
https://lore.kernel.org/lkml/9bbcce19c777583815c92ce3c2ff2586@www.loen.fr/
as a reference, but this is not the output from coccicheck.
The patch author just created a wrong patch by hand.

The deleted semantic patch supports MODE=patch,
which creates a correct patch, and is useful.


-- 
Best Regards
Masahiro Yamada
