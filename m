From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 17 Oct 2019 14:34:33 +0000
Subject: Re: [PATCH] coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <alpine.DEB.2.21.1910171633150.5777@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191017142237.9734-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20191017142237.9734-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Himanshu Jha <himanshujha199640@gmail.com>, Linus Torvalds <torvalds@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, tglx@linutronix.de, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com



On Thu, 17 Oct 2019, Alexandre Belloni wrote:

> While it is useful for new drivers to use devm_platform_ioremap_resource,
> this script is currently used to spam maintainers, often updating very old
> drivers. The net benefit is the removal of 2 lines of code in the driver
> but the review load for the maintainers is huge. As of now, more that 560
> patches have been sent, some of them obviously broken, as in:
>
> https://lore.kernel.org/lkml/9bbcce19c777583815c92ce3c2ff2586@www.loen.fr/
>
> Remove the script to reduce the spam.

OK.

Acked-by: Julia Lawall <Julia.Lawall@lip6.fr>

>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../api/devm_platform_ioremap_resource.cocci  | 60 -------------------
>  1 file changed, 60 deletions(-)
>  delete mode 100644 scripts/coccinelle/api/devm_platform_ioremap_resource.cocci
>
> diff --git a/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci b/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci
> deleted file mode 100644
> index 56a2e261d61d..000000000000
> --- a/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/// Use devm_platform_ioremap_resource helper which wraps
> -/// platform_get_resource() and devm_ioremap_resource() together.
> -///
> -// Confidence: High
> -// Copyright: (C) 2019 Himanshu Jha GPLv2.
> -// Copyright: (C) 2019 Julia Lawall, Inria/LIP6. GPLv2.
> -// Keywords: platform_get_resource, devm_ioremap_resource,
> -// Keywords: devm_platform_ioremap_resource
> -
> -virtual patch
> -virtual report
> -
> -@r depends on patch && !report@
> -expression e1, e2, arg1, arg2, arg3;
> -identifier id;
> -@@
> -
> -(
> -- id = platform_get_resource(arg1, IORESOURCE_MEM, arg2);
> -|
> -- struct resource *id = platform_get_resource(arg1, IORESOURCE_MEM, arg2);
> -)
> -  ... when != id
> -- e1 = devm_ioremap_resource(arg3, id);
> -+ e1 = devm_platform_ioremap_resource(arg1, arg2);
> -  ... when != id
> -? id = e2
> -
> -@r1 depends on patch && !report@
> -identifier r.id;
> -type T;
> -@@
> -
> -- T *id;
> -  ...when != id
> -
> -@r2 depends on report && !patch@
> -identifier id;
> -expression e1, e2, arg1, arg2, arg3;
> -position j0;
> -@@
> -
> -(
> -  id = platform_get_resource(arg1, IORESOURCE_MEM, arg2);
> -|
> -  struct resource *id = platform_get_resource(arg1, IORESOURCE_MEM, arg2);
> -)
> -  ... when != id
> -  e1@j0 = devm_ioremap_resource(arg3, id);
> -  ... when != id
> -? id = e2
> -
> -@script:python depends on report && !patch@
> -e1 << r2.e1;
> -j0 << r2.j0;
> -@@
> -
> -msg = "WARNING: Use devm_platform_ioremap_resource for %s" % (e1)
> -coccilib.report.print_report(j0[0], msg)
> --
> 2.21.0
>
>
