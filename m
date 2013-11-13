From: Vinod Koul <vinod.koul@intel.com>
Date: Wed, 13 Nov 2013 10:31:36 +0000
Subject: Re: [patch] dmaengine: edma: double free on error in edma_prep_slave_sg()
Message-Id: <20131113101936.GW8834@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113074446.GC25541@elgon.mountain>
In-Reply-To: <20131113074446.GC25541@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 13, 2013 at 10:44:46AM +0300, Dan Carpenter wrote:
> We accidentally applied two correct but duplicative fixes for a memory
> leak here:
> 4b6271a64463 ('dma: edma: Fix memory leak')
> 2f6d8fad0a16 ('dma: edma.c: remove edma_desc leakage')
Thanks Dan,

I already send the same fix today morning. This was reported by Wing-Keung
sometime back

--
~Vinod
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/dma/edma.c b/drivers/dma/edma.c
> index ea4abaa..9c8103d 100644
> --- a/drivers/dma/edma.c
> +++ b/drivers/dma/edma.c
> @@ -420,7 +420,6 @@ static struct dma_async_tx_descriptor *edma_prep_slave_sg(
>  				edma_alloc_slot(EDMA_CTLR(echan->ch_num),
>  						EDMA_SLOT_ANY);
>  			if (echan->slot[i] < 0) {
> -				kfree(edesc);
>  				dev_err(dev, "Failed to allocate slot\n");
>  				kfree(edesc);
>  				return NULL;
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
