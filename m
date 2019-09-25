From: Stefan Schmidt <stefan@datenfreihafen.org>
Date: Wed, 25 Sep 2019 06:25:35 +0000
Subject: Re: [PATCH] ieee802154: mcr20a: simplify a bit 'mcr20a_handle_rx_read_buf_complete()'
Message-Id: <7d131e76-d487-ead3-1780-6a9a7d7877a4@datenfreihafen.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190920194533.5886-1-christophe.jaillet@wanadoo.fr>
 <388f335a-a9ae-7230-1713-a1ecb682fecf@datenfreihafen.org>
 <CAJuUDwtWJgo7PHJR4kBpQ9mGamTMEaPZBNOZcL3mWFwwZ-zOmw@mail.gmail.com>
In-Reply-To: <CAJuUDwtWJgo7PHJR4kBpQ9mGamTMEaPZBNOZcL3mWFwwZ-zOmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xue Liu <liuxuenetmail@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "alex. aring" <alex.aring@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-wpan - ML <linux-wpan@vger.kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello.

On 24.09.19 23:40, Xue Liu wrote:
> On Sat, 21 Sep 2019 at 13:52, Stefan Schmidt <stefan@datenfreihafen.org> wrote:
>>
>> Hello Xue.
>>
>> On 20.09.19 21:45, Christophe JAILLET wrote:
>>> Use a 'skb_put_data()' variant instead of rewritting it.
>>> The __skb_put_data variant is safe here. It is obvious that the skb can
>>> not overflow. It has just been allocated a few lines above with the same
>>> 'len'.
>>>
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>>   drivers/net/ieee802154/mcr20a.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/ieee802154/mcr20a.c b/drivers/net/ieee802154/mcr20a.c
>>> index 17f2300e63ee..8dc04e2590b1 100644
>>> --- a/drivers/net/ieee802154/mcr20a.c
>>> +++ b/drivers/net/ieee802154/mcr20a.c
>>> @@ -800,7 +800,7 @@ mcr20a_handle_rx_read_buf_complete(void *context)
>>>        if (!skb)
>>>                return;
>>>
>>> -     memcpy(skb_put(skb, len), lp->rx_buf, len);
>>> +     __skb_put_data(skb, lp->rx_buf, len);
>>>        ieee802154_rx_irqsafe(lp->hw, skb, lp->rx_lqi[0]);
>>>
>>>        print_hex_dump_debug("mcr20a rx: ", DUMP_PREFIX_OFFSET, 16, 1,
>>>
>>
>> Could you please review and ACK this? If you are happy I will take it
>> through my tree.
>>
>> regards
>> Stefan Schmidt
> 
> Acked-by: Xue Liu <liuxuenetmail@gmail.com>


This patch has been applied to the wpan tree and will be
part of the next pull request to net. Thanks!

regards
Stefan Schmidt
