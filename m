From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Date: Tue, 02 Jun 2020 23:25:40 +0000
Subject: Re: [PATCH] clk: baikal-t1: remove redundant assignment to variable 'divider'
Message-Id: <20200602232540.dn5p5wpduyrcgv75@mobilestation>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200602172435.70282-1-colin.king@canonical.com>
In-Reply-To: <20200602172435.70282-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 02, 2020 at 06:24:35PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable divider is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Right. Thanks.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/clk/baikal-t1/ccu-div.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/baikal-t1/ccu-div.c b/drivers/clk/baikal-t1/ccu-div.c
> index bd40f5936f08..4062092d67f9 100644
> --- a/drivers/clk/baikal-t1/ccu-div.c
> +++ b/drivers/clk/baikal-t1/ccu-div.c
> @@ -248,7 +248,7 @@ static int ccu_div_var_set_rate_fast(struct clk_hw *hw, unsigned long rate,
>  				     unsigned long parent_rate)
>  {
>  	struct ccu_div *div = to_ccu_div(hw);
> -	unsigned long flags, divider = 1;
> +	unsigned long flags, divider;
>  	u32 val;
>  
>  	divider = ccu_div_var_calc_divider(rate, parent_rate, div->mask);
> -- 
> 2.25.1
> 
