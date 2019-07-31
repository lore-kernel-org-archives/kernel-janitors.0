From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 31 Jul 2019 06:44:29 +0000
Subject: Re: patch "coccinelle: Add script to check for platform_get_irq() excessive" added to driver-core-ne
Message-Id: <00bc6fea-f505-56d2-3803-1ac0882436b7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <156455237123959@kroah.com>
In-Reply-To: <156455237123959@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <swboyd@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr
Cc: Rob Herring <robh@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Nicolas Palix <nicolas.palix@imag.fr>, Russell King <linux@armlinux.org.uk>, Javier Martinez Canillas <javierm@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

> This is a note to let you know that I've just added the patch titled
>
>     coccinelle: Add script to check for platform_get_irq() excessive
>
> to my driver-core git tree which can be found at
>     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
> in the driver-core-next branch.

I find it interesting somehow that this version of a script for
the semantic patch language can be integrated already in this
development branch.


> The patch will also be merged in the next major kernel release
> during the merge window.

How much will questionable implementation details influence this process?

Regards,
Markus
