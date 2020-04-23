From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 23 Apr 2020 20:47:25 +0000
Subject: Re: [PATCH] ipw2x00: Remove a memory allocation failure log message
Message-Id: <3c80ef48-57a8-b414-6cf1-6c255a46f6be@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200423075825.18206-1-christophe.jaillet@wanadoo.fr>
 <5868418d-88b0-3694-2942-5988ab15bdcb@cogentembedded.com>
In-Reply-To: <5868418d-88b0-3694-2942-5988ab15bdcb@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, stas.yakovlev@gmail.com, kvalo@codeaurora.org, davem@davemloft.net
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 23/04/2020 à 11:46, Sergei Shtylyov a écrit :
> Hello!
>
> On 23.04.2020 10:58, Christophe JAILLET wrote:
>
>> Axe a memory allocation failure log message. This message is useless and
>> incorrect (vmalloc is not used here for the memory allocation)
>>
>> This has been like that since the very beginning of this driver in
>> commit 43f66a6ce8da ("Add ipw2200 wireless driver.")
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/net/wireless/intel/ipw2x00/ipw2200.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2200.c 
>> b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
>> index 60b5e08dd6df..30c4f041f565 100644
>> --- a/drivers/net/wireless/intel/ipw2x00/ipw2200.c
>> +++ b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
>> @@ -3770,10 +3770,9 @@ static int ipw_queue_tx_init(struct ipw_priv 
>> *priv,
>>       struct pci_dev *dev = priv->pci_dev;
>>         q->txb = kmalloc_array(count, sizeof(q->txb[0]), GFP_KERNEL);
>> -    if (!q->txb) {
>> -        IPW_ERROR("vmalloc for auxiliary BD structures failed\n");
>> +    if (!q->txb)
>>           return -ENOMEM;
>> -    }
>> +
>
>    No need for this extra empty line.


That's right, sorry about that.

Can it be fixed when/if the patch is applied, or should I send a V2?
If a V2 is required, should kcalloc be used, as pointed out by Joe Perches?
(personally, If the code works fine as-is, I don't think it is required, 
but it can't hurt)

CJ

>
>>         q->bd >>           pci_alloc_consistent(dev, sizeof(q->bd[0]) * count, 
>> &q->q.dma_addr);
>
> MBR, Sergei
>
>
