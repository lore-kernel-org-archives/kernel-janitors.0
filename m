From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Thu, 01 Sep 2011 15:31:03 +0000
Subject: Re: [PATCH v3 -next] 6LoWPAN: fix skb_copy call
Message-Id: <1314891063.2823.28.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1314879675-31989-1-git-send-email-alex.bluesman.smirnov@gmail.com>
	 <1314885315-4033-1-git-send-email-alex.bluesman.smirnov@gmail.com>
In-Reply-To: <1314885315-4033-1-git-send-email-alex.bluesman.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Cc: davem@davemloft.net, dbaryshkov@gmail.com, slapin@ossfans.org, linux-zigbee-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Le jeudi 01 septembre 2011 à 17:55 +0400, Alexander Smirnov a écrit :
> This patch fixes 2 issues in lowpan_skb_deliver function:
> 1. Check for return status of skb_copy call;
> 2. Use skb_copy with proper GFP flag, drop check for non-interrupt
> context.
> 
> Signed-off-by: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>

Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>

> ---
>  net/ieee802154/6lowpan.c |   17 +++++++++--------
>  1 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
> index cf304cc..deb2adf 100644
> --- a/net/ieee802154/6lowpan.c
> +++ b/net/ieee802154/6lowpan.c
> @@ -479,10 +479,10 @@ static int lowpan_skb_deliver(struct sk_buff *skb, struct ipv6hdr *hdr)
>  	int stat = NET_RX_SUCCESS;
>  
>  	new = skb_copy_expand(skb, sizeof(struct ipv6hdr), skb_tailroom(skb),
> -								GFP_KERNEL);
> +								GFP_ATOMIC);
>  	kfree_skb(skb);
>  
> -	if (NULL = new)
> +	if (!new)
>  		return -ENOMEM;
>  
>  	skb_push(new, sizeof(struct ipv6hdr));
> @@ -495,13 +495,14 @@ static int lowpan_skb_deliver(struct sk_buff *skb, struct ipv6hdr *hdr)
>  	rcu_read_lock();
>  	list_for_each_entry_rcu(entry, &lowpan_devices, list)
>  		if (lowpan_dev_info(entry->ldev)->real_dev = new->dev) {
> -			skb = skb_copy(new, GFP_KERNEL);
> -			skb->dev = entry->ldev;
> +			skb = skb_copy(new, GFP_ATOMIC);
> +			if (!skb) {
> +				stat = -ENOMEM;
> +				break;
> +			}
>  
> -			if (in_interrupt())
> -				stat = netif_rx(skb);
> -			else
> -				stat = netif_rx_ni(skb);
> +			skb->dev = entry->ldev;
> +			stat = netif_rx(skb);
>  		}
>  	rcu_read_unlock();
>  


