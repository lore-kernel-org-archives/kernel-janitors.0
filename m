From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 30 Aug 2019 07:55:41 +0000
Subject: Re: [PATCH v2] scripts: coccinelle: check for !(un)?likely usage
Message-Id: <3c0f82d5-369a-1493-799e-b201a28aa671@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190825130536.14683-1-efremov@linux.com>
 <20190829171013.22956-1-efremov@linux.com>
In-Reply-To: <20190829171013.22956-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Efremov <efremov@linux.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Joe Perches <joe@perches.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-kernel@vger.kernel.org

> +/// Notations !unlikely(x) and !likely(x) are confusing.

I am curious if more software developers will share their views around
these likeliness annotations.

* How much does the scope matter for expressions?

* Are different coding style preferences involved?


> +//----------------------------------------------------------
> +//  For context mode
> +//----------------------------------------------------------
> +
> +@depends on context disable unlikely@

I wonder about the need for such a comment when the specification
of SmPL rule dependencies should be sufficient.


> +@depends on patch disable unlikely@
> +expression E;
> +@@
> +
> +(
> +-!likely(!E)
> ++unlikely(E)
> +|
> +-!likely(E)
> ++unlikely(!E)
> +|
> +-!unlikely(!E)
> ++likely(E)
> +|
> +-!unlikely(E)
> ++likely(!E)
> +)

Will another variant for the change specification with the semantic
patch language influence corresponding readability concerns?

+@replacement depends on patch disable unlikely@
+expression x;
+@@
+-!
+(
+(
+-unlikely
++likely
+|
+-likely
++unlikely
+)
+       (
+-       !
+        x
+       )
+|
+(
+-unlikely
++likely
+|
+-likely
++unlikely
+)
+       (
++       !
+        x
+       )
+)


Can the use of nested SmPL disjunctions help here together with
an other SmPL code formatting?

Regards,
Markus
