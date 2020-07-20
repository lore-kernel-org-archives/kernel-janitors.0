From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 20 Jul 2020 07:27:04 +0000
Subject: Re: [PATCH] drm/i810: switch from 'pci_' to 'dma_' API
Message-Id: <20200720072704.GT3278063@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200718072822.339064-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200718072822.339064-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@linux.ie, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

On Sat, Jul 18, 2020 at 09:28:22AM +0200, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'i810_dma_initialize()' GFP_KERNEL can be used
> because its only caller, 'i810_dma_init()', already use it and no lock is
> taken in the between.
> 
> 
> @@
> @@
> -    PCI_DMA_BIDIRECTIONAL
> +    DMA_BIDIRECTIONAL
> 
> @@
> @@
> -    PCI_DMA_TODEVICE
> +    DMA_TO_DEVICE
> 
> @@
> @@
> -    PCI_DMA_FROMDEVICE
> +    DMA_FROM_DEVICE
> 
> @@
> @@
> -    PCI_DMA_NONE
> +    DMA_NONE
> 
> @@
> expression e1, e2, e3;
> @@
> -    pci_alloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> 
> @@
> expression e1, e2, e3;
> @@
> -    pci_zalloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_free_consistent(e1, e2, e3, e4)
> +    dma_free_coherent(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_single(e1, e2, e3, e4)
> +    dma_map_single(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_single(e1, e2, e3, e4)
> +    dma_unmap_single(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4, e5;
> @@
> -    pci_map_page(e1, e2, e3, e4, e5)
> +    dma_map_page(&e1->dev, e2, e3, e4, e5)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_page(e1, e2, e3, e4)
> +    dma_unmap_page(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_sg(e1, e2, e3, e4)
> +    dma_map_sg(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_sg(e1, e2, e3, e4)
> +    dma_unmap_sg(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
> +    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_device(e1, e2, e3, e4)
> +    dma_sync_single_for_device(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
> +    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
> +    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2;
> @@
> -    pci_dma_mapping_error(e1, e2)
> +    dma_mapping_error(&e1->dev, e2)
> 
> @@
> expression e1, e2;
> @@
> -    pci_set_dma_mask(e1, e2)
> +    dma_set_mask(&e1->dev, e2)
> 
> @@
> expression e1, e2;
> @@
> -    pci_set_consistent_dma_mask(e1, e2)
> +    dma_set_coherent_mask(&e1->dev, e2)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to drm-misc-next. Since we're already past -rc6 I think it'll go
into 5.10.

Thanks, Daniel

> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>    https://marc.info/?l=kernel-janitors&m8745678307186&w=4
> ---
>  drivers/gpu/drm/i810/i810_dma.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
> index b88c3d5f92b4..303c2d483c6e 100644
> --- a/drivers/gpu/drm/i810/i810_dma.c
> +++ b/drivers/gpu/drm/i810/i810_dma.c
> @@ -220,9 +220,9 @@ static int i810_dma_cleanup(struct drm_device *dev)
>  		if (dev_priv->ring.virtual_start)
>  			drm_legacy_ioremapfree(&dev_priv->ring.map, dev);
>  		if (dev_priv->hw_status_page) {
> -			pci_free_consistent(dev->pdev, PAGE_SIZE,
> -					    dev_priv->hw_status_page,
> -					    dev_priv->dma_status_page);
> +			dma_free_coherent(&dev->pdev->dev, PAGE_SIZE,
> +					  dev_priv->hw_status_page,
> +					  dev_priv->dma_status_page);
>  		}
>  		kfree(dev->dev_private);
>  		dev->dev_private = NULL;
> @@ -398,8 +398,8 @@ static int i810_dma_initialize(struct drm_device *dev,
>  
>  	/* Program Hardware Status Page */
>  	dev_priv->hw_status_page > -		pci_zalloc_consistent(dev->pdev, PAGE_SIZE,
> -				      &dev_priv->dma_status_page);
> +		dma_alloc_coherent(&dev->pdev->dev, PAGE_SIZE,
> +				   &dev_priv->dma_status_page, GFP_KERNEL);
>  	if (!dev_priv->hw_status_page) {
>  		dev->dev_private = (void *)dev_priv;
>  		i810_dma_cleanup(dev);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
