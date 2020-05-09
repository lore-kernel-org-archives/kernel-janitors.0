From: Finn Thain <fthain@telegraphics.com.au>
Date: Sat, 09 May 2020 23:45:04 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <alpine.LNX.2.22.394.2005100922240.11@nippy.intranet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b7651b26-ac1e-6281-efb2-7eff0018b158@web.de>
In-Reply-To: <b7651b26-ac1e-6281-efb2-7eff0018b158@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>

On Sat, 9 May 2020, Markus Elfring wrote:

> > While at it, rename a label in order to be slightly more informative and
> > split some too long lines.
> 
> Would you like to add the tag 'Fixes' to the change description?
> 

Sorry but I don't follow your reasoning here. Are you saying that this 
needs to be pushed out to -stable branches? If so, stable-kernel-rules.rst 
would seem to disagree as the bug is theoretical and isn't bothering 
people.

Is there a way to add a Fixes tag that would not invoke the -stable 
process? And was that what you had in mind?

> 
> > +++ b/drivers/net/ethernet/natsemi/macsonic.c
> > @@ -506,10 +506,14 @@ static int mac_sonic_platform_probe(struct platform_device *pdev)
> >
> >  	err = register_netdev(dev);
> >  	if (err)
> > -		goto out;
> > +		goto undo_probe1;
> >
> >  	return 0;
> >
> > +undo_probe1:
> > +	dma_free_coherent(lp->device,
> > +			  SIZEOF_SONIC_DESC * SONIC_BUS_SCALE(lp->dma_bitmode),
> > +			  lp->descriptors, lp->descriptors_laddr);
> >  out:
> How do you think about the possibility to use the label 'free_dma'?

I think 'undo_probe1' is both descriptive and consistent with commit 
10e3cc180e64 ("net/sonic: Fix a resource leak in an error handling path in 
'jazz_sonic_probe()'").

Your suggestion, 'free_dma' is also good. But coming up with good 
alternatives is easy. If every good alternative would be considered there 
would be no obvious way to get a patch merged.
