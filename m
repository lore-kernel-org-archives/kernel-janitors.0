From: Wang Chen <wangchen@cn.fujitsu.com>
Date: Mon, 10 Dec 2007 07:35:10 +0000
Subject: Re: [PATCH 3/3] Fix use of skb after netif_rx
Message-Id: <475CEC2E.4040006@cn.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712092103560.11165@ask.diku.dk> <475CA464.1060408@cn.fujitsu.com> <Pine.LNX.4.64.0712100813440.13319@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712100813440.13319@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: fpavlic@de.ibm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jeff Garzik <jgarzik@pobox.com>, netdev@vger.kernel.org

Julia Lawall said the following on 2007-12-10 15:18:
>> Julia, seems that your semantic patch misses following place.
>>
>> drivers/s390/net/qeth_main.c:2733
>> ...
>> #endif
>> 			rxrc = netif_rx(skb);
>> 		card->dev->last_rx = jiffies;
>> 		card->stats.rx_packets++;
>> 		card->stats.rx_bytes += skb->len;
>> ...
> 
> Actually, I found this one as well, but I wasn't sure what to do with it.  
> This one is a bit more complicated because the line with the call to 
> netif_rx is in an else branch if the #ifdef above is taken.  So I wasn't 
> sure what would be the best way to solve the problem in this case.
> 
> Perhaps the solution would be just to save the value of the len field 
> in a local variable in this case, as you proposed in your original patch.
> 

I agree.

BTW, please send driver patch to Jeff Garzik <jgarzik@pobox.com> and
cc to netdev@vger.kernel.org.

--
WCN

