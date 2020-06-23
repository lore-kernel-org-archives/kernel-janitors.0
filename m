From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 23 Jun 2020 06:12:39 +0000
Subject: Re: [PATCH v4] coccinelle: misc: add array_size_dup script to detect missed overflow checks
Message-Id: <4014118b-90a6-68c5-048f-32485fa3e852@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@inria.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Kees Cook <keescook@chromium.org>

> Changes in v2:
…
> - assignment operator used

I prefer the distinction for the application of corresponding metavariables.


> Changes in v3:
…
>  - \(&E1\|&E2\) changed to &\(E1\|E2\)

Would it be more helpful to mention the movement of the ampersand
before SmPL disjunctions?


…
>+/// Three types of patterns for these functions:

Will another adjustment be needed according to your information “duplicates warning removed”?


…
> +virtual context
> +virtual report
> +virtual org

Can the following SmPL code variant ever become more attractive?

+virtual context, report, org


…
> +expression subE1 <= as.E1;
> +expression subE2 <= as.E2;
> +expression as.E1, as.E2, E3;

How do you think about the following SmPL code variant?

+expression subE1 <= as.E1,
+           subE2 <= as.E2,
+           as.E1, as.E2, E3;


…
> +msg = "WARNING: array_size is used later (line %s) to compute the same size" % (p2[0].line)
> +coccilib.report.print_report(p1[0], msg)

Please omit the extra Python variable “msg” for the passing of such simple message objects.

What does hinder you to take the proposed script variants better into account?

Regards,
Markus
