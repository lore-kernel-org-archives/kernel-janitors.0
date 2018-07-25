From: Stefan Agner <stefan@agner.ch>
Date: Wed, 25 Jul 2018 09:19:12 +0000
Subject: Re: [PATCH] pinctrl: imx: off by one in imx_pinconf_group_dbg_show()
Message-Id: <f5173c5038c9644f68bd34a88192515c@agner.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180719081648.o6ug4z3t42mrsmop@mwanda>
In-Reply-To: <20180719081648.o6ug4z3t42mrsmop@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 19.07.2018 10:16, Dan Carpenter wrote:
> The > should really be >= here.  It's harmless because
> pinctrl_generic_get_group() will return a NULL if group is invalid.
> 
> Fixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core driver")
> Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
> b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 1c6bb15579e1..b04edc22dad7 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -383,7 +383,7 @@ static void imx_pinconf_group_dbg_show(struct
> pinctrl_dev *pctldev,
>  	const char *name;
>  	int i, ret;
>  
> -	if (group > pctldev->num_groups)
> +	if (group >= pctldev->num_groups)
>  		return;
>  
>  	seq_puts(s, "\n");
