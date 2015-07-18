From: Malcolm Priestley <malcolmpriestley@gmail.com>
Date: Sat, 18 Jul 2015 12:32:10 +0000
Subject: Re: [patch 2/2] Staging: rtl8192e: pointer math bug in rtllib_rx_DELBA()
Message-Id: <55AA474A.3000206@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150717092425.GA3060@mwanda>
In-Reply-To: <20150717092425.GA3060@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 18/07/15 09:09, Dan Carpenter wrote:
> On Fri, Jul 17, 2015 at 10:17:40PM +0200, Mateusz Kulikowski wrote:
>>> diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
>>> index 60f536c..98e6c4e 100644
>>> --- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
>>> +++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
>>> @@ -453,7 +453,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
>>>   #endif
>>>   	delba = (struct rtllib_hdr_3addr *)skb->data;
>>>   	dst = (u8 *)(&delba->addr2[0]);
>>> -	delba += sizeof(struct rtllib_hdr_3addr);
>>> +	delba++;
>>>   	pDelBaParamSet = (union delba_param_set *)(delba+2);
>>>   	pReasonCode = (u16 *)(delba+4);
>>>
>>>
>>
>> Ack/+1,
>>
>> It's not the last fix for 'delba' unfortunately :(
>>
>> Next lines should use delba as u8 if I see correctly
>> See rtllib_DELBA() (line 141) - It first fills skb with rtllib_hdr_3_addr,
>> and then adds skb delbaparam_set and reasonCode (as a 6 bytes).
>> Or I'm tired - will re-check tomorrow.
>
> All this pointer math would have worked if "delba" were a void pointer,
> but that's a bit ugly.  Anyway, I'll send a proper fix for this.
Looks like it should be u8.

This is a complete hash of modifying a 3 address header.

However, in kernel struct ieee80211_mgmt has a delba entry to replace 
the entire header.

Regards


Malcolm
