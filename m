From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 02 Aug 2017 08:23:00 +0000
Subject: Re: [PATCH 08/11] ata: Drop unnecessary static
Message-Id: <CACRpkdanCp5nWL4cQQ0m-3myfVtzveJTP7f160v207ATGXTL=g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr> <1500149266-32357-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1500149266-32357-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Kees Cook <keescook@chromium.org>, kernel-janitors@vger.kernel.org, Tejun Heo <tj@kernel.org>, linux-ide@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Jul 15, 2017 at 10:07 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Drop static on a local variable, when the variable is initialized before
> any possible use.  Thus, the static has no benefit.
>
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @bad exists@
> position p;
> identifier x;
> type T;
> @@
> static T x@p;
> ...
> x = <+...x...+>
>
> @@
> identifier x;
> expression e;
> type T;
> position p != bad.p;
> @@
> -static
>  T x@p;
>  ... when != x
>      when strict
> ?x = e;
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
