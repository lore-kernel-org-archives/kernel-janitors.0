From: Ian Abbott <abbotti@mev.co.uk>
Date: Tue, 14 Jul 2020 09:56:53 +0000
Subject: Re: [PATCH v2] staging: comedi: s626: Remove pci-dma-compat wrapper APIs.
Message-Id: <5c137548-9c64-1aa5-bd31-e84e42fcc5a2@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200713143253.GA14953@blackclown>
In-Reply-To: <20200713143253.GA14953@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suraj Upadhyay <usuraj35@gmail.com>, gregkh@linuxfoundation.org, hsweeten@visionengravers.com, christophe.jaillet@wanadoo.fr
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 13/07/2020 15:32, Suraj Upadhyay wrote:
> The legacy API wrappers in include/linux/pci-dma-compat.h
> should go away as it creates unnecessary midlayering
> for include/linux/dma-mapping.h APIs, instead use dma-mapping.h
> APIs directly.
> 
> The patch has been generated with the coccinelle script below
> and compile-tested.
> 
> @@@@
> - PCI_DMA_BIDIRECTIONAL
> + DMA_BIDIRECTIONAL
> 
> @@@@
> - PCI_DMA_TODEVICE
> + DMA_TO_DEVICE
> 
> @@@@
> - PCI_DMA_FROMDEVICE
> + DMA_FROM_DEVICE
> 
> @@@@
> - PCI_DMA_NONE
> + DMA_NONE
> 
> @@ expression E1, E2, E3; @@
> - pci_alloc_consistent(E1, E2, E3)
> + dma_alloc_coherent(&E1->dev, E2, E3, GFP_ATOMIC)
> 
> @@ expression E1, E2, E3; @@
> - pci_zalloc_consistent(E1, E2, E3)
> + dma_alloc_coherent(&E1->dev, E2, E3, GFP_ATOMIC)
> 
> @@ expression E1, E2, E3, E4; @@
> - pci_free_consistent(E1, E2, E3, E4)
> + dma_free_coherent(&E1->dev, E2, E3, E4)
> 
> @@ expression E1, E2, E3, E4; @@
> - pci_map_single(E1, E2, E3, E4)
> + dma_map_single(&E1->dev, E2, E3, (enum dma_data_direction)E4)
> 
> @@ expression E1, E2, E3, E4; @@
> - pci_unmap_single(E1, E2, E3, E4)
> + dma_unmap_single(&E1->dev, E2, E3, (enum dma_data_direction)E4)
> 
> @@ expression E1, E2, E3, E4, E5; @@
> - pci_map_page(E1, E2, E3, E4, E5)
> + dma_map_page(&E1->dev, E2, E3, E4, (enum dma_data_direction)E5)
> 
> @@ expression E1, E2, E3, E4; @@
> - pci_unmap_page(E1, E2, E3, E4)
> + dma_unmap_page(&E1->dev, E2, E3, (enum dma_data_direction)E4)
> 
> @@ expression E1, E2, E3, E4; @@
> - pci_map_sg(E1, E2, E3, E4)
> + dma_map_sg(&E1->dev, E2, E3, (enum dma_data_direction)E4)
> 
> @@ expression E1, E2, E3, E4; @@
> - pci_unmap_sg(E1, E2, E3, E4)
> + dma_unmap_sg(&E1->dev, E2, E3, (enum dma_data_direction)E4)
> 
> @@ expression E1, E2, E3, E4; @@
> - pci_dma_sync_single_for_cpu(E1, E2, E3, E4)
> + dma_sync_single_for_cpu(&E1->dev, E2, E3, (enum dma_data_direction)E4)
> 
> @@ expression E1, E2, E3, E4; @@
> - pci_dma_sync_single_for_device(E1, E2, E3, E4)
> + dma_sync_single_for_device(&E1->dev, E2, E3, (enum dma_data_direction)E4)
> 
> @@ expression E1, E2, E3, E4; @@
> - pci_dma_sync_sg_for_cpu(E1, E2, E3, E4)
> + dma_sync_sg_for_cpu(&E1->dev, E2, E3, (enum dma_data_direction)E4)
> 
> @@ expression E1, E2, E3, E4; @@
> - pci_dma_sync_sg_for_device(E1, E2, E3, E4)
> + dma_sync_sg_for_device(&E1->dev, E2, E3, (enum dma_data_direction)E4)
> 
> @@ expression E1, E2; @@
> - pci_dma_mapping_error(E1, E2)
> + dma_mapping_error(&E1->dev, E2)
> 
> @@ expression E1, E2; @@
> - pci_set_consistent_dma_mask(E1, E2)
> + dma_set_coherent_mask(&E1->dev, E2)
> 
> @@ expression E1, E2; @@
> - pci_set_dma_mask(E1, E2)
> + dma_set_mask(&E1->dev, E2)
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
> Changes:
> 	v2: Converted the GFP_ATOMIC flag to GFP_KERNEL to suit for the
> 	context. On reviewer's advise.
> 
>   drivers/staging/comedi/drivers/s626.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/comedi/drivers/s626.c b/drivers/staging/comedi/drivers/s626.c
> index 084a8e7b9fc2..e7aba937d896 100644
> --- a/drivers/staging/comedi/drivers/s626.c
> +++ b/drivers/staging/comedi/drivers/s626.c
> @@ -2130,13 +2130,15 @@ static int s626_allocate_dma_buffers(struct comedi_device *dev)
>   	void *addr;
>   	dma_addr_t appdma;
>   
> -	addr = pci_alloc_consistent(pcidev, S626_DMABUF_SIZE, &appdma);
> +	addr = dma_alloc_coherent(&pcidev->dev, S626_DMABUF_SIZE, &appdma,
> +				  GFP_KERNEL);
>   	if (!addr)
>   		return -ENOMEM;
>   	devpriv->ana_buf.logical_base = addr;
>   	devpriv->ana_buf.physical_base = appdma;
>   
> -	addr = pci_alloc_consistent(pcidev, S626_DMABUF_SIZE, &appdma);
> +	addr = dma_alloc_coherent(&pcidev->dev, S626_DMABUF_SIZE, &appdma,
> +				  GFP_KERNEL);
>   	if (!addr)
>   		return -ENOMEM;
>   	devpriv->rps_buf.logical_base = addr;
> @@ -2154,13 +2156,13 @@ static void s626_free_dma_buffers(struct comedi_device *dev)
>   		return;
>   
>   	if (devpriv->rps_buf.logical_base)
> -		pci_free_consistent(pcidev, S626_DMABUF_SIZE,
> -				    devpriv->rps_buf.logical_base,
> -				    devpriv->rps_buf.physical_base);
> +		dma_free_coherent(&pcidev->dev, S626_DMABUF_SIZE,
> +				  devpriv->rps_buf.logical_base,
> +				  devpriv->rps_buf.physical_base);
>   	if (devpriv->ana_buf.logical_base)
> -		pci_free_consistent(pcidev, S626_DMABUF_SIZE,
> -				    devpriv->ana_buf.logical_base,
> -				    devpriv->ana_buf.physical_base);
> +		dma_free_coherent(&pcidev->dev, S626_DMABUF_SIZE,
> +				  devpriv->ana_buf.logical_base,
> +				  devpriv->ana_buf.physical_base);
>   }
>   
>   static int s626_initialize(struct comedi_device *dev)
> 

Looks good to me.

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || Web: www.mev.co.uk )=-
-=( MEV Ltd. is a company registered in England & Wales. )=-
-=( Registered number: 02862268.  Registered address:    )=-
-=( 15 West Park Road, Bramhall, STOCKPORT, SK7 3JZ, UK. )=-
