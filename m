From: Vinod Koul <vinod.koul@intel.com>
Date: Mon, 26 Aug 2013 08:44:20 +0000
Subject: Re: [patch] dma: cppi41: off by one in desc_to_chan()
Message-Id: <20130826083220.GM2748@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823093056.GG31293@elgon.mountain>
In-Reply-To: <20130823093056.GG31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Felipe Balbi <balbi@ti.com>
Cc: Dan Williams <djbw@fb.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 23, 2013 at 12:30:56PM +0300, Dan Carpenter wrote:
> The test here should be ">=" instead of ">".  The cdd->chan_busy[] array
> has "ALLOC_DECS_NUM" elements.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
This needs to go thru USB tree

Acked-by Vinod Koul <vinod.koul@intel.com>

~Vinod
> 
> diff --git a/drivers/dma/cppi41.c b/drivers/dma/cppi41.c
> index 5dcebca..7f6524c 100644
> --- a/drivers/dma/cppi41.c
> +++ b/drivers/dma/cppi41.c
> @@ -241,7 +241,7 @@ static struct cppi41_channel *desc_to_chan(struct cppi41_dd *cdd, u32 desc)
>  	}
>  
>  	desc_num = (desc - cdd->descs_phys) / sizeof(struct cppi41_desc);
> -	BUG_ON(desc_num > ALLOC_DECS_NUM);
> +	BUG_ON(desc_num >= ALLOC_DECS_NUM);
>  	c = cdd->chan_busy[desc_num];
>  	cdd->chan_busy[desc_num] = NULL;
>  	return c;

-- 
