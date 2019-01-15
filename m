From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Jan 2019 13:42:29 +0000
Subject: Re: [PATCH] clk: ti: Fix error handling in ti_clk_parse_divider_data()
Message-Id: <20190115134229.GI4504@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154706313779.15366.12078258980663060364@swboyd.mtv.corp.google.com>
 <20190115070149.wpiyqw5vqqqsapxt@kili.mountain>
In-Reply-To: <20190115070149.wpiyqw5vqqqsapxt@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tero Kristo <t-kristo@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 15, 2019 at 10:01:49AM +0300, Dan Carpenter wrote:
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
> ---
>  drivers/clk/ti/divider.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
> index 8d77090ad94a..4c48ef424ad5 100644
> --- a/drivers/clk/ti/divider.c
> +++ b/drivers/clk/ti/divider.c
> @@ -403,8 +403,10 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
>  	num_dividers = i;
>  
>  	tmp = kcalloc(valid_div + 1, sizeof(*tmp), GFP_KERNEL);
> -	if (!tmp)
> +	if (!tmp) {
> +		*table = PTR_ERR(-ENOMEM);

Oh wow...  I don't know how I screwed that up.  :(

Let me resend.

regards,
dan carpenter
