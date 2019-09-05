From: maowenan <maowenan@huawei.com>
Date: Thu, 05 Sep 2019 00:56:34 +0000
Subject: Re: [PATCH net] net: sonic: remove dev_kfree_skb before return NETDEV_TX_BUSY
Message-Id: <960c7d1f-6e80-84fb-8d7a-9c5692605500@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904094211.117454-1-maowenan@huawei.com>
 <c4a4d1b0-d036-7af7-2b30-117f9fdee9ad@gmail.com>
In-Reply-To: <c4a4d1b0-d036-7af7-2b30-117f9fdee9ad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <eric.dumazet@gmail.com>, tsbogend@alpha.franken.de, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2019/9/4 18:19, Eric Dumazet wrote:
> 
> 
> On 9/4/19 11:42 AM, Mao Wenan wrote:
>> When dma_map_single is failed to map buffer, skb can't be freed
>> before sonic driver return to stack with NETDEV_TX_BUSY, because
>> this skb may be requeued to qdisc, it might trigger use-after-free.
>>
>> Fixes: d9fb9f384292 ("*sonic/natsemi/ns83829: Move the National Semi-conductor drivers")
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>> ---
>>  drivers/net/ethernet/natsemi/sonic.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/natsemi/sonic.c b/drivers/net/ethernet/natsemi/sonic.c
>> index d0a01e8f000a..248a8f22a33b 100644
>> --- a/drivers/net/ethernet/natsemi/sonic.c
>> +++ b/drivers/net/ethernet/natsemi/sonic.c
>> @@ -233,7 +233,6 @@ static int sonic_send_packet(struct sk_buff *skb, struct net_device *dev)
>>  	laddr = dma_map_single(lp->device, skb->data, length, DMA_TO_DEVICE);
>>  	if (!laddr) {
>>  		printk(KERN_ERR "%s: failed to map tx DMA buffer.\n", dev->name);
>> -		dev_kfree_skb(skb);
>>  		return NETDEV_TX_BUSY;
>>  	}
>>  
>>
> 
> That is the wrong way to fix this bug.
> 
> What guarantee do we have that the mapping operation will succeed next time we attempt
> the transmit (and the dma_map_single() operation) ?
> 
> NETDEV_TX_BUSY is very dangerous, this might trigger an infinite loop.
> 
> I would rather leave the dev_kfree_skb(skb), and return NETDEV_TX_OK
yes, right, it will go to infinite loop if dma_map_single failed always.
v2 will be sent later.
> 
> Also the printk(KERN_ERR ...) should be replaced by pr_err_ratelimited(...)
> 
> NETDEV_TX_BUSY really should only be used by drivers that call netif_tx_stop_queue()
> at the wrong moment.
It will call netif_tx_stop_queue() then return NETDEV_TX_BUSY, and give a chance to
netif_tx_wake_queue(), then stack can be resent packet to driver?

> 
> .
> 
