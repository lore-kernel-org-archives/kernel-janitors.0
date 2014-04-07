From: Gabriel Fernandez <gabriel.fernandez@st.com>
Date: Mon, 07 Apr 2014 13:06:04 +0000
Subject: Re: [patch] clk: st: NULL dereference on error in st_of_clkgen_vcc_setup()
Message-Id: <5342A2BC.2020907@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140407063036.GA11581@mwanda>
In-Reply-To: <20140407063036.GA11581@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mike Turquette <mturquette@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks Dan,
i m agree with patch.

Best Regards.

Gabriel

On 04/07/2014 08:30 AM, Dan Carpenter wrote:
> There are two allocations where, if they fail, then we end up
> dereferencing the NULL pointer in the error handling code.
>
> Fixes: 94885faf9dbc ('clk: st: Support for DIVMUX and PreDiv Clocks')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
> index a329906..10899bc 100644
> --- a/drivers/clk/st/clkgen-mux.c
> +++ b/drivers/clk/st/clkgen-mux.c
> @@ -714,14 +714,14 @@ void __init st_of_clkgen_vcc_setup(struct device_node *np)
>   
>   	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>   	if (!clk_data)
> -		goto err;
> +		goto err_free_parents;
>   
>   	clk_data->clk_num = VCC_MAX_CHANNELS;
>   	clk_data->clks = kzalloc(clk_data->clk_num * sizeof(struct clk *),
>   				 GFP_KERNEL);
>   
>   	if (!clk_data->clks)
> -		goto err;
> +		goto err_free_data;
>   
>   	for (i = 0; i < clk_data->clk_num; i++) {
>   		struct clk *clk;
> @@ -811,10 +811,11 @@ err:
>   		kfree(container_of(composite->mux_hw, struct clk_mux, hw));
>   	}
>   
> -	if (clk_data)
> -		kfree(clk_data->clks);
> +	kfree(clk_data->clks);
>   
> +err_free_data:
>   	kfree(clk_data);
> +err_free_parents:
>   	kfree(parents);
>   }
>   CLK_OF_DECLARE(clkgen_vcc, "st,clkgen-vcc", st_of_clkgen_vcc_setup);

