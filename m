From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 01 Apr 2005 12:30:46 +0000
Subject: Re: [KJ] [PATCH] drivers/block/cciss : Use the DMA_{32|64}_MASK
Message-Id: <20050401123046.GN5445@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37660975202114583=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050401083934.GG5445@rhum.iomeda.fr>
In-Reply-To: <20050401083934.GG5445@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============37660975202114583==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tobias Klauser (tklauser@nuerscht.ch) wrote:
> On Fri, Apr 01, 2005 at 10:39:34AM +0200, Christophe Lucas wrote:
> 
> [...]
> 
> >  	/* configure PCI DMA stuff */
> > -	if (!pci_set_dma_mask(pdev, 0xffffffffffffffffULL))
> > +	if (!pci_set_dma_mask(pdev, DMA_64BIT_MASK))
> 
> This one is already covered by one of my patches.
> 
> >  		printk("cciss: using DAC cycles\n");
> > -	else if (!pci_set_dma_mask(pdev, 0xffffffff))
> > +	else if (!pci_set_dma_mask(pdev, DMA_32BIT_MASK))
> 
> Ditto
> 
> >  		printk("cciss: not using DAC cycles\n");
> >  	else {
> >  		printk("cciss: no suitable DMA available\n");
> 
> Cheers, Tobias

Perhaps, could you update your patch about block/cciss.c to include the
first part of the previous patch ?

	~Christophe


--===============37660975202114583==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37660975202114583==--
