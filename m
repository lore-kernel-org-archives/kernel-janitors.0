From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 06 Jun 2020 14:04:48 +0000
Subject: Re: [PATCH] coccinelle: api: add kvfree script
Message-Id: <119d91fd-1ad0-8842-10eb-ee8fa16da1b0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
In-Reply-To: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> +@choice@
> +expression E, E1;
> +position kok, vok;
> +@@
> +
> +(
> +  if (...) {
> +    ...
> +    E = \(kmalloc@kok\|…\)(...)

Further implementation details from this SmPL script caught my software
development attention.

* Is there a need to add the specification “when any” to the SmPL ellipses
  before such assignment statements?

* A limited search approach was expressed. Will additional source code variations
  become relevant?
  + switch statement
  + if branches with single statements
  + conditional operator


> +@opportunity depends on !patch …@
…
> +  E = \(kmalloc\|…\)(..., size, ...)
> +  ... when != E = E1
> +      when != size = E1

I wonder that two assignments should be excluded here according to
the same expression metavariable.


+@pkfree depends on patch exists@
…
+- \(kfree\|kvfree\)(E)
++ vfree(E)

Would you like to use a SmPL code variant like the following
at any more places?
(Is it occasionally helpful to increase the change precision?)

+-\(kfree\|kvfree\)
++vfree
+      (E)


Regards,
Markus
