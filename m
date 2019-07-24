From: Stephen Boyd <swboyd@chromium.org>
Date: Wed, 24 Jul 2019 18:23:46 +0000
Subject: Re: [PATCH v4 3/3] coccinelle: Add script to check for platform_get_irq() excessive prints
Message-Id: <5d38a232.1c69fb81.f85f4.67e3@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190723181624.203864-4-swboyd@chromium.org>
 <9b5d8470-dd6e-4358-141f-6b6c40774de1@web.de>
In-Reply-To: <9b5d8470-dd6e-4358-141f-6b6c40774de1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Markus Elfring <Markus.Elfring@web.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

Quoting Markus Elfring (2019-07-24 06:18:35)
> > +@script:python depends on org@
> > +p1 << r.p1;
> > +@@
> > +
> > +cocci.print_main(p1)
> 
> Will an additional message be helpful at this place?
> 
> 
> Will further software development considerations become more interesting
> also around a contribution like “Coccinelle: Add a SmPL script for
> the reconsideration of redundant dev_err() calls”?
> https://lore.kernel.org/lkml/2744a3fc-9e67-8113-1dd9-43669e06386a@web.de/
> https://lore.kernel.org/patchwork/patch/1095937/
> https://lkml.org/lkml/2019/7/1/145
> https://systeme.lip6.fr/pipermail/cocci/2019-July/006071.html
> 

Did this patch ever get merged? It seems better to amend that patch
instead of introduce another one.
