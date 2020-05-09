From: Finn Thain <fthain@telegraphics.com.au>
Date: Sat, 09 May 2020 23:52:24 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <alpine.LNX.2.22.394.2005100946241.11@nippy.intranet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508172557.218132-1-christophe.jaillet@wanadoo.fr> <20200508185402.41d9d068@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200508185402.41d9d068@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 8 May 2020, Jakub Kicinski wrote:

> On Fri,  8 May 2020 19:25:57 +0200 Christophe JAILLET wrote:
> > @@ -527,8 +531,9 @@ static int mac_sonic_platform_remove(struct platform_device *pdev)
> >  	struct sonic_local* lp = netdev_priv(dev);
> >  
> >  	unregister_netdev(dev);
> > -	dma_free_coherent(lp->device, SIZEOF_SONIC_DESC * SONIC_BUS_SCALE(lp->dma_bitmode),
> > -	                  lp->descriptors, lp->descriptors_laddr);
> > +	dma_free_coherent(lp->device,
> > +			  SIZEOF_SONIC_DESC * SONIC_BUS_SCALE(lp->dma_bitmode),
> > +			  lp->descriptors, lp->descriptors_laddr);
> >  	free_netdev(dev);
> >  
> >  	return 0;
> 
> This is a white-space only change, right? Since this is a fix we should
> avoid making cleanups which are not strictly necessary.
> 

I think it is harmless if it doesn't create any merge conflicts. Any merge 
conflict created by the whitespace change would have happened anyway, 
because all of the changes in this patch are very closely related. That's 
why I was happy to put a 'reviewed-by' tag on this.
