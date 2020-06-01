From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jun 2020 06:24:39 +0000
Subject: Re: [PATCH 2/2] Coccinelle: extend memdup_user rule with vmemdup_user()
Message-Id: <273990e2-f289-905f-2930-725540857c67@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> +@rv depends on !patch@
> +expression from,to,size;
> +position p;
> +statement S1,S2;
> +@@
> +
> +*  to = \(kvmalloc@p\|kvzalloc@p\)(size,\(GFP_KERNEL\|GFP_USER\));
> +   if (to==NULL || ...) S1
> +   if (copy_from_user(to, from, size) != 0)
> +   S2

How does the SmPL asterisk functionality fit to the operation
modes “org” and “report”?


> +@script:python depends on org && r@

I find the modification of SmPL rule dependencies also interesting.
Are these specifications really required?

Regards,
Markus
