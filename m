From: Joe Perches <joe@perches.com>
Date: Sun, 09 Aug 2020 08:10:46 +0000
Subject: Re: [PATCH 5/4] RDMA/efa : Remove pci-dma-compat wrapper APIs
Message-Id: <91159e176c090f2d7ada6957af342c4b6d787973.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1596957073.git.usuraj35@gmail.com>
         <20200809074517.GA4419@blackclown>
In-Reply-To: <20200809074517.GA4419@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suraj Upadhyay <usuraj35@gmail.com>, dledford@redhat.com, jgg@ziepe.ca, galpress@amazon.com, sleybo@amazon.com
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2020-08-09 at 13:15 +0530, Suraj Upadhyay wrote:
> The legacy API wrappers in include/linux/pci-dma-compat.h
> should go away as it creates unnecessary midlayering
> for include/linux/dma-mapping.h APIs.
> 
> Instead use dma-mapping.h APIs directly.
> 
> The patch has been generated with the coccinelle script below
> and compile-tested.
[]
> diff --git a/drivers/infiniband/hw/efa/efa_main.c b/drivers/infiniband/hw/efa/efa_main.c
[]
> @@ -405,13 +405,13 @@ static int efa_device_init(struct efa_com_dev *edev, struct pci_dev *pdev)
>                 return err;
>         }
> 
> -       err = pci_set_dma_mask(pdev, DMA_BIT_MASK(dma_width));
> +       err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(dma_width));
>         if (err) {
>                 dev_err(&pdev->dev, "pci_set_dma_mask failed %d\n", err);

Coccinelle is great for some things, but not
necessarily for these sorts of changes in an
completely automated way.

The dev_err messages also need to be changed
as the format string contains the old name.

> -       err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(dma_width));
> +       err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(dma_width));
>         if (err) {
>                 dev_err(&pdev->dev,
>                         "err_pci_set_consistent_dma_mask failed %d\n",
