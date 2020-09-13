From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 13 Sep 2020 10:45:16 +0000
Subject: Re: [PATCH] net: dl2k: switch from 'pci_' to 'dma_' API
Message-Id: <8c2b1241-6b70-0837-3f03-f72e4bbdd165@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200913061417.347682-1-christophe.jaillet@wanadoo.fr>
 <20200913065559.GB35718@unreal>
In-Reply-To: <20200913065559.GB35718@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Leon Romanovsky <leon@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, snelson@pensando.io, jeffrey.t.kirsher@intel.com, mhabets@solarflare.com, yuehaibing@huawei.com, mchehab+huawei@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 13/09/2020 à 08:55, Leon Romanovsky a écrit :
> On Sun, Sep 13, 2020 at 08:14:17AM +0200, Christophe JAILLET wrote:
 > [...]
>> @@ -504,9 +510,8 @@ static int alloc_list(struct net_device *dev)
>>   						sizeof(struct netdev_desc));
>>   		/* Rubicon now supports 40 bits of addressing space. */
>>   		np->rx_ring[i].fraginfo >> -		    cpu_to_le64(pci_map_single(
>> -				  np->pdev, skb->data, np->rx_buf_sz,
>> -				  PCI_DMA_FROMDEVICE));
>> +		    cpu_to_le64(dma_map_single(&np->pdev->dev, skb->data,
>> +					       np->rx_buf_sz, DMA_FROM_DEVICE));
> 
> I'm aware that this was before, but both pci_map_single and
> dma_map_single return an ERROR and it is wrong to set .fraginfo without
> checking result.
> 
> Thanks
> 
Hi,

Nice catch.

I'll try to send patches for such patterns as some follow-ups.
It can be found in several drivers.

But anyone who want to fix it faster than me is welcome ;-)

CJ
