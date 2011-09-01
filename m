From: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Date: Thu, 01 Sep 2011 09:26:02 +0000
Subject: Re: [patch 1/3 -next] 6LoWPAN: use kfree_skb() instead of kfree()
Message-Id: <CAJmB2rBid27YYT4f6vMtBf9EMFWZQgT=xO85z4OBz326pUT+4A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110830134552.GH3705@shale.localdomain>
	<1314715248.2935.25.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
In-Reply-To: <1314715248.2935.25.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergey Lapin <slapin@ossfans.org>, "David S. Miller" <davem@davemloft.net>, "open list:IEEE 802.15.4 SUB..." <linux-zigbee-devel@lists.sourceforge.net>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan, Eric,

thank you a lot for the finds, that were my faults.

With best regards,
Alexander


2011/8/30 Eric Dumazet <eric.dumazet@gmail.com>:
> Le mardi 30 ao=FBt 2011 =E0 16:45 +0300, Dan Carpenter a =E9crit :
>> Use kfree_skb() to free sbk_buffs.
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>>
>> diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
>> index cf304cc..8a9dbaa 100644
>> --- a/net/ieee802154/6lowpan.c
>> +++ b/net/ieee802154/6lowpan.c
>> @@ -674,7 +674,7 @@ lowpan_process_data(struct sk_buff *skb)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sizeof(hdr));
>> =A0 =A0 =A0 return lowpan_skb_deliver(skb, &hdr);
>> =A0drop:
>> - =A0 =A0 kfree(skb);
>> + =A0 =A0 kfree_skb(skb);
>> =A0 =A0 =A0 return -EINVAL;
>> =A0}
>>
>
> Another bug is the skb_copy() done in lowpan_skb_deliver()
>
> 1) No check of skb_copy() return
>
> 2.1) Use of GFP_KERNEL : Is it safe at this point ? Aren=92t we in
> softirq ?
>
> 2.2) If GFP_KERNEL is safe, why do we later do :
>
> =A0 =A0 =A0 =A0if (in_interrupt())
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stat =3D netif_rx(skb);
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stat =3D netif_rx_ni(skb);
>
>
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
