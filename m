From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 29 Jan 2013 17:49:02 +0000
Subject: Re: coccinelle and bitmask arithmetic (was: Re: [patch] TTY: synclink, small cleanup in dtr_rts())
Message-Id: <alpine.DEB.2.02.1301291847070.3339@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130127194039.GA18787@elgon.mountain>
 <1359317078.14406.12.camel@joe-AO722> <20130127201947.GO16282@mwanda>
 <9561.1359474916@turing-police.cc.vt.edu>
 <1359475998.4196.26.camel@joe-AO722>
In-Reply-To: <1359475998.4196.26.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

How about the following (from today's linux-next).  They appear to be
trying to do the same calculation, once with + and once with |.

arch/arm/common/it8152.c

int dma_set_coherent_mask(struct device *dev, u64 mask)
{
        if (mask >= PHYS_OFFSET + SZ_64M - 1)
                return 0;

        return -EIO;
}

static int it8152_pci_platform_notify(struct device *dev)
{
        if (dev->bus = &pci_bus_type) {
                if (dev->dma_mask)
                        *dev->dma_mask = (SZ_64M - 1) | PHYS_OFFSET;
                dev->coherent_dma_mask = (SZ_64M - 1) | PHYS_OFFSET;
                dmabounce_register_dev(dev, 2048, 4096, it8152_needs_bounce);
        }
        return 0;
}

julia
