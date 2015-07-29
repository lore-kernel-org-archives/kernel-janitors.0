From: Pawel Moll <pawel.moll@arm.com>
Date: Wed, 29 Jul 2015 14:09:13 +0000
Subject: Re: [patch] clk: versatile: off by one in clk_sp810_timerclken_of_get()
Message-Id: <1438178953.2339.47.camel@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150729101705.GB12100@mwanda>
In-Reply-To: <20150729101705.GB12100@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, 2015-07-29 at 11:17 +0100, Dan Carpenter wrote:
> The ">" should be ">=" or we end up reading beyond the end of the array.
> 
> Fixes: 6e973d2c4385 ('clk: vexpress: Add separate SP810 driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
> index 64b0129..7fbe4d4 100644
> --- a/drivers/clk/versatile/clk-sp810.c
> +++ b/drivers/clk/versatile/clk-sp810.c
> @@ -129,8 +129,8 @@ static struct clk *clk_sp810_timerclken_of_get(struct of_phandle_args *clkspec,
>  {
>  	struct clk_sp810 *sp810 = data;
>  
> -	if (WARN_ON(clkspec->args_count != 1 || clkspec->args[0] >
> -			ARRAY_SIZE(sp810->timerclken)))
> +	if (WARN_ON(clkspec->args_count != 1 ||
> +		    clkspec->args[0] >=	ARRAY_SIZE(sp810->timerclken)))
>  		return NULL;
>  
>  	return sp810->timerclken[clkspec->args[0]].clk;

Of course.

Acked-by: Pawel Moll <pawel.moll@arm.com>

Thanks!

Pawel

