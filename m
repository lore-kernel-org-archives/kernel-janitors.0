From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Date: Mon, 27 Jul 2020 13:42:37 +0000
Subject: Re: [PATCH 1/2] drm/radeon: switch from 'pci_' to 'dma_' API
Message-Id: <224fc7f6-f56b-1dc8-87f2-33ff85d5720d@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727103421.50739-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200727103421.50739-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch
Cc: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Am 27.07.20 um 12:34 schrieb Christophe JAILLET:
> The wrappers in include/linux/pci-dma-compat.h should go away.
>
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
>
> When memory is allocated in 'radeon_gart_table_ram_alloc()' GFP_KERNEL
> can be used because its callers already use this flag.
>
> Both 'r100_pci_gart_init()' (r100.c) and 'rs400_gart_init()' (rs400.c)
> call 'radeon_gart_init()'.
> This function uses 'vmalloc'.
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

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>     https://marc.info/?l=3Dkernel-janitors&m=158745678307186&w=3D4
> ---
>   drivers/gpu/drm/radeon/radeon_gart.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeo=
n/radeon_gart.c
> index f178ba321715..b7ce254e5663 100644
> --- a/drivers/gpu/drm/radeon/radeon_gart.c
> +++ b/drivers/gpu/drm/radeon/radeon_gart.c
> @@ -72,8 +72,8 @@ int radeon_gart_table_ram_alloc(struct radeon_device *r=
dev)
>   {
>   	void *ptr;
>  =20
> -	ptr =3D pci_alloc_consistent(rdev->pdev, rdev->gart.table_size,
> -				   &rdev->gart.table_addr);
> +	ptr =3D dma_alloc_coherent(&rdev->pdev->dev, rdev->gart.table_size,
> +				 &rdev->gart.table_addr, GFP_KERNEL);
>   	if (ptr =3D NULL) {
>   		return -ENOMEM;
>   	}
> @@ -110,9 +110,8 @@ void radeon_gart_table_ram_free(struct radeon_device =
*rdev)
>   			      rdev->gart.table_size >> PAGE_SHIFT);
>   	}
>   #endif
> -	pci_free_consistent(rdev->pdev, rdev->gart.table_size,
> -			    (void *)rdev->gart.ptr,
> -			    rdev->gart.table_addr);
> +	dma_free_coherent(&rdev->pdev->dev, rdev->gart.table_size,
> +			  (void *)rdev->gart.ptr, rdev->gart.table_addr);
>   	rdev->gart.ptr =3D NULL;
>   	rdev->gart.table_addr =3D 0;
>   }
