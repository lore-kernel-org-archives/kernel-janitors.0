From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 24 Jul 2019 09:30:16 +0000
Subject: Re: [PATCH v4 3/3] coccinelle: Add script to check for platform_get_irq() excessive prints
Message-Id: <c98b8f50-1adf-ea95-a91c-ec451e9fefe2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190723181624.203864-4-swboyd@chromium.org>
In-Reply-To: <20190723181624.203864-4-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <swboyd@chromium.org>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

I would prefer to concentrate the usage of SmPL disjunctions on changing
implementation details so that the specification of duplicate code
can be avoided.


> +(
> +platform_get_irq(E, ...)
> +|
> +platform_get_irq_byname(E, ...)
> +);

Function names:

+(platform_get_irq
+|platform_get_irq_byname
+)(E, ...);


> +if ( \( ret < 0 \| ret <= 0 \) )

Comparison operators:

+if (ret \( < \| <= \) 0)


> +if (ret != -EPROBE_DEFER)

Is it appropriate to treat this error code check as optional
by the shown transformation approach?
Can this case distinction be omitted?

Regards,
Markus
