From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 24 Oct 2012 22:08:07 +0000
Subject: Re: [PATCH] aoe: avoid using skb member after dev_queue_xmit
Message-Id: <20121024150807.82ce2677.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1523cdc8a606d65418dc242e958ff1c@coraid.com>
In-Reply-To: <d1523cdc8a606d65418dc242e958ff1c@coraid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed Cashin <ecashin@coraid.com>
Cc: dan.carpenter@oracle.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 24 Oct 2012 14:26:13 -0400
Ed Cashin <ecashin@coraid.com> wrote:

> After calling dev_queue_xmit it is no longer safe to access the
> members of the skb.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

hm, that was clever.  How did Dan detect this bug?

> --- a/drivers/block/aoe/aoenet.c
> +++ b/drivers/block/aoe/aoenet.c
> @@ -55,12 +55,14 @@ static int
>  tx(void) __must_hold(&txlock)
>  {
>  	struct sk_buff *skb;
> +	struct net_device *ifp;
>  
>  	while ((skb = skb_dequeue(&skbtxq))) {
>  		spin_unlock_irq(&txlock);
> +		ifp = skb->dev;
>  		if (dev_queue_xmit(skb) = NET_XMIT_DROP && net_ratelimit())
>  			pr_warn("aoe: packet could not be sent on %s.  %s\n",
> -				skb->dev ? skb->dev->name : "netif",
> +				ifp ? ifp->name : "netif",
>  				"consider increasing tx_queue_len");
>  		spin_lock_irq(&txlock);
>  	}

Queued as a fix against the not-yet-upstream
aoe-print-warning-regarding-a-common-reason-for-dropped-transmits.patch,
thanks.

