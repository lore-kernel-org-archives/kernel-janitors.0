From: Joe Perches <joe@perches.com>
Date: Tue, 29 Jan 2013 18:03:57 +0000
Subject: Re: coccinelle and bitmask arithmetic (was: Re: [patch] TTY: synclink, small cleanup in dtr_rts())
Message-Id: <1359482637.15135.7.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130127194039.GA18787@elgon.mountain>
 <1359317078.14406.12.camel@joe-AO722> <20130127201947.GO16282@mwanda>
 <9561.1359474916@turing-police.cc.vt.edu>
 <1359475998.4196.26.camel@joe-AO722>
 <alpine.DEB.2.02.1301291847070.3339@hadrien>
In-Reply-To: <alpine.DEB.2.02.1301291847070.3339@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Tue, 2013-01-29 at 18:49 +0100, Julia Lawall wrote:
> How about the following (from today's linux-next).  They appear to be
> trying to do the same calculation, once with + and once with |.

(cc'ing the original developer and Russell King)

Likely the it8152_pci_platform_notify uses should use +

> arch/arm/common/it8152.c
> 
> int dma_set_coherent_mask(struct device *dev, u64 mask)
> {
>         if (mask >= PHYS_OFFSET + SZ_64M - 1)
>                 return 0;
> 
>         return -EIO;
> }
> 
> static int it8152_pci_platform_notify(struct device *dev)
> {
>         if (dev->bus = &pci_bus_type) {
>                 if (dev->dma_mask)
>                         *dev->dma_mask = (SZ_64M - 1) | PHYS_OFFSET;
>                 dev->coherent_dma_mask = (SZ_64M - 1) | PHYS_OFFSET;
>                 dmabounce_register_dev(dev, 2048, 4096, it8152_needs_bounce);
>         }
>         return 0;
> }


