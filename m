From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Date: Wed, 16 Dec 2020 17:13:55 +0000
Subject: RE: [PATCH] dmaengine: dw-edma: Fix use after free in dw_edma_alloc_chunk()
Message-Id: <DM5PR12MB1835E4CC6D248D2FF0C48182DAC50@DM5PR12MB1835.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9dTBFrUPEvvW7qc@mwanda>
In-Reply-To: <X9dTBFrUPEvvW7qc@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Dec 14, 2020 at 11:56:52, Dan Carpenter 
<dan.carpenter@oracle.com> wrote:

> If the dw_edma_alloc_burst() function fails then we free "chunk" but
> it's still on the "desc->chunk->list" list so it will lead to a use
> after free.  Also the "->chunks_alloc" count is incremented when it
> shouldn't be.
> 
> In current kernels small allocations are guaranteed to succeed and
> dw_edma_alloc_burst() can't fail so this will not actually affect
> runtime.
> 
> Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Based on static analysis.  Not tested.
> 
>  drivers/dma/dw-edma/dw-edma-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index b971505b8715..08d71dafa001 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -86,12 +86,12 @@ static struct dw_edma_chunk *dw_edma_alloc_chunk(struct dw_edma_desc *desc)
>  
>  	if (desc->chunk) {
>  		/* Create and add new element into the linked list */
> -		desc->chunks_alloc++;
> -		list_add_tail(&chunk->list, &desc->chunk->list);
>  		if (!dw_edma_alloc_burst(chunk)) {
>  			kfree(chunk);
>  			return NULL;
>  		}
> +		desc->chunks_alloc++;
> +		list_add_tail(&chunk->list, &desc->chunk->list);
>  	} else {
>  		/* List head */
>  		chunk->burst = NULL;
> -- 
> 2.29.2

Thanks for the fix! Nicely catch!

Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
