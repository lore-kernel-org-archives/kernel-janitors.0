From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 06 Sep 2019 06:59:02 +0000
Subject: Re: [PATCH -next] coccinelle: platform_get_irq: Fix parse error
Message-Id: <alpine.DEB.2.21.1909060857290.2975@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5d71eb6f.1c69fb81.31bc8.da2d@mx.google.com>
 <7818ad20-615c-2ce9-c0d1-3f7a09bedf34@web.de>
In-Reply-To: <7818ad20-615c-2ce9-c0d1-3f7a09bedf34@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Rob Herring <robh@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, YueHaibing <yuehaibing@huawei.com>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Javier Martinez Canillas <javierm@redhat.com>, cocci@systeme.lip6.fr, Russell King <linux@armlinux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>



On Fri, 6 Sep 2019, Markus Elfring wrote:

> > > minus: parse error:
> > >   File "./scripts/coccinelle/api/platform_get_irq.cocci", line 24, column 9, charpos = 355
> > >   around = '\(',
> > >   whole content = if ( ret \( < \| <= \) 0 )
> > >
> > > In commit e56476897448 ("fpga: Remove dev_err() usage
> > > after platform_get_irq()") log, I found the semantic patch,
> > > it fix this issue.
> > >
> > > Fixes: 98051ba2b28b ("coccinelle: Add script to check for platform_get_irq() excessive prints")
> > > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > > ---
> >
> > Hmm I had this earlier but someone asked me to change it.
>
> I proposed something also during the development for this SmPL script.
> https://lkml.org/lkml/2019/7/24/274
> https://lore.kernel.org/r/c98b8f50-1adf-ea95-a91c-ec451e9fefe2@web.de/

Markus,

This is not the first time you have suggested to someone to do something
that was simply incorrect.  Please actually test your suggestions before
proposing them.

> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> Should disjunctions eventually work in the semantic patch language also together with
> comparison operators?
> https://github.com/coccinelle/coccinelle/issues/40

No.

> Will any additional software adjustments be taken into account?

No.

julia
