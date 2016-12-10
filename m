From: Joe Perches <joe@perches.com>
Date: Sat, 10 Dec 2016 22:24:22 +0000
Subject: Re: [patch] nvme-fabrics: correct some printk information
Message-Id: <1481408662.1764.3.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161210090618.GA11680@elgon.mountain>
 <1481369270.5946.51.camel@perches.com> <20161210184029.GY8176@mwanda>
 <alpine.DEB.2.20.1612102104050.1986@hadrien>
 <1481403290.1764.1.camel@perches.com> <20161210210737.GR8244@mwanda>
In-Reply-To: <20161210210737.GR8244@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 2016-12-11 at 00:07 +0300, Dan Carpenter wrote:
> On Sat, Dec 10, 2016 at 12:54:50PM -0800, Joe Perches wrote:
> > diff -u -p drivers//dma/pxa_dma.c /tmp/nothing//dma/pxa_dma.c
> > --- drivers//dma/pxa_dma.c
> > +++ /tmp/nothing//dma/pxa_dma.c
> > @@ -640,9 +640,6 @@ static unsigned int clear_chan_irq(struc
> >  	dcsr = phy_readl_relaxed(phy, DCSR);
> >  	phy_writel(phy, dcsr, DCSR);
> >  	if ((dcsr & PXA_DCSR_BUSERR) && (phy->vchan))
> > -		dev_warn(&phy->vchan->vc.chan.dev->device,
> > -			 "%s(chan=%p): PXA_DCSR_BUSERR\n",
> > -			 __func__, &phy->vchan);
> 
> That's not a defect.  We're getting the address of vchan.  I don't get
> it?

$ git grep -n -w vchan drivers/dma/pxa*
drivers/dma/pxa_dma.c:103:      struct pxad_chan        *vchan;

