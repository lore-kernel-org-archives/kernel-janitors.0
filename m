From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 08 Jun 2020 17:20:38 +0000
Subject: Re: [PATCH v2 1/4] coccinelle: api: extend memdup_user transformation with GFP_USER
Message-Id: <c3464cad-e567-9ef5-b4e3-a01e3b11120b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>, linux-kernel@vger.kernel.org

> Match GFP_USER and optional __GFP_NOWARN allocations with
> memdup_user.cocci rule.

You suggest another interesting software extension.


…
> +++ b/scripts/coccinelle/api/memdup_user.cocci
> @@ -20,7 +20,9 @@ expression from,to,size;
>  identifier l1,l2;
> @@
>
> --  to = \(kmalloc\|kzalloc\)(size,GFP_KERNEL);
> +-  to = \(kmalloc\|kzalloc\)
> +		(size,\(GFP_KERNEL\|GFP_USER\|
> +		      \(GFP_KERNEL\|GFP_USER\)|__GFP_NOWARN\));
>  +  to = memdup_user(from,size);

But I find the proposed change for such SmPL code inappropriate.

It was specified by the means of the semantic patch language
to replace an assignment statement for which a function call provides a value.
I would interpret your adjustment in the way that an expression list
should be preserved.
Were two minus characters forgotten for the first SmPL rule?

Further concerns should be taken into account for the SmPL rule “r”.

I would appreciate if the clarification will be continued also for
the topic “Safer source code analysis by "memdup_user.cocci"”?
https://github.com/coccinelle/coccinelle/issues/78

Regards,
Markus
