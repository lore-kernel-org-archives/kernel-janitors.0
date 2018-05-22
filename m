From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 22 May 2018 14:22:45 +0000
Subject: Re: [PATCH] coccinelle: mini_lock: improve performance
Message-Id: <CAK7LNATojz3pvx=KsJiJDvgykUSqrNUmoQsvn7d5SJQ-Wh7+Pg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1526885928-1712-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1526885928-1712-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

2018-05-21 15:58 GMT+09:00 Julia Lawall <Julia.Lawall@lip6.fr>:
> Replace <+... ...+> by ... when any.  <+... ...+> is slow, and in some
> obscure cases involving backward jumps it doesn't force the unlock to
> actually come after the end of the if.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---

Applied to linux-kbuild. Thanks!

>  scripts/coccinelle/locks/mini_lock.cocci |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/coccinelle/locks/mini_lock.cocci b/scripts/coccinelle/locks/mini_lock.cocci
> index 47f649b..19c6ee5 100644
> --- a/scripts/coccinelle/locks/mini_lock.cocci
> +++ b/scripts/coccinelle/locks/mini_lock.cocci
> @@ -67,12 +67,14 @@ identifier lock,unlock;
>  @@
>
>  *lock(E1@p,...);
> -<+... when != E1
> +... when != E1
> +    when any
>  if (...) {
>    ... when != E1
>  *  return@r ...;
>  }
> -...+>
> +... when != E1
> +    when any
>  *unlock@up(E1,...);
>
>  @script:python depends on org@
>



-- 
Best Regards
Masahiro Yamada
