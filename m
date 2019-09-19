From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 19 Sep 2019 07:21:57 +0000
Subject: Re: Coccinelle: api: add devm_platform_ioremap_resource script
Message-Id: <2cacd712-a8b8-6471-a9b4-23ba54434c02@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1907061538580.2523@hadrien>
 <de953581-7ae6-952c-3922-3d5b25f48e17@web.de>
 <CAK7LNAT0kxA53k894sfRXOjcbyjj_mmY60JbKy5Lhi2qHJcC9g@mail.gmail.com>
In-Reply-To: <CAK7LNAT0kxA53k894sfRXOjcbyjj_mmY60JbKy5Lhi2qHJcC9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>, kernel-janitors@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> OK, for this refactoring to happen,
> the second argument should be IORESOURCE_MEM
> instead of generic 'arg2'.

A corresponding adjustment was committed on 2019-07-17.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci?id=d09778d16e20bc4f1f4971cc9a9fd7ff6ba898ff

I constructed another variant of a script for the semantic patch language
based on this contribution.
I tried out to delete a bit of exception handling code after a call
of the function “platform_get_resource”.
Yesterday I sent a selection of patches from this transformation approach.
(An analysis based on “Linux next-20190916” pointed 56 source files
as update candidates out.)

Will it be useful to integrate such a case distinction into
the SmPL script directory?


The analysis based on the committed SmPL script pointed 657 source files
as update candidates out.
So there are further opportunities for collateral software evolution.
Can it become easier to check how many update suggestions are already
in corresponding patch review queues?

Regards,
Markus
