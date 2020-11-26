From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 26 Nov 2020 18:25:20 +0000
Subject: Re: [PATCH] crypto: qat - Use dma_set_mask_and_coherent to simplify code
Message-Id: <f8d556f4-75da-7daf-a4af-8335788ff4a1@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201121071359.1320167-1-christophe.jaillet@wanadoo.fr>
 <20201126120408.GA21666@silpixa00400314>
In-Reply-To: <20201126120408.GA21666@silpixa00400314>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 26/11/2020 à 13:04, Giovanni Cabiddu a écrit :
> Hi Christophe,
> 
> On Sat, Nov 21, 2020 at 07:13:59AM +0000, Christophe JAILLET wrote:
>> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
>> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.
>>
>> While at it, also remove some unless extra () in the 32 bits case.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Instead of returning -EFAULT, we could also propagate the error returned
>> by dma_set_mask_and_coherent()
> I'm going to re-submit implementing the comment above and also including
> qat_4xxx.
> 
> Regards,
> 

Sure,
sorry for missing this one.

CJ
