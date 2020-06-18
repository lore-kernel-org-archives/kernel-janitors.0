From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 18 Jun 2020 11:34:52 +0000
Subject: Re: [PATCH v2] coccinelle: misc: add array_size_dup script to detect missed overflow checks
Message-Id: <54ac89f1-5f38-8909-a652-c658a5a1f36b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Kees Cook <keescook@chromium.org>

Why did you repeat a typo from the previous patch subject?


> Changes in v2:
…
> - assignment operator used

Did you add just a metavariable for this implementation detail?


…
> +expression subE1 <= as.E1;
> +expression subE2 <= as.E2;
> +expression as.E1, as.E2, E3;

How do you think about to use the following SmPL code variant?

expression subE1 <= as.E1, subE2 <= as.E2, as.E1, as.E2, E3;


> +      when != \(&E1\|&E2\|&subE1\|&subE2\)

I suggest to move the ampersand before the disjunction in such
SmPL code exclusion specifications.

+      when != & \(E1 \| E2 \| subE1 \| subE2\)


> +coccilib.report.print_report(p2[0],
> +f"WARNING: array_size is already used (line {p1[0].line}) to compute \
> +the same size")

I would prefer an other code formatting at such places.

+coccilib.report.print_report(p2[0],
+                             f"WARNING: array_size is already used (line {p1[0].line}) to compute the same size.")


Regards,
Markus
