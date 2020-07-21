From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 21 Jul 2020 09:30:08 +0000
Subject: Re: [PATCH v3 2/3] coccinelle: api: extend memdup_user rule with vmemdup_user()
Message-Id: <e3d2ffb9-2a47-3d77-0501-9d48845435bd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@inria.fr>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

…
> +++ b/scripts/coccinelle/api/memdup_user.cocci
> @@ -39,6 +39,28 @@ …
…
> +@depends on patch@
> +expression from,to,size;
> +identifier l1,l2;
> +@@
> +
> +-  to = \(kvmalloc\|kvzalloc\)(size,\(GFP_KERNEL\|GFP_USER\));
> ++  to = vmemdup_user(from,size);

I propose to combine the desired adjustment with the previous SmPL rule
by using another disjunction.


> +@rv depends on !patch@
> +expression from,to,size;
> +position p;
> +statement S1,S2;
> +@@
> +
> +*  to = \(kvmalloc@p\|kvzalloc@p\)(size,\(GFP_KERNEL\|GFP_USER\));
> +   if (to==NULL || ...) S1
> +   if (copy_from_user(to, from, size) != 0)
> +   S2

* Can it be helpful to omit the SmPL asterisk functionality from
  the operation modes “org” and “report”?

* Should the operation mode “context” work without an extra position metavariable?

Regards,
Markus
