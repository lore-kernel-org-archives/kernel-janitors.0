From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Date: Wed, 03 Jun 2020 09:19:34 +0000
Subject: Re: [PATCH][next] clk: baikal-t1: fix spelling mistake "Uncompatible" -> "Incompatible"
Message-Id: <20200603091934.vt5skqdzy6gnc5rk@mobilestation>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200602121030.39132-1-colin.king@canonical.com>
In-Reply-To: <20200602121030.39132-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jun 02, 2020 at 01:10:30PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a pr_err error message. Fix it.

Thanks!

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/clk/baikal-t1/clk-ccu-div.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/baikal-t1/clk-ccu-div.c b/drivers/clk/baikal-t1/clk-ccu-div.c
> index b479156e5e9b..f141fda12b09 100644
> --- a/drivers/clk/baikal-t1/clk-ccu-div.c
> +++ b/drivers/clk/baikal-t1/clk-ccu-div.c
> @@ -316,7 +316,7 @@ static struct ccu_div_data *ccu_div_create_data(struct device_node *np)
>  		data->rst_num = ARRAY_SIZE(sys_rst_map);
>  		data->rst_map = sys_rst_map;
>  	} else {
> -		pr_err("Uncompatible DT node '%s' specified\n",
> +		pr_err("Incompatible DT node '%s' specified\n",
>  			of_node_full_name(np));
>  		ret = -EINVAL;
>  		goto err_kfree_data;
> -- 
> 2.25.1
> 
