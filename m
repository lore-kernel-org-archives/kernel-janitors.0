From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Tue, 30 Aug 2011 14:40:48 +0000
Subject: Re: [patch 1/3 -next] 6LoWPAN: use kfree_skb() instead of kfree()
Message-Id: <1314715248.2935.25.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110830134552.GH3705@shale.localdomain>
In-Reply-To: <20110830134552.GH3705@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergey Lapin <slapin@ossfans.org>, "David S. Miller" <davem@davemloft.net>, "open list:IEEE 802.15.4 SUB..." <linux-zigbee-devel@lists.sourceforge.net>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

Le mardi 30 août 2011 à 16:45 +0300, Dan Carpenter a écrit :
> Use kfree_skb() to free sbk_buffs.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
> index cf304cc..8a9dbaa 100644
> --- a/net/ieee802154/6lowpan.c
> +++ b/net/ieee802154/6lowpan.c
> @@ -674,7 +674,7 @@ lowpan_process_data(struct sk_buff *skb)
>  							sizeof(hdr));
>  	return lowpan_skb_deliver(skb, &hdr);
>  drop:
> -	kfree(skb);
> +	kfree_skb(skb);
>  	return -EINVAL;
>  }
>  

Another bug is the skb_copy() done in lowpan_skb_deliver()

1) No check of skb_copy() return 

2.1) Use of GFP_KERNEL : Is it safe at this point ? Aren’t we in
softirq ?

2.2) If GFP_KERNEL is safe, why do we later do :

	if (in_interrupt())
		stat = netif_rx(skb);
	else
		stat = netif_rx_ni(skb);



