From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 24 Dec 2018 18:11:27 +0000
Subject: Re: [PATCH] drivers/net: appletalk/cops: remove redundant if statement and mask
Message-Id: <8c43fd16-8c73-00b8-7c72-1f3e15a2fdc2@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222165841.18288-1-colin.king@canonical.com>
 <20181224.100836.117884501889550887.davem@davemloft.net>
In-Reply-To: <20181224.100836.117884501889550887.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 24/12/2018 18:08, David Miller wrote:
> From: Colin King <colin.king@canonical.com>
> Date: Sat, 22 Dec 2018 16:58:41 +0000
> 
>> @@ -777,10 +777,7 @@ static void cops_rx(struct net_device *dev)
>>          }
>>  
>>          /* Get response length. */
>> -	if(lp->board=DAYNA)
>> -        	pkt_len = inb(ioaddr) & 0xFF;
>> -	else
>> -		pkt_len = inb(ioaddr) & 0x00FF;
>> +	pkt_len = inb(ioaddr);
> 
> There are other instances of similar weird identical statements guarded
> by the test on the board type being DAYNA.
> 
> For example, in cops_send_packet():
> 
> 	if(lp->board = DAYNA)
>                	outb(skb->len >> 8, ioaddr);
> 	else
> 		outb((skb->len >> 8)&0x0FF, ioaddr);
> 
> Could you scan the rest of the driver and deal with all of these
> instances in one go?

Will do, probably in a day or so.
> 
> Thank you!
> 
