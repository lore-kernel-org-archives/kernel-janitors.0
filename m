From: Tero Kristo <t-kristo@ti.com>
Date: Tue, 15 Jan 2019 08:36:51 +0000
Subject: Re: [PATCH] clk: ti: Fix error handling in ti_clk_parse_divider_data()
Message-Id: <c4a5e9bb-36b9-800c-f9df-5d261f9fd301@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190115070149.wpiyqw5vqqqsapxt@kili.mountain>
In-Reply-To: <20190115070149.wpiyqw5vqqqsapxt@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

On 15/01/2019 09:01, Dan Carpenter wrote:
> The ti_clk_parse_divider_data() function is only called from
> _get_div_table_from_setup().  That function doesn't look at the return
> value but instead looks at the "*table" pointer.  In this case, if the
> kcalloc() fails then *table is NULL (which means success).  It should
> instead be an error pointer.
> 
> The ti_clk_parse_divider_data() function has two callers.  One checks
> for errors and the other doesn't.  I have fixed it so now both handle
> errors.
> 
> Fixes: 4f6be5655dc9 ("clk: ti: divider: add driver internal API for parsing divider data")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks fine to me:

Acked-by: Tero Kristo <t-kristo@ti.com>

> ---
>   drivers/clk/ti/divider.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
> index 8d77090ad94a..4c48ef424ad5 100644
> --- a/drivers/clk/ti/divider.c
> +++ b/drivers/clk/ti/divider.c
> @@ -403,8 +403,10 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
>   	num_dividers = i;
>   
>   	tmp = kcalloc(valid_div + 1, sizeof(*tmp), GFP_KERNEL);
> -	if (!tmp)
> +	if (!tmp) {
> +		*table = PTR_ERR(-ENOMEM);
>   		return -ENOMEM;
> +	}
>   
>   	valid_div = 0;
>   	*width = 0;
> @@ -439,6 +441,7 @@ struct clk_hw *ti_clk_build_component_div(struct ti_clk_divider *setup)
>   {
>   	struct clk_omap_divider *div;
>   	struct clk_omap_reg *reg;
> +	int ret;
>   
>   	if (!setup)
>   		return NULL;
> @@ -458,6 +461,12 @@ struct clk_hw *ti_clk_build_component_div(struct ti_clk_divider *setup)
>   		div->flags |= CLK_DIVIDER_POWER_OF_TWO;
>   
>   	div->table = _get_div_table_from_setup(setup, &div->width);
> +	if (IS_ERR(div->table)) {
> +		ret = PTR_ERR(div->table);
> +		kfree(div);
> +		return ret;
> +	}
> +
>   
>   	div->shift = setup->bit_shift;
>   	div->latch = -EINVAL;
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
