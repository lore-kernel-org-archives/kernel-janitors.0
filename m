From: Radhey Shyam Pandey <radheys@xilinx.com>
Date: Wed, 06 Nov 2019 16:59:38 +0000
Subject: RE: [PATCH net-next] net: axienet: Fix error return code in axienet_probe()
Message-Id: <CH2PR02MB700031904CC37C8D5EE3435EC7790@CH2PR02MB7000.namprd02.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106155449.107672-1-weiyongjun1@huawei.com>
In-Reply-To: <20191106155449.107672-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Michal Simek <michals@xilinx.com>, Russell King <linux@armlinux.org.uk>, Robert Hancock <hancock@sedsystems.ca>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

> -----Original Message-----
> From: Wei Yongjun <weiyongjun1@huawei.com>
> Sent: Wednesday, November 6, 2019 9:25 PM
> To: Radhey Shyam Pandey <radheys@xilinx.com>; Michal Simek
> <michals@xilinx.com>; Russell King <linux@armlinux.org.uk>; Robert Hancock
> <hancock@sedsystems.ca>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; netdev@vger.kernel.org; linux-
> arm-kernel@lists.infradead.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH net-next] net: axienet: Fix error return code in axienet_probe()
> 
> In the DMA memory resource get failed case, the error is not
> set and 0 will be returned. Fix it by reove redundant check
:s/reove/removing

> since devm_ioremap_resource() will handle it.
> 
> Fixes: 28ef9ebdb64c ("net: axienet: make use of axistream-connected attribute
> optional")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

The rest looks fine.
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 867726d696e2..8f32db6d2c45 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1788,10 +1788,6 @@ static int axienet_probe(struct platform_device
> *pdev)
>  		/* Check for these resources directly on the Ethernet node. */
>  		struct resource *res = platform_get_resource(pdev,
> 
> IORESOURCE_MEM, 1);
> -		if (!res) {
> -			dev_err(&pdev->dev, "unable to get DMA memory
> resource\n");
> -			goto free_netdev;
> -		}
>  		lp->dma_regs = devm_ioremap_resource(&pdev->dev, res);
>  		lp->rx_irq = platform_get_irq(pdev, 1);
>  		lp->tx_irq = platform_get_irq(pdev, 0);
> 
> 
