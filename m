From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jul 2020 18:14:07 +0000
Subject: Re: [PATCH 1/2] drm/radeon: switch from 'pci_' to 'dma_' API
Message-Id: <CADnq5_MKR9SC947WCN6Qp4BLhrK03=FtT7hD7b+DwNQ46krmkQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727103421.50739-1-christophe.jaillet@wanadoo.fr>
 <224fc7f6-f56b-1dc8-87f2-33ff85d5720d@gmail.com>
In-Reply-To: <224fc7f6-f56b-1dc8-87f2-33ff85d5720d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christian Koenig <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <alexander.deucher@amd.com>

Applied.  Thanks!

Alex

On Mon, Jul 27, 2020 at 9:42 AM Christian König
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 27.07.20 um 12:34 schrieb Christophe JAILLET:
> > The wrappers in include/linux/pci-dma-compat.h should go away.
> >
> > The patch has been generated with the coccinelle script below and has been
> > hand modified to replace GFP_ with a correct flag.
> > It has been compile tested.
> >
> > When memory is allocated in 'radeon_gart_table_ram_alloc()' GFP_KERNEL
> > can be used because its callers already use this flag.
> >
> > Both 'r100_pci_gart_init()' (r100.c) and 'rs400_gart_init()' (rs400.c)
> > call 'radeon_gart_init()'.
> > This function uses 'vmalloc'.
> >
> >
> > @@
> > @@
> > -    PCI_DMA_BIDIRECTIONAL
> > +    DMA_BIDIRECTIONAL
> >
> > @@
> > @@
> > -    PCI_DMA_TODEVICE
> > +    DMA_TO_DEVICE
> >
> > @@
> > @@
> > -    PCI_DMA_FROMDEVICE
> > +    DMA_FROM_DEVICE
> >
> > @@
> > @@
> > -    PCI_DMA_NONE
> > +    DMA_NONE
> >
> > @@
> > expression e1, e2, e3;
> > @@
> > -    pci_alloc_consistent(e1, e2, e3)
> > +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> >
> > @@
> > expression e1, e2, e3;
> > @@
> > -    pci_zalloc_consistent(e1, e2, e3)
> > +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_free_consistent(e1, e2, e3, e4)
> > +    dma_free_coherent(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_map_single(e1, e2, e3, e4)
> > +    dma_map_single(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_unmap_single(e1, e2, e3, e4)
> > +    dma_unmap_single(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4, e5;
> > @@
> > -    pci_map_page(e1, e2, e3, e4, e5)
> > +    dma_map_page(&e1->dev, e2, e3, e4, e5)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_unmap_page(e1, e2, e3, e4)
> > +    dma_unmap_page(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_map_sg(e1, e2, e3, e4)
> > +    dma_map_sg(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_unmap_sg(e1, e2, e3, e4)
> > +    dma_unmap_sg(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
> > +    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_dma_sync_single_for_device(e1, e2, e3, e4)
> > +    dma_sync_single_for_device(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
> > +    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
> > +    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2;
> > @@
> > -    pci_dma_mapping_error(e1, e2)
> > +    dma_mapping_error(&e1->dev, e2)
> >
> > @@
> > expression e1, e2;
> > @@
> > -    pci_set_dma_mask(e1, e2)
> > +    dma_set_mask(&e1->dev, e2)
> >
> > @@
> > expression e1, e2;
> > @@
> > -    pci_set_consistent_dma_mask(e1, e2)
> > +    dma_set_coherent_mask(&e1->dev, e2)
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> > ---
> > If needed, see post from Christoph Hellwig on the kernel-janitors ML:
> >     https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
> > ---
> >   drivers/gpu/drm/radeon/radeon_gart.c | 9 ++++-----
> >   1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeon/radeon_gart.c
> > index f178ba321715..b7ce254e5663 100644
> > --- a/drivers/gpu/drm/radeon/radeon_gart.c
> > +++ b/drivers/gpu/drm/radeon/radeon_gart.c
> > @@ -72,8 +72,8 @@ int radeon_gart_table_ram_alloc(struct radeon_device *rdev)
> >   {
> >       void *ptr;
> >
> > -     ptr = pci_alloc_consistent(rdev->pdev, rdev->gart.table_size,
> > -                                &rdev->gart.table_addr);
> > +     ptr = dma_alloc_coherent(&rdev->pdev->dev, rdev->gart.table_size,
> > +                              &rdev->gart.table_addr, GFP_KERNEL);
> >       if (ptr == NULL) {
> >               return -ENOMEM;
> >       }
> > @@ -110,9 +110,8 @@ void radeon_gart_table_ram_free(struct radeon_device *rdev)
> >                             rdev->gart.table_size >> PAGE_SHIFT);
> >       }
> >   #endif
> > -     pci_free_consistent(rdev->pdev, rdev->gart.table_size,
> > -                         (void *)rdev->gart.ptr,
> > -                         rdev->gart.table_addr);
> > +     dma_free_coherent(&rdev->pdev->dev, rdev->gart.table_size,
> > +                       (void *)rdev->gart.ptr, rdev->gart.table_addr);
> >       rdev->gart.ptr = NULL;
> >       rdev->gart.table_addr = 0;
> >   }
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
