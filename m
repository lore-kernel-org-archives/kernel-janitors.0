From: Radhey Shyam Pandey <radheys@xilinx.com>
Date: Wed, 25 Sep 2019 12:01:54 +0000
Subject: RE: [PATCH net] net: axienet: fix a signedness bug in probe
Message-Id: <CH2PR02MB700081E7F84C502F36E6FBEFC7870@CH2PR02MB7000.namprd02.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105911.GI3264@mwanda>
In-Reply-To: <20190925105911.GI3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Alvaro G. M" <alvaro.gamez@hazent.com>
Cc: "David S. Miller" <davem@davemloft.net>, Michal Simek <michals@xilinx.com>, Russell King <linux@armlinux.org.uk>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Wednesday, September 25, 2019 4:29 PM
> To: Radhey Shyam Pandey <radheys@xilinx.com>; Alvaro G. M
> <alvaro.gamez@hazent.com>
> Cc: David S. Miller <davem@davemloft.net>; Michal Simek
> <michals@xilinx.com>; Russell King <linux@armlinux.org.uk>;
> netdev@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH net] net: axienet: fix a signedness bug in probe
> 
> The "lp->phy_mode" is an enum but in this context GCC treats it as an
> unsigned int so the error handling is never triggered.
> 
> Fixes: ee06b1728b95 ("net: axienet: add support for standard phy-mode
> binding")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 4fc627fb4d11..676006f32f91 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1762,7 +1762,7 @@ static int axienet_probe(struct platform_device
> *pdev)
>  		}
>  	} else {
>  		lp->phy_mode = of_get_phy_mode(pdev->dev.of_node);
> -		if (lp->phy_mode < 0) {
> +		if ((int)lp->phy_mode < 0) {
>  			ret = -EINVAL;
>  			goto free_netdev;
>  		}
> --
> 2.20.1
