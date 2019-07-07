From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 07 Jul 2019 12:38:17 +0000
Subject: Re: Coccinelle: api: add devm_platform_ioremap_resource script
Message-Id: <CAK7LNAT0kxA53k894sfRXOjcbyjj_mmY60JbKy5Lhi2qHJcC9g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1907061538580.2523@hadrien>
 <de953581-7ae6-952c-3922-3d5b25f48e17@web.de>
In-Reply-To: <de953581-7ae6-952c-3922-3d5b25f48e17@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Coccinelle <cocci@systeme.lip6.fr>

On Sun, Jul 7, 2019 at 6:56 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> >> I will apply with Julia's Signed-off-by instead of Acked-by.
>
> >> I will also add SPDX tag.
>
> >>
>
> >> Is this OK?
>
>
> >
> > Yes, thanks.
>
>
> Will the clarification for following implementation details get any more
> software development attention?
> https://systeme.lip6.fr/pipermail/cocci/2019-June/005975.html
> https://lore.kernel.org/lkml/7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de/
>
> * The flag “IORESOURCE_MEM”
>
> * Exclusion of variable assignments by SmPL when constraints


OK, for this refactoring to happen,
the second argument should be IORESOURCE_MEM
instead of generic 'arg2'.

Himanshu,
Will you send v2?



-- 
Best Regards
Masahiro Yamada
