From: Stephen Boyd <sboyd@kernel.org>
Date: Wed, 14 Oct 2020 00:44:40 +0000
Subject: Re: [PATCH 09/18] clk: mvebu: ap80x-cpu: use semicolons rather than commas to separate statements
Message-Id: <160263628032.310579.6410850336431173861@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr> <1601233948-11629-10-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-10-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Michael Turquette <mturquette@baylibre.com>
Cc: Valdis =?utf-8?q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Julia Lawall (2020-09-27 12:12:19)
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
