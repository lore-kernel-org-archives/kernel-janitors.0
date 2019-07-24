From: Stephen Boyd <swboyd@chromium.org>
Date: Wed, 24 Jul 2019 18:21:54 +0000
Subject: Re: [PATCH v4 3/3] coccinelle: Add script to check for platform_get_irq() excessive prints
Message-Id: <5d38a1c3.1c69fb81.2b26a.b585@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190723181624.203864-4-swboyd@chromium.org>
 <c98b8f50-1adf-ea95-a91c-ec451e9fefe2@web.de>
In-Reply-To: <c98b8f50-1adf-ea95-a91c-ec451e9fefe2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

Quoting Markus Elfring (2019-07-24 02:30:16)
> I would prefer to concentrate the usage of SmPL disjunctions on changing
> implementation details so that the specification of duplicate code
> can be avoided.
> 
> 
> > +(
> > +platform_get_irq(E, ...)
> > +|
> > +platform_get_irq_byname(E, ...)
> > +);
> 
> Function names:
> 
> +(platform_get_irq
> +|platform_get_irq_byname
> +)(E, ...);
> 
> 
> > +if ( \( ret < 0 \| ret <= 0 \) )
> 
> Comparison operators:
> 
> +if (ret \( < \| <= \) 0)
> 

Thanks. Will fold the above two in.

> 
> > +if (ret != -EPROBE_DEFER)
> 
> Is it appropriate to treat this error code check as optional
> by the shown transformation approach?
> Can this case distinction be omitted?

I don't know what you mean here. Do you want me to drop this part so
that EPROBE_DEFER checks don't get removed?
