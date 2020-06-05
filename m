From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jun 2020 06:43:16 +0000
Subject: Re: [PATCH v2] coccinelle: api: add kzfree script
Message-Id: <99e0349e-9392-b610-05b6-8f90986073fa@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Check for memset()/memset_explicit() with 0 followed by
> kfree()/vfree()/kvfree().

Another software evolution will become interesting here.


> +/// memset_explicit with 0 followed by kfree

How do you think about to extend this comment?


Would you like to take the following SmPL code variants into account?


> +virtual context
> +virtual org
> +virtual report
> +virtual patch

+virtual context, org, report, patch


> +(
> +- kfree(E);
> ++ kzfree(E);
> +|
> +- vfree(E);
> ++ kvfree_sensitive(E, size);
> +|
> +- kvfree(E);
> ++ kvfree_sensitive(E, size);
> +)

+(
+-kfree
++kzfree
+      (E);
+|
+-vfree
++kvfree_sensitive
+      (E
++      , size
+      );
+|
+-kvfree
++kvfree_sensitive
+       (E
++       , size
+       );
+)


Regards,
Markus
