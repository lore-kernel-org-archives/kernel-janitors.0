From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 19 Jun 2020 15:03:18 +0000
Subject: Re: [PATCH v3] coccinelle: misc: add array_size_dup script to detect missed overflow checks
Message-Id: <cf6ab028-4297-dfab-35a7-cb6589fe61ac@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Kees Cook <keescook@chromium.org>

> Changes in v2:
…
> - assignment operator used

I would prefer the distinction for the application of corresponding metavariables.


> Changes in v3:
…
>  - \(&E1\|&E2\) changed to &\(E1\|E2\)

Would it be more helpful to mention the movement of the ampersand
before SmPL disjunctions?


…
> +virtual context
> +virtual report
> +virtual org

Can the following SmPL code variant become more attractive?

+virtual context, report, org


…
> +expression subE1 <= as.E1;
> +expression subE2 <= as.E2;
> +expression as.E1, as.E2, E3;

How do you think about the following SmPL code variant?

+expression subE1 <= as.E1,
+           subE2 <= as.E2,
+           as.E1,
+           as.E2,
+           E3;


…
> +coccilib.report.print_report(p2[0],
> +f"WARNING: same struct_size (line {p1[0].line})")

Please align such function parameters.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=5e857ce6eae7ca21b2055cca4885545e29228fe2#n93

+coccilib.report.print_report(p2[0],
+                             f"WARNING: same struct_size (line {p1[0].line})")


Regards,
Markus
