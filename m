From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Thu, 01 Sep 2011 12:00:43 +0000
Subject: Re: [PATCH v2 -next] 6LoWPAN: fix skb_copy call
Message-Id: <1314878443.2823.6.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1314879675-31989-1-git-send-email-alex.bluesman.smirnov@gmail.com>
	 <1314881653-1104-1-git-send-email-alex.bluesman.smirnov@gmail.com>
In-Reply-To: <1314881653-1104-1-git-send-email-alex.bluesman.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Cc: davem@davemloft.net, dbaryshkov@gmail.com, slapin@ossfans.org, linux-zigbee-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Le jeudi 01 septembre 2011 à 16:54 +0400, Alexander Smirnov a écrit :
> This patch fixes 2 issues in lowpan_skb_deliver function:
> 1. Check for return status of skb_copy call;
> 2. Use skb_copy with proper GFP flag depending on context.
> 
> Signed-off-by: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
> ---
>  net/ieee802154/6lowpan.c |   18 +++++++++++++++---
>  1 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
> index cf304cc..16100be 100644
> --- a/net/ieee802154/6lowpan.c
> +++ b/net/ieee802154/6lowpan.c
> @@ -477,9 +477,15 @@ static int lowpan_skb_deliver(struct sk_buff *skb, struct ipv6hdr *hdr)
>  	struct sk_buff *new;
>  	struct lowpan_dev_record *entry;
>  	int stat = NET_RX_SUCCESS;
> +	gfp_t mask;
>  
> -	new = skb_copy_expand(skb, sizeof(struct ipv6hdr), skb_tailroom(skb),
> -								GFP_KERNEL);
> +	if (in_interrupt())
> +		mask = GFP_ATOMIC;
> +	else
> +		mask = GFP_KERNEL;

I am not sure to understand if lowpan_skb_deliver() can be called in
pure process context. I feel we are in softirq handler or we have
disabled BH, so GFP_ATOMIC is the only choice.

If you are unsure, you could use following helper :

	mask = gfp_any();

> +
> +	new = skb_copy_expand(skb, sizeof(struct ipv6hdr),
> +					skb_tailroom(skb), mask);
>  	kfree_skb(skb);
>  

