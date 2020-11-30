From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 30 Nov 2020 18:19:09 +0000
Subject: Re: [PATCH] mlxsw: switch from 'pci_' to 'dma_' API
Message-Id: <35052891-4d32-19f0-e991-2aad009917e9@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201129211733.2913-1-christophe.jaillet@wanadoo.fr>
 <a4fde87f-ea73-8ba4-e6cd-689f0f649eb4@gmail.com>
In-Reply-To: <a4fde87f-ea73-8ba4-e6cd-689f0f649eb4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Heiner Kallweit <hkallweit1@gmail.com>, jiri@nvidia.com, idosch@nvidia.com, davem@davemloft.net, kuba@kernel.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 29/11/2020 à 22:46, Heiner Kallweit a écrit :
> Am 29.11.2020 um 22:17 schrieb Christophe JAILLET:
>> @@ -1817,17 +1817,17 @@ static int mlxsw_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   		goto err_pci_request_regions;
>>   	}
>>   
>> -	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
>> +	err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
> 
> Using dma_set_mask_and_coherent() would be better here.
> 
>>   	if (!err) {
>> -		err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
>> +		err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
>>   		if (err) {
> 
> This check isn't needed, see comment at definition of
> dma_set_mask_and_coherent().
> 

Hi,

Correct, but I didn't want to mix several things in the same commit.
This one is dedicated to automatically generated changes done with 
coccinelle.

I plan to have another set of such clean-ups once "wrappers in 
include/linux/pci-dma-compat.h are gone"

However, if it is prefered to have only one patch, I can resubmit.

CJ
