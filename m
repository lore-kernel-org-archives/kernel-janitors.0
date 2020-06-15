From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 15 Jun 2020 13:26:43 +0000
Subject: Re: [PATCH v3] coccinelle: api: add kzfree script
Message-Id: <a316f076-1686-25d8-18fe-1bbc0cf9a701@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

…
> +virtual context
> +virtual patch
> +virtual org
> +virtual report

+virtual context, patch, org, report

Is such a SmPL code variant more succinct?


…
> +if (...)
> +  \(memset@ok\|memzero_explicit@ok\)(...);

Would you like to tolerate any extra source code around such a function call
in an if branch?


…
> +(
> +* memset@m((T)E, 0, ...);
> +|
> +* memzero_explicit@m((T)E, ...);
> +)
…

I suggest to move a semicolon.

+(
+*memset@m((T)E, 0, ...)
+|
+*memzero_explicit@m((T)E, ...)
+);


…
> +- \(kfree\|vfree\|kvfree\)(E);
> ++ kvfree_sensitive(E, size);
…

Would you like to increase the precision a bit for the change specification?

+-\(kfree\|vfree\|kvfree\)
++kvfree_sensitive
+ (E
++ , size
+ );


…
> +(
> +- kfree(E);
> ++ kzfree(E);
> +|
> +- \(vfree\|kvfree\)(E);
> ++ kvfree_sensitive(E, size);
> +)
…

+(
+-kfree
++kzfree
+      (E)
+|
+-\(vfree\|kvfree\)
++kvfree_sensitive
+ (E
++ , size
+ )
+);


…
> +coccilib.org.print_todo(p[0],
> +  "WARNING: opportunity for kzfree/kvfree_sensitive")

I suggest to align the second function parameter.

+coccilib.org.print_todo(p[0],
+                        "WARNING: opportunity for kzfree/kvfree_sensitive")


Regards,
Markus
