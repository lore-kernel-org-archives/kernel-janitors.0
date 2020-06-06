From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 06 Jun 2020 07:30:36 +0000
Subject: Re: [PATCH] coccinelle: api: add kvfree script
Message-Id: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Check that alloc and free types of functions match each other.

Further software development challenges are interesting also for such an use case.


> +/// Check that kvmalloc'ed memory is freed by kfree functions,
> +/// vmalloc'ed by vfree functions and kvmalloc'ed by kvfree
> +/// functions.

* How do you think about to offer a wording suggestion for subjects of
  generated patches?

* Will the presented case distinction trigger further improvements for
  the desired matching?

* Would you like to generalise the safe handling of allocations
  and corresponding release of system resources?


> +// Confidence: High

I suggest to reconsider this information once more.


> +virtual patch
> +virtual report
> +virtual org
> +virtual context

+virtual patch, report, org, context

Is such a SmPL code variant more succinct?


> +@choice@

* Can it be that this SmPL rule is not relevant for all operation modes?

* Will additional dependencies matter?


> +    E = \(kmalloc@kok\|kzalloc@kok\|krealloc@kok\|kcalloc@kok\|kmalloc_node@kok\|kzalloc_node@kok\|kmalloc_array@kok\|kmalloc_array_node@kok\|kcalloc_node@kok\)(...)

I would prefer an other coding style here.

* Items for such SmPL disjunctions can be specified also on multiple lines.

* The semantic patch language supports further means to handle function name lists
  in more convenient ways.
  Would you like to work with customised constraints?


> +msg = "WARNING: kmalloc is used to allocate this memory at line %s" % (k[0].line)
> +coccilib.report.print_report(p[0], msg)

* I propose once more omit the extra variable “msg” at similar places.
  The desired message object can be directly passed as a function parameter.

* I find the diagnostic text insufficient.

* Can the corresponding function category be dynamically determined?


Are you looking for opportunities to avoid unwanted code duplication?

Regards,
Markus
