From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 17 Jul 2020 16:05:13 +0000
Subject: Re: [PATCH v4] coccinelle: api: add kzfree script
Message-Id: <dedf7ce9-b0db-735e-f73b-83d0c292eb5d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@inria.fr>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

I dare to repeat previous patch review aspects once more.
https://lore.kernel.org/cocci/a316f076-1686-25d8-18fe-1bbc0cf9a701@web.de/

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
> +// TODO: uncomment when kfree_sensitive will be merged.
> +// Only this case is commented out because developers
> +// may not like patches like this since kzfree uses memset
> +// internally (not memzero_explicit).

Will this information trigger any further clarification?


…
> +coccilib.org.print_todo(p[0],
> +  "WARNING: opportunity for kzfree/kvfree_sensitive")

I propose to align the second function parameter.

+coccilib.org.print_todo(p[0],
+                        "WARNING: opportunity for kzfree/kvfree_sensitive")


Regards,
Markus
