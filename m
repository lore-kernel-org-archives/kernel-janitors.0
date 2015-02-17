From: Roland Dreier <roland@kernel.org>
Date: Tue, 17 Feb 2015 18:33:30 +0000
Subject: Re: [PATCH 1/1] IB/mthca: remove deprecated use of pci api
Message-Id: <CAL1RGDU7cnR=uszxLiACEc8rLUty2T6Z6bZVx+_YjSzb9WpsZQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150204140911.GA23076@sloth>
In-Reply-To: <20150204140911.GA23076@sloth>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Feb 4, 2015 at 6:09 AM, Quentin Lambert
<lambert.quentin@gmail.com> wrote:
> -       dev->eq_table.icm_dma  = pci_map_page(dev->pdev, dev->eq_table.icm_page, 0,
> -                                             PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
> -       if (pci_dma_mapping_error(dev->pdev, dev->eq_table.icm_dma)) {
> +       dev->eq_table.icm_dma  = dma_map_page(&dev->pdev->dev,
> +                                             dev->eq_table.icm_page, 0,
> +                                             PAGE_SIZE,
> +                                             (enum dma_data_direction)PCI_DMA_BIDIRECTIONAL);

Surely this can't be right?  Shouldn't the direction just change to
DMA_BIDIRECTIONAL?

Are we really sweeping through the kernel and getting rid of pci_map_
etc. calls?

If so please respin your semantic patch so that it doesn't add crazy stuff like

    (enum dma_data_direction)PCI_DMA_BIDIRECTIONAL

and resend the change.

Thanks,
  Roland
