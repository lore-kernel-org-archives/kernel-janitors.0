From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 11 Feb 2021 11:30:21 +0000
Subject: Re: [PATCH][next][V2] soc: xilinx: vcu: fix error check on clk_hw_get_parent call
Message-Id: <20210211113021.GE30300@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210211095700.158960-1-colin.king@canonical.com>
In-Reply-To: <20210211095700.158960-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, 11 Feb 2021 09:57:00 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for failur on the call to clk_hw_get_parent
> is checking for a null return in the divider pointer instead of
> checking the mux pointer. Fix this.
> 
> Thanks to Michael Tretter for suggesting the correct fix.

Thanks!

> 
> Addresses-Coverity: ("Logically Dead Code")
> Fixes: 9c789deea206 ("soc: xilinx: vcu: implement clock provider for output clocks")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: Check on mux pointer rather than removing deadcode that wasn't
>     actually really dead code.
> 
> ---
>  drivers/clk/xilinx/xlnx_vcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
> index d66b1315114e..256b8c4b9ee4 100644
> --- a/drivers/clk/xilinx/xlnx_vcu.c
> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> @@ -512,7 +512,7 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
>  
>  	mux = clk_hw_get_parent(divider);
>  	clk_hw_unregister_mux(mux);

The mux should be unregistered after the check

> -	if (!divider)
> +	if (!mux)
>  		return;
>  
>  	clk_hw_unregister_divider(divider);

and the divider before the check.

Michael
