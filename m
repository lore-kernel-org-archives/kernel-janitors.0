From: David Miller <davem@davemloft.net>
Date: Mon, 24 Dec 2018 18:08:36 +0000
Subject: Re: [PATCH] drivers/net: appletalk/cops: remove redundant if statement and mask
Message-Id: <20181224.100836.117884501889550887.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222165841.18288-1-colin.king@canonical.com>
In-Reply-To: <20181222165841.18288-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Dec 2018 16:58:41 +0000

> @@ -777,10 +777,7 @@ static void cops_rx(struct net_device *dev)
>          }
>  
>          /* Get response length. */
> -	if(lp->board=DAYNA)
> -        	pkt_len = inb(ioaddr) & 0xFF;
> -	else
> -		pkt_len = inb(ioaddr) & 0x00FF;
> +	pkt_len = inb(ioaddr);

There are other instances of similar weird identical statements guarded
by the test on the board type being DAYNA.

For example, in cops_send_packet():

	if(lp->board = DAYNA)
               	outb(skb->len >> 8, ioaddr);
	else
		outb((skb->len >> 8)&0x0FF, ioaddr);

Could you scan the rest of the driver and deal with all of these
instances in one go?

Thank you!
