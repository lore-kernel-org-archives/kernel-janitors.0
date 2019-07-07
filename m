From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 07 Jul 2019 09:55:37 +0000
Subject: Re: Coccinelle: api: add devm_platform_ioremap_resource script
Message-Id: <de953581-7ae6-952c-3922-3d5b25f48e17@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1907061538580.2523@hadrien>
In-Reply-To: <alpine.DEB.2.21.1907061538580.2523@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Coccinelle <cocci@systeme.lip6.fr>

>> I will apply with Julia's Signed-off-by instead of Acked-by.

>> I will also add SPDX tag.

>>

>> Is this OK?


>
> Yes, thanks.


Will the clarification for following implementation details get any more
software development attention?
https://systeme.lip6.fr/pipermail/cocci/2019-June/005975.html
https://lore.kernel.org/lkml/7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de/

* The flag “IORESOURCE_MEM”

* Exclusion of variable assignments by SmPL when constraints

Regards,
Markus
