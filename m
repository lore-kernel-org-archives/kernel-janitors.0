From: Angelo Dureghello <angelo@sysam.it>
Date: Wed, 04 Jul 2018 09:04:46 +0000
Subject: Re: [PATCH -next] dmaengine: fsl-edma: fix the error return code in mcf_edma_probe()
Message-Id: <20180704090445.GD9939@jerusalem>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530692511-191869-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1530692511-191869-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

Reviewed-by: Angelo Dureghello <angelo@sysam.it>

Thanks for the fix.

On Wed, Jul 04, 2018 at 08:21:51AM +0000, Wei Yongjun wrote:
> The error return code PTR_ERR(pdata) is always 0 since pdata is
> NULL in this error handling case.
> 
> Fixes: 5c1355ad87a2 ("dmaengine: fsl-edma: add ColdFire mcf5441x edma support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/dma/mcf-edma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/mcf-edma.c b/drivers/dma/mcf-edma.c
> index 31e5317..787b7b6 100644
> --- a/drivers/dma/mcf-edma.c
> +++ b/drivers/dma/mcf-edma.c
> @@ -175,7 +175,7 @@ static int mcf_edma_probe(struct platform_device *pdev)
>  
>  	pdata = dev_get_platdata(&pdev->dev);
>  	if (!pdata)
> -		return PTR_ERR(pdata);
> +		return -EINVAL;
>  
>  	chans = pdata->dma_channels;
>  	len = sizeof(*mcf_edma) + sizeof(*mcf_chan) * chans;
> 
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
