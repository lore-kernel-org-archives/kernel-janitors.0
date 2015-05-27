From: Dinh Nguyen <dinguyen@opensource.altera.com>
Date: Wed, 27 May 2015 13:21:56 +0000
Subject: Re: [patch] clk: socfpga: remove a stray tab
Message-Id: <5565C4F4.7090805@opensource.altera.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150527082627.GD19423@mwanda>
In-Reply-To: <20150527082627.GD19423@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org



On 5/27/15 3:26 AM, Dan Carpenter wrote:
> This line was indented too far.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/clk-gate-a10.c
> index be3e998..83c6780 100644
> --- a/drivers/clk/socfpga/clk-gate-a10.c
> +++ b/drivers/clk/socfpga/clk-gate-a10.c
> @@ -39,7 +39,7 @@ static unsigned long socfpga_gate_clk_recalc_rate(struct clk_hw *hwclk,
>  	else if (socfpgaclk->div_reg) {
>  		val = readl(socfpgaclk->div_reg) >> socfpgaclk->shift;
>  		val &= div_mask(socfpgaclk->width);
> -			div = (1 << val);
> +		div = (1 << val);
>  	}
>  
>  	return parent_rate / div;
> 

Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>
