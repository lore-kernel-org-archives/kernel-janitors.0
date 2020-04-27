From: Esben Haabendal <esben@geanix.com>
Date: Mon, 27 Apr 2020 09:46:10 +0000
Subject: Re: [PATCH net-next] net: ll_temac: Fix return value check in temac_probe()
Message-Id: <87sggpp8gt.fsf@geanix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427094052.181554-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427094052.181554-1-weiyongjun1@huawei.com> (Wei Yongjun's
 message of "Mon, 27 Apr 2020 09:40:52 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: andrew@lunn.ch, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, michal.simek@xilinx.com, ynezz@true.cz, linux-arm-kernel@lists.infradead.org

Acked-by: Esben Haabendal <esben@geanix.com>

Wei Yongjun <weiyongjun1@huawei.com> writes:

> In case of error, the function devm_ioremap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should
> be replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/ethernet/xilinx/ll_temac_main.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
> index 3e313e71ae36..929244064abd 100644
> --- a/drivers/net/ethernet/xilinx/ll_temac_main.c
> +++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
> @@ -1410,9 +1410,9 @@ static int temac_probe(struct platform_device *pdev)
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	lp->regs = devm_ioremap(&pdev->dev, res->start,
>  					resource_size(res));
> -	if (IS_ERR(lp->regs)) {
> +	if (!lp->regs) {
>  		dev_err(&pdev->dev, "could not map TEMAC registers\n");
> -		return PTR_ERR(lp->regs);
> +		return -ENOMEM;
>  	}
>  
>  	/* Select register access functions with the specified
> @@ -1505,10 +1505,10 @@ static int temac_probe(struct platform_device *pdev)
>  		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  		lp->sdma_regs = devm_ioremap(&pdev->dev, res->start,
>  						     resource_size(res));
> -		if (IS_ERR(lp->sdma_regs)) {
> +		if (!lp->sdma_regs) {
>  			dev_err(&pdev->dev,
>  				"could not map DMA registers\n");
> -			return PTR_ERR(lp->sdma_regs);
> +			return -ENOMEM;
>  		}
>  		if (pdata->dma_little_endian) {
>  			lp->dma_in = temac_dma_in32_le;
