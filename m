From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 06 Jan 2019 01:41:06 +0000
Subject: Re: [PATCH] scripts/coccinelle: check for redeclaration
Message-Id: <CAK7LNATBxp8osBd7np5p7m699CaUVHD--r_-5-dCQvdJpQBpzg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1546008541-3175-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1546008541-3175-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, "Jason A . Donenfeld" <zx2c4@kernel.org>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cocci@systeme.lip6.fr

On Sat, Dec 29, 2018 at 10:32 AM Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>
> Avoid reporting on the use of an iterator index variable when
> the variable is redeclared.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---


Applied to linux-kbuild. Thanks!


>  scripts/coccinelle/iterators/use_after_iter.cocci |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/coccinelle/iterators/use_after_iter.cocci b/scripts/coccinelle/iterators/use_after_iter.cocci
> index ce8cc9c..66a1140 100644
> --- a/scripts/coccinelle/iterators/use_after_iter.cocci
> +++ b/scripts/coccinelle/iterators/use_after_iter.cocci
> @@ -35,6 +35,7 @@ iterator name hlist_for_each_entry_from;
>  iterator name hlist_for_each_entry_safe;
>  statement S;
>  position p1,p2;
> +type T;
>  @@
>
>  (
> @@ -125,6 +126,8 @@ sizeof(<+...c...+>)
>  |
>   &c->member
>  |
> +T c;
> +|
>  c = E
>  |
>  *c@p2
>


-- 
Best Regards
Masahiro Yamada
