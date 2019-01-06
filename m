From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 06 Jan 2019 01:41:18 +0000
Subject: Re: [PATCH] scripts: coccinelle: boolinit: drop warnings on named constants
Message-Id: <CAK7LNARH8-96wcZhMmgZCzxQCMQpQPaqmDHVSYbGkHnHhjQtCw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1546064056-15569-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1546064056-15569-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, cocci@systeme.lip6.fr

On Sat, Dec 29, 2018 at 10:14 PM Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>
> Coccinelle doesn't always have access to the values of named
> (#define) constants, and they may likely often be bound to true
> and false values anyway, resulting in false positives.  So stop
> warning about them.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to linux-kbuild. Thanks!


> ---
>  scripts/coccinelle/misc/boolinit.cocci |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/coccinelle/misc/boolinit.cocci b/scripts/coccinelle/misc/boolinit.cocci
> index b0584a3..aabb581 100644
> --- a/scripts/coccinelle/misc/boolinit.cocci
> +++ b/scripts/coccinelle/misc/boolinit.cocci
> @@ -136,9 +136,14 @@ position p1;
>  @r4 depends on !patch@
>  bool b;
>  position p2;
> +identifier i;
>  constant c != {0,1};
>  @@
> +(
> + b = i
> +|
>  *b@p2 = c
> +)
>
>  @script:python depends on org@
>  p << r1.p;
>


-- 
Best Regards
Masahiro Yamada
