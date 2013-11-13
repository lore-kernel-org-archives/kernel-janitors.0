From: Vinod Koul <vinod.koul@intel.com>
Date: Wed, 13 Nov 2013 13:32:30 +0000
Subject: Re: [patch 1/2] dma: pl330: off by one in pl330_probe()
Message-Id: <20131113132030.GY8834@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131108095024.GH27977@elgon.mountain>
In-Reply-To: <20131108095024.GH27977@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Nov 08, 2013 at 12:50:24PM +0300, Dan Carpenter wrote:
> There are only AMBA_NR_IRQS (2) elements in adev->irq[].  This code
> maybe works if the there is a zero directly after the array.
Applied both

Thanks
~Vinod

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 4b2583c..4af4b0c 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -2926,7 +2926,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	amba_set_drvdata(adev, pdmac);
>  
> -	for (i = 0; i <= AMBA_NR_IRQS; i++) {
> +	for (i = 0; i < AMBA_NR_IRQS; i++) {
>  		irq = adev->irq[i];
>  		if (irq) {
>  			ret = devm_request_irq(&adev->dev, irq,

-- 
