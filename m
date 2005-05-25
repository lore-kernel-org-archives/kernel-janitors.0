From: Domen Puncer <domen@coderock.org>
Date: Wed, 25 May 2005 11:38:55 +0000
Subject: Re: [KJ] Re: 2.6.12-rc4-kj (dma_mask-drivers_block_umem.patch)
Message-Id: <20050525113855.GF3851@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61401567126913825=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050513165729.GA31208@nd47.coderock.org> <200505141611.54373.adobriyan@gmail.com>
In-Reply-To: <200505141611.54373.adobriyan@gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>, nettwerk@valinux.com, jerdfelt@valinux.com, neilb@cse.unsw.edu.au

--===============61401567126913825==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

No replies, so I'm adding mails from source to Cc:

On 14/05/05 16:11 +0400, Alexey Dobriyan wrote:
> On Friday 13 May 2005 20:57, Domen Puncer wrote:
> > --- quilt.orig/drivers/block/umem.c
> > +++ quilt/drivers/block/umem.c
> 
> > -	if (pci_set_dma_mask(dev, 0xffffffffffffffffLL) &&
> > -	    !pci_set_dma_mask(dev, 0xffffffffLL)) {
> 	   ^^^
> > +	if (pci_set_dma_mask(dev, DMA_64BIT_MASK) &&
> > +	    !pci_set_dma_mask(dev, DMA_32BIT_MASK)) {
> 	   ^^^
> >  		printk(KERN_WARNING "MM%d: NO suitable DMA found\n",num_cards);
> >  		return  -ENOMEM;
> 
> A typo?

--===============61401567126913825==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61401567126913825==--
