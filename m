From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 08 Jun 2020 18:32:07 +0000
Subject: Re: [PATCH v2 2/4] coccinelle: api: extend memdup_user rule with vmemdup_user()
Message-Id: <6c9c6a4c-c305-ddab-8a1b-e4dc448d643f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

…
+++ b/scripts/coccinelle/api/memdup_user.cocci
@@ -39,6 +39,28 @@ …
…
> +@depends on patch@
> +expression from,to,size;
> +identifier l1,l2;
> +@@
> +
> +-  to = \(kvmalloc\|kvzalloc\)(size,\(GFP_KERNEL\|GFP_USER\));
> ++  to = vmemdup_user(from,size);

I suggest to combine the desired adjustment with the previous SmPL rule
by using another disjunction.


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

Regards,
Markus
