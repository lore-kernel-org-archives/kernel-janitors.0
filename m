From: Guan Xuetao <gxt@mprc.pku.edu.cn>
Date: Wed, 14 Mar 2012 08:42:55 +0000
Subject: Re: [PATCH 7/7] arch/unicore32/kernel/dma.c: ensure arguments to request_irq and free_irq are compat
Message-Id: <1331714575.2389.47.camel@epip-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331494587-12196-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1331494587-12196-8-git-send-email-Julia.Lawall@lip6.fr>
	 <1331513926.2048.58.camel@epip-laptop>
	 <alpine.DEB.2.02.1203120625570.2066@localhost6.localdomain6>
	 <1331622633.2048.87.camel@epip-laptop>
	 <alpine.DEB.2.02.1203130921250.1974@localhost6.localdomain6>
	 <1331712444.2389.36.camel@epip-laptop> <20120314081910.GC3163@mwanda>
In-Reply-To: <20120314081910.GC3163@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2012-03-14 at 11:19 +0300, Dan Carpenter wrote:
> On Wed, Mar 14, 2012 at 04:07:24PM +0800, Guan Xuetao wrote:
> > puv3_init_dma() is called ONCE when initializing.
> > In logical, if request_irq(IRQ_DMAERR, *) failed, free_irq(IRQ_DMA, *)
> > is unnecessary, and dma device/driver can keep on working.
> > The patch could be:
> >   	ret = request_irq(IRQ_DMAERR, dma_err_handler, 0, "DMAERR", NULL);
> >   	if (ret) {
> >   		printk(KERN_CRIT "Can't register IRQ for DMAERR\n");
> >  -		free_irq(IRQ_DMA, "DMA");
> >   		return ret;
> >   	}
> 
> It seems like you should remove the error return as well?
> 
> regards,
> dan carpenter
> 
The error return value will only generate an extra warning message, and
have no side-effect.

Thanks and Regards,
Guan Xuetao


