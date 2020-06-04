From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 04 Jun 2020 15:20:58 +0000
Subject: Re: [PATCH] coccinelle: api: add kzfree script
Message-Id: <96653281-3812-8b44-0dd8-6e7540a26a89@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Coccinelle <cocci@systeme.lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Check for memset() with 0 followed by kfree().

I suggest to simplify the SmPL code a bit like the following.


> +virtual context
> +virtual org
> +virtual report
> +virtual patch

+virtual context, org, report, patch


…
> +@@
> +
> +(
> +* memset(E, 0, ...);
> +|
> +* memset(E, '\0', ...);
> +)
> +* kfree(E)@p;

+@@
+*memset(E, 0, ...);
+*kfree(E)@p;


How does the SmPL asterisk functionality fit to the operation
modes “org” and “report”?


> +@@
> +
> +(
> +- memset(E, 0, ...);
> +|
> +- memset(E, '\0', ...);
> +)
> +- kfree(E);
> ++ kzfree(E);

+@@
+-memset(E, 0, ...);
+-kfree
++kzfree
+       (E);

I got the impression that the specification of a SmPL disjunction
could be omitted because of the technical detail that the isomorphism
“zero_multiple_format” should handle such an use case already.

Would you like to tolerate any extra source code between these function calls?

Regards,
Markus
