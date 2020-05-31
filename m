From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 31 May 2020 18:43:44 +0000
Subject: Re: [PATCH 2/2] Coccinelle: extend memdup_user rule with vmemdup_user()
Message-Id: <02c75f13-ec79-f4c0-f28a-8a354ea1f6f0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Efremov <efremov@linux.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Add vmemdup_user() transformations to the memdup_user.cocci rule.
> Commit 50fd2f298bef ("new primitive: vmemdup_user()") introduced
> vmemdup_user(). The function uses kvmalloc with GPF_USER flag.

Such a software evolution is also interesting.


> +@depends on patch@


> +-  to = \(kvmalloc\|kvzalloc\)(size,\(GFP_KERNEL\|GFP_USER\));
> ++  to = vmemdup_user(from,size);

How do you think about to achieve the desired data processing by the application
of a SmPL disjunction like the following?

 to (
-     \( kmalloc \| kzalloc \) (size, \( GFP_KERNEL \| GFP_USER \))
+     memdup_user(from, size)
|
-     \( kvmalloc \| kvzalloc \) (size, \( GFP_KERNEL \| GFP_USER \))
+     vmemdup_user(from, size)
)
 ;


Unfortunately, the Coccinelle software does not like the following
SmPL code variant so far.

 to (
-     \( kmalloc \| kzalloc \)
+     memdup_user
|
-     \( kvmalloc \| kvzalloc \)
+     vmemdup_user
)
                 (
-                 size, \( GFP_KERNEL \| GFP_USER \)
+                 from, size
                 );


Message:
25: no available token to attach to


Regards,
Markus
