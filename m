From: Julia Lawall <julia@diku.dk>
Date: Mon, 10 Dec 2007 07:18:04 +0000
Subject: Re: [PATCH 3/3] Fix use of skb after netif_rx
Message-Id: <Pine.LNX.4.64.0712100813440.13319@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712092103560.11165@ask.diku.dk>
 <475CA464.1060408@cn.fujitsu.com>
In-Reply-To: <475CA464.1060408@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang Chen <wangchen@cn.fujitsu.com>
Cc: fpavlic@de.ibm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> > // </smpl>
> > 
> > diff a/drivers/s390/net/ctcmain.c b/drivers/s390/net/ctcmain.c
> > diff a/drivers/s390/net/netiucv.c b/drivers/s390/net/netiucv.c
> 
> Julia, seems that your semantic patch misses following place.
> 
> drivers/s390/net/qeth_main.c:2733
> ...
> #endif
> 			rxrc = netif_rx(skb);
> 		card->dev->last_rx = jiffies;
> 		card->stats.rx_packets++;
> 		card->stats.rx_bytes += skb->len;
> ...

Actually, I found this one as well, but I wasn't sure what to do with it.  
This one is a bit more complicated because the line with the call to 
netif_rx is in an else branch if the #ifdef above is taken.  So I wasn't 
sure what would be the best way to solve the problem in this case.

Perhaps the solution would be just to save the value of the len field 
in a local variable in this case, as you proposed in your original patch.

julia

