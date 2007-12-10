From: Wang Chen <wangchen@cn.fujitsu.com>
Date: Mon, 10 Dec 2007 02:28:52 +0000
Subject: Re: [PATCH 3/3] Fix use of skb after netif_rx
Message-Id: <475CA464.1060408@cn.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712092103560.11165@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712092103560.11165@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: fpavlic@de.ibm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall said the following on 2007-12-10 4:05:
> From: Julia Lawall <julia@diku.dk>
> // <smpl>
> @@
> expression skb, e,e1;
> @@
> 
> (
>  netif_rx(skb);
> |
>  netif_rx_ni(skb);
> )
>   ... when != skb = e
> (
>   skb = e1
> |
> * skb
> )
> // </smpl>
> 
> diff a/drivers/s390/net/ctcmain.c b/drivers/s390/net/ctcmain.c
> diff a/drivers/s390/net/netiucv.c b/drivers/s390/net/netiucv.c

Julia, seems that your semantic patch misses following place.

drivers/s390/net/qeth_main.c:2733
...
#endif
			rxrc = netif_rx(skb);
		card->dev->last_rx = jiffies;
		card->stats.rx_packets++;
		card->stats.rx_bytes += skb->len;
...

--
WCN

