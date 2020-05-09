From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 09 May 2020 18:13:21 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <20200509111321.51419b19@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508172557.218132-1-christophe.jaillet@wanadoo.fr>
        <20200508185402.41d9d068@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <50ef36cd-d095-9abe-26ea-d363d11ce521@wanadoo.fr>
In-Reply-To: <50ef36cd-d095-9abe-26ea-d363d11ce521@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, fthain@telegraphics.com.au, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 9 May 2020 18:47:08 +0200 Christophe JAILLET wrote:
> Le 09/05/2020 à 03:54, Jakub Kicinski a écrit :
> > On Fri,  8 May 2020 19:25:57 +0200 Christophe JAILLET wrote:  
> >> @@ -527,8 +531,9 @@ static int mac_sonic_platform_remove(struct platform_device *pdev)
> >>   	struct sonic_local* lp = netdev_priv(dev);
> >>   
> >>   	unregister_netdev(dev);
> >> -	dma_free_coherent(lp->device, SIZEOF_SONIC_DESC * SONIC_BUS_SCALE(lp->dma_bitmode),
> >> -	                  lp->descriptors, lp->descriptors_laddr);
> >> +	dma_free_coherent(lp->device,
> >> +			  SIZEOF_SONIC_DESC * SONIC_BUS_SCALE(lp->dma_bitmode),
> >> +			  lp->descriptors, lp->descriptors_laddr);
> >>   	free_netdev(dev);
> >>   
> >>   	return 0;  
> > This is a white-space only change, right? Since this is a fix we should
> > avoid making cleanups which are not strictly necessary.
>
> Right.
> 
> The reason of this clean-up is that I wanted to avoid a checkpatch 
> warning with the proposed patch and I felt that having the same layout 
> in the error handling path of the probe function and in the remove 
> function was clearer.
> So I updated also the remove function.

I understand the motivation is good.

> Fell free to ignore this hunk if not desired. I will not sent a V2 only 
> for that.

That's not how it works. Busy maintainers don't have time to hand edit
patches. I'm not applying this to the networking tree and I'm tossing it
from patchwork. Please address the basic feedback.

Thank you.
