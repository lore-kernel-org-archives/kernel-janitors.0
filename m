From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 10 Dec 2016 21:07:37 +0000
Subject: Re: [patch] nvme-fabrics: correct some printk information
Message-Id: <20161210210737.GR8244@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161210090618.GA11680@elgon.mountain>
 <1481369270.5946.51.camel@perches.com>
 <20161210184029.GY8176@mwanda>
 <alpine.DEB.2.20.1612102104050.1986@hadrien>
 <1481403290.1764.1.camel@perches.com>
In-Reply-To: <1481403290.1764.1.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Dec 10, 2016 at 12:54:50PM -0800, Joe Perches wrote:
> diff -u -p drivers//dma/pxa_dma.c /tmp/nothing//dma/pxa_dma.c
> --- drivers//dma/pxa_dma.c
> +++ /tmp/nothing//dma/pxa_dma.c
> @@ -640,9 +640,6 @@ static unsigned int clear_chan_irq(struc
>  	dcsr = phy_readl_relaxed(phy, DCSR);
>  	phy_writel(phy, dcsr, DCSR);
>  	if ((dcsr & PXA_DCSR_BUSERR) && (phy->vchan))
> -		dev_warn(&phy->vchan->vc.chan.dev->device,
> -			 "%s(chan=%p): PXA_DCSR_BUSERR\n",
> -			 __func__, &phy->vchan);

That's not a defect.  We're getting the address of vchan.  I don't get
it?

regards,
dan carpenter

