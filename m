From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 09 Apr 2015 07:30:49 +0000
Subject: Re: [PATCH 1/2] clk: versatile: test returned value
Message-Id: <CACRpkdYU+hN6gEtVzwahGz+B07dqrDzQkTZz2xikGH0dMdYX1Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428159570-19467-1-git-send-email-Julia.Lawall@lip6.fr>
	<1428159570-19467-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428159570-19467-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Mike Turquette <mturquette@linaro.org>, kernel-janitors@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Apr 4, 2015 at 4:59 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Put NULL test on the result of the previous call instead on one of its
> arguments.  A simplified version of the semantic match that finds this
> problem is as follows (http://coccinelle.lip6.fr/):
>
> // <smpl>
> r@
> expression *e1;
> expression *e2;
> identifier f;
> statement S1,S2;
> @@
>
> e1 = f(...,e2,...);
> (
> if (e1 = NULL || ...) S1 else S2
> |
> *if (e2 = NULL || ...) S1 else S2
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Yep that's a bug:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
