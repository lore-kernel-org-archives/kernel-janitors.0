From: Vinod Koul <vinod.koul@intel.com>
Date: Fri, 07 Oct 2011 05:10:45 +0000
Subject: Re: [patch] dma/timberdale: free_irq() on an error path
Message-Id: <1317963525.1573.2227.camel@vkoul-udesk3>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110923061601.GB4387@elgon.mountain>
In-Reply-To: <20110923061601.GB4387@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2011-09-23 at 09:16 +0300, Dan Carpenter wrote:
> There was an error path that skipped the free_irq() step by mistake.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
> index 6dbdf45..a4a398f 100644
> --- a/drivers/dma/timb_dma.c
> +++ b/drivers/dma/timb_dma.c
> @@ -762,7 +762,7 @@ static int __devinit td_probe(struct platform_device *pdev)
>  		if ((i % 2) = pchan->rx) {
>  			dev_err(&pdev->dev, "Wrong channel configuration\n");
>  			err = -EINVAL;
> -			goto err_tasklet_kill;
> +			goto err_free_irq;
>  		}
>  
>  		td_chan->chan.device = &td->dma;
Applied thanks

-- 
~Vinod

