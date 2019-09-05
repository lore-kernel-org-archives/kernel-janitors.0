From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 05 Sep 2019 12:32:54 +0000
Subject: Re: [RFC PATCH] coccinelle: check for integer overflow in binary search
Message-Id: <8f454c56-735c-0620-ead4-b59e328b0283@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904221223.5281-1-efremov@linux.com>
In-Reply-To: <20190904221223.5281-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org

> +identifier l, h, m;

Can expressions make sense for these metavariables?


> +@@
> +(
> + while (\(l < h\|l <= h\|(h - l) > 1\|(l + 1) < h\|l < (h - 1)\)) {
> +  ...
> +(
> +  ((l + h)@p / c)
> +|
> +  ((l + h)@p >> c)
> +)
> +  ...
> + }

* I suggest again to look at further possibilities to reduce undesirable
  code duplication also together with the usage of SmPL disjunctions.

* The condition specification might be easier to read with a few
  additional spaces (or the following variant).

* The SmPL ellipses will probably need further considerations.


+@@
+(
+ while (
+(       l \( < \| <= \) h
+|       (h - l) > 1
+|       (h - 1) > l
+|       (l + 1) < h
+)      )
+ {
+ <+...
+ ((l + h)@p \( / \| >> \) c)
+ ...+>
+ }


> +@script:python depends on report@
> +p << r.p;
> +@@
> +
> +msg="WARNING: custom implementation of bsearch is error-prone. "
> +msg+="Consider using lib/bsearch.c or fix the midpoint calculation "
> +msg+="as 'm = l + (h - l) / 2;' to prevent the arithmetic overflow."
> +coccilib.report.print_report(p[0], msg)

The Linux coding style supports to put a long string literal also into a single line.
Thus I find such a message construction nicer without the extra variable “msg”.

Regards,
Markus
