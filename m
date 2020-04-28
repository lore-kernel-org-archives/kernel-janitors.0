From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Apr 2020 12:54:26 +0000
Subject: Re: [PATCH] dmaengine: qcom_hidma: Simplify error handling path in hidma_probe
Message-Id: <20200428125426.GE2014@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427111043.70218-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200427111043.70218-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: okaya@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 27, 2020 at 01:10:43PM +0200, Christophe JAILLET wrote:
> There is no need to call 'hidma_debug_uninit()' in the error handling
> path. 'hidma_debug_init()' has not been called yet.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/dma/qcom/hidma.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index 411f91fde734..87490e125bc3 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -897,7 +897,6 @@ static int hidma_probe(struct platform_device *pdev)
>  	if (msi)
            ^^^
This test doesn't work.  It will call free hidma_free_msis() if the
hidma_request_msi() call fails.  We should do:

	if (msi) {
		rc = hidma_request_msi(dmadev, pdev);
		msi = false;
	}

	if (!msi) {
		hidma_ll_setup_irq(dmadev->lldev, false);
		rc = devm_request_irq(&pdev->dev, chirq, hidma_chirq_handler,
				      0, "qcom-hidma", dmadev->lldev);
		if (rc)
			goto uninit;
	}


>  		hidma_free_msis(dmadev);
>  
> -	hidma_debug_uninit(dmadev);
>  	hidma_ll_uninit(dmadev->lldev);
>  dmafree:
>  	if (dmadev)
            ^^^^^^
This test isn't necessary and should be deleted.

regards,
dan carpenter
