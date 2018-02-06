From: Vadim Pasternak <vadimp@mellanox.com>
Date: Tue, 06 Feb 2018 12:55:58 +0000
Subject: RE: [PATCH] platform/x86: mlx-platform: Fix an ERR_PTR vs NULL issue
Message-Id: <AM4PR05MB3330D53BBA5BD43AF7EE6D7DA2FD0@AM4PR05MB3330.eurprd05.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206124536.GA9445@mwanda>
In-Reply-To: <20180206124536.GA9445@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, February 06, 2018 2:46 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: Darren Hart <dvhart@infradead.org>; Andy Shevchenko
> <andy@infradead.org>; platform-driver-x86@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH] platform/x86: mlx-platform: Fix an ERR_PTR vs NULL issue
> 
> devm_ioport_map() returns NULL on error but we accidentally check for error
> pointers instead.
> 
> Fixes: c6acad68eb2d ("platform/mellanox: mlxreg-hotplug: Modify to use a
> regmap interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Vadim Pasternak <vadimp@melanox.com>

> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-
> platform.c
> index dfecba4407ac..27de29961f5e 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -522,8 +522,8 @@ static int __init mlxplat_init(void)
> 
>  	mlxplat_mlxcpld_regmap_ctx.base = devm_ioport_map(&mlxplat_dev-
> >dev,
>  			       mlxplat_lpc_resources[1].start, 1);
> -	if (IS_ERR(mlxplat_mlxcpld_regmap_ctx.base)) {
> -		err = PTR_ERR(mlxplat_mlxcpld_regmap_ctx.base);
> +	if (!mlxplat_mlxcpld_regmap_ctx.base) {
> +		err = -ENOMEM;
>  		goto fail_platform_mux_register;
>  	}
> 
