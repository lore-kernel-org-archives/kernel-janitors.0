From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 30 Jul 2019 08:49:00 +0000
Subject: Re: [PATCH v5 3/3] coccinelle: Add script to check for platform_get_irq() excessive prints
Message-Id: <7debc03d-0bed-e0d7-a793-089fcc85c9ee@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190730053845.126834-1-swboyd@chromium.org>
 <20190730053845.126834-4-swboyd@chromium.org>
In-Reply-To: <20190730053845.126834-4-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Stephen Boyd <swboyd@chromium.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, kernel-janitors@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>, cocci@systeme.lip6.fr, Marek Szyprowski <m.szyprowski@samsung.com>

> I'm not sure this will be accepted or not

The patch review and corresponding clarification will become more interesting,
won't it?

I am missing more constructive feedback to remaining software development concerns.
https://lore.kernel.org/patchwork/comment/1301194/
https://lore.kernel.org/lkml/3baa3e3c-c122-e868-55a0-597e279496ac@web.de/
https://systeme.lip6.fr/pipermail/cocci/2019-July/006143.html
https://lkml.org/lkml/2019/7/24/886


> given that Markus indicates a similar patch was made for other error messages

I am also curious how the acceptance will evolve around such change possibilities.
Did you get any useful development ideas from this approach?


> that this may be able to be merged into.

I find it unlikely that a merge will be useful in this case because of specific
property differences in SmPL specifications.
But I imagine that improved SmPL script variants will be helpful.


>  create mode 100644 scripts/coccinelle/api/platform_get_irq.cocci

On which storage locations would we like to agree?


> +@depends on context@
> +expression ret;
> +struct platform_device *E;

How much does this specification matter for the parameters
of the mentioned functions (in the SmPL script)?
Will the selection of function names be sufficient for the discussed
source code search pattern?


> +@@
> +
> +ret =
> +(
> +platform_get_irq
> +|
> +platform_get_irq_byname
> +)(E, ...);

* Would you eventually like to extend the function name selection?

* Will the SmPL ellipsis be appropriate without the metavariable “E”?


> +if ( ret \( < \| <= \) 0 )
> +{
> +(
> +if (ret != -EPROBE_DEFER)
> +{ ...
> +*dev_err(...);
> +... }
> +|
> +...
> +*dev_err(...);
> +)
> +...
> +}

I suggest to reconsider SmPL implementation details once more.

* Case distinction for curly brackets of compound statements

* Application of the SmPL construct “<+... … ...+>”


> +@script:python depends on org@
> +p1 << r.p1;
> +@@
> +
> +cocci.print_main(p1)
> +
> +@script:python depends on report@
> +p1 << r.p1;
> +@@
> +
> +msg = "line %s is redundant because platform_get_irq() already prints an error" % (p1[0].line)
> +coccilib.report.print_report(p1[0],msg)

Will the message constructions be adjusted?

Regards,
Markus
