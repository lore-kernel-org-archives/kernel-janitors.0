From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 28 Jul 2020 08:01:20 +0000
Subject: Re: [PATCH 2/2] media: bt8xx: avoid a useless memset
Message-Id: <b883b856-af1e-a017-6af2-2aca575c24d5@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
 <0897d9bec8865859694c917f3f72ab8fd12321ff.camel@perches.com>
In-Reply-To: <0897d9bec8865859694c917f3f72ab8fd12321ff.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, mchehab@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 27/07/2020 à 18:09, Joe Perches a écrit :
> On Mon, 2020-07-27 at 15:51 +0200, Christophe JAILLET wrote:
>> Avoid a memset after a call to 'dma_alloc_coherent()'.
>> This is useless since
>> commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")
> []
>> diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
> []
>> @@ -73,7 +73,6 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
>>   		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
>>   			memcnt, (unsigned long)dma, cpu, size);
>>   	}
>> -	memset(risc->cpu,0,risc->size);
>>   	return 0;
>>   }
> 
> Likely NAK.
> 
> This is not useless as risc->cpu may be reused
> and the alloc may not have been done.
> 
> 
> 
Agreed.
This 2/2 patch should be NAK'ed.

I've been a bit too fast on this one.
Thanks for the review Joe.

CJ
