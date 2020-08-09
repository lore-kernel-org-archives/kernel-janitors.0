From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 09 Aug 2020 11:25:34 +0000
Subject: Re: [PATCH] Coccinelle: Reduce duplicate code for patch rules of memdup_user.cocci
Message-Id: <alpine.DEB.2.22.394.2008091324530.2450@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1ae3eefe-fa5a-a497-f00b-5638f4191e90@web.de>
 <b5c83a17-e04f-2d10-9506-12c50b3de9b9@web.de>
In-Reply-To: <b5c83a17-e04f-2d10-9506-12c50b3de9b9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>



On Sun, 9 Aug 2020, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 9 Aug 2020 11:11:20 +0200
>
> Another patch rule was added. A bit of code was copied from a previous
> SmPL rule for this change specification.
>
> * Thus reduce duplicate code by using another SmPL disjunction.

I don't care about this issue.

>
> * Increase the precision a bit for desired source code adjustments.

This gives no information.  If you explain the improvement in an
understandable way, I will consider whether it is useful to take the
patch.

julia

> Fixes: 9c568dbd677bcfc975220d3157c89c48669a23e3 ("coccinelle: api: extend memdup_user rule with vmemdup_user()")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  scripts/coccinelle/api/memdup_user.cocci | 44 +++++++++---------------
>  1 file changed, 16 insertions(+), 28 deletions(-)
>
> diff --git a/scripts/coccinelle/api/memdup_user.cocci b/scripts/coccinelle/api/memdup_user.cocci
> index e01e95108405..7cf698b4e925 100644
> --- a/scripts/coccinelle/api/memdup_user.cocci
> +++ b/scripts/coccinelle/api/memdup_user.cocci
> @@ -27,34 +27,22 @@ expression from,to,size;
>  identifier l1,l2;
>  position p : script:python() { relevant(p) };
>  @@
> -
> --  to = \(kmalloc@p\|kzalloc@p\)
> --		(size,\(GFP_KERNEL\|GFP_USER\|
> --		      \(GFP_KERNEL\|GFP_USER\)|__GFP_NOWARN\));
> -+  to = memdup_user(from,size);
> -   if (
> --      to=NULL
> -+      IS_ERR(to)
> -                 || ...) {
> -   <+... when != goto l1;
> --  -ENOMEM
> -+  PTR_ERR(to)
> -   ...+>
> -   }
> --  if (copy_from_user(to, from, size) != 0) {
> --    <+... when != goto l2;
> --    -EFAULT
> --    ...+>
> --  }
> -
> -@depends on patch@
> -expression from,to,size;
> -identifier l1,l2;
> -position p : script:python() { relevant(p) };
> -@@
> -
> --  to = \(kvmalloc@p\|kvzalloc@p\)(size,\(GFP_KERNEL\|GFP_USER\));
> -+  to = vmemdup_user(from,size);
> + to > +(
> +-     \(kmalloc@p\|kzalloc@p\)
> ++     memdup_user
> +      (
> +-      size, \( \(GFP_KERNEL\|GFP_USER\) \| \(GFP_KERNEL\|GFP_USER\)|__GFP_NOWARN \)
> ++      from, size
> +      )
> +|
> +-     \(kvmalloc@p\|kvzalloc@p\)
> ++     vmemdup_user
> +      (
> +-      size, \(GFP_KERNEL\|GFP_USER\)
> ++      from, size
> +      )
> +);
>     if (
>  -      to=NULL
>  +      IS_ERR(to)
> --
> 2.28.0
>
>
