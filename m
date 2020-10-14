From: Stephen Boyd <sboyd@kernel.org>
Date: Wed, 14 Oct 2020 00:44:34 +0000
Subject: Re: [PATCH 01/18] clk: uniphier: use semicolons rather than commas to separate statements
Message-Id: <160263627485.310579.15618699028327766120@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <1601233948-11629-2-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-2-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Michael Turquette <mturquette@baylibre.com>
Cc: Valdis =?utf-8?q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Quoting Julia Lawall (2020-09-27 12:12:11)
> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---

Applied to clk-next
