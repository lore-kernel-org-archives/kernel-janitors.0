From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 14 May 2005 12:11:54 +0000
Subject: [KJ] Re: 2.6.12-rc4-kj (dma_mask-drivers_block_umem.patch)
Message-Id: <200505141611.54373.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050513165729.GA31208@nd47.coderock.org>
In-Reply-To: <20050513165729.GA31208@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Domen Puncer <domen@coderock.org>
Cc: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

On Friday 13 May 2005 20:57, Domen Puncer wrote:
> --- quilt.orig/drivers/block/umem.c
> +++ quilt/drivers/block/umem.c

> -	if (pci_set_dma_mask(dev, 0xffffffffffffffffLL) &&
> -	    !pci_set_dma_mask(dev, 0xffffffffLL)) {
	   ^^^
> +	if (pci_set_dma_mask(dev, DMA_64BIT_MASK) &&
> +	    !pci_set_dma_mask(dev, DMA_32BIT_MASK)) {
	   ^^^
>  		printk(KERN_WARNING "MM%d: NO suitable DMA found\n",num_cards);
>  		return  -ENOMEM;

A typo?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
