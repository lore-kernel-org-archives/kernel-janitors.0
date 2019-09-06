From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 06 Sep 2019 06:52:44 +0000
Subject: Re: [PATCH -next] coccinelle: platform_get_irq: Fix parse error
Message-Id: <7818ad20-615c-2ce9-c0d1-3f7a09bedf34@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5d71eb6f.1c69fb81.31bc8.da2d@mx.google.com>
In-Reply-To: <5d71eb6f.1c69fb81.31bc8.da2d@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <swboyd@chromium.org>, YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr
Cc: Rob Herring <robh@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

> > minus: parse error:
> >   File "./scripts/coccinelle/api/platform_get_irq.cocci", line 24, column 9, charpos = 355
> >   around = '\(',
> >   whole content = if ( ret \( < \| <= \) 0 )
> >
> > In commit e56476897448 ("fpga: Remove dev_err() usage
> > after platform_get_irq()") log, I found the semantic patch,
> > it fix this issue.
> >
> > Fixes: 98051ba2b28b ("coccinelle: Add script to check for platform_get_irq() excessive prints")
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
>
> Hmm I had this earlier but someone asked me to change it.

I proposed something also during the development for this SmPL script.
https://lkml.org/lkml/2019/7/24/274
https://lore.kernel.org/r/c98b8f50-1adf-ea95-a91c-ec451e9fefe2@web.de/


> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Should disjunctions eventually work in the semantic patch language also together with
comparison operators?
https://github.com/coccinelle/coccinelle/issues/40


Will any additional software adjustments be taken into account?

Regards,
Markus
