From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 15 Jun 2020 12:25:20 +0000
Subject: Re: [PATCH] coccinelle: misc: add array_size_dup script to detect missed overflow checks
Message-Id: <180ac25d-d4de-41c3-3159-835e10cfc809@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>

I suggest to avoid a typo in the previous patch subject.


…
> +virtual context
> +virtual report
> +virtual org

+virtual context, report, org

Is such a SmPL code variant more succinct?


…
> +@as_next@
> +expression subE1 <= as.E1;
> +expression as.E1;
…

I propose to reduce the repetition of this SmPL key word.


…
> +  ... when != \(E1\|E2\|subE1\|subE2\)=E3
> +      when != \(E1\|E2\|subE1\|subE2\)+=E3
…

Can it make sense to express a constraint for a metavariable of
the type “assignment operator”?


> +      when != \(&E1\|&E2\|&subE1\|&subE2\)

How do you think about to use the following code exclusion specification?

+      when != & \(E1 \| E2 \| subE1 \| subE2\)


…
> +msg = "WARNING: same struct_size (line %s)" % (p1[0].line)
> +coccilib.org.print_todo(p2[0], msg)

I suggest once more to pass the desired message object directly as a function argument
(without using an extra Python variable).

Regards,
Markus
