From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 07 Feb 2018 15:15:13 +0000
Subject: Re: [PATCH] coccinelle: reduce false positives
Message-Id: <CAK7LNATiaN-ELZXJH=nRgMATbbpPoT6+3sfRqhRpO7MoAkNwmg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1517478532-5444-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1517478532-5444-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

2018-02-01 18:48 GMT+09:00 Julia Lawall <Julia.Lawall@lip6.fr>:
> Some files use both a non-devm allocation and a devm_allocation.  Don't
> complain about a free when the same function contains a non-devm
> allocation.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  scripts/coccinelle/free/devm_free.cocci |   55 +++++++++++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/coccinelle/free/devm_free.cocci b/scripts/coccinelle/free/devm_free.cocci
> index c990d2c..b2a2cf8b 100644
> --- a/scripts/coccinelle/free/devm_free.cocci
> +++ b/scripts/coccinelle/free/devm_free.cocci
> @@ -56,9 +56,62 @@ expression x;
>   x = devm_ioport_map(...)
>  )
>
> +@safe depends on context || org || report exists@
> +expression x;
> +position p;
> +@@
> +
> +(
> + x = kmalloc(...)
> +|
> + x = kvasprintf(...)
> +|
> + x = kasprintf(...)
> +|
> + x = kzalloc(...)
> +|
> + x = kmalloc_array(...)
> +|
> + x = kcalloc(...)
> +|
> + x = kstrdup(...)
> +|
> + x = kmemdup(...)
> +|
> + x = get_free_pages(...)
> +|
> + x = request_irq(...)
> +|
> + x = ioremap(...)
> +|
> + x = ioremap_nocache(...)
> +|
> + x = ioport_map(...)
> +)
> +...
> +(
> + kfree@p(x)
> +|
> + kzfree@p(x)
> +|
> + __krealloc@p(x, ...)
> +|
> + krealloc@p(x, ...)
> +|
> + free_pages@p(x, ...)
> +|
> + free_page@p(x)
> +|
> + free_irq@p(x)
> +|
> + iounmap@p(x)
> +|
> + ioport_unmap@p(x)
> +)
> +
>  @pb@
>  expression r.x;
> -position p;
> +position p != safe.p;
>  @@
>
>  (
>

Anyway, it looks like
this patch makes the situation better.


Applied to linux-kbuild/kbuild.  Thanks!


-- 
Best Regards
Masahiro Yamada
