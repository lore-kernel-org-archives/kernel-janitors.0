From: Joe Perches <joe@perches.com>
Date: Mon, 27 Jul 2020 16:09:34 +0000
Subject: Re: [PATCH 2/2] media: bt8xx: avoid a useless memset
Message-Id: <0897d9bec8865859694c917f3f72ab8fd12321ff.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mchehab@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2020-07-27 at 15:51 +0200, Christophe JAILLET wrote:
> Avoid a memset after a call to 'dma_alloc_coherent()'.
> This is useless since
> commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")
[]
> diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
[]
> @@ -73,7 +73,6 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
>  		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
>  			memcnt, (unsigned long)dma, cpu, size);
>  	}
> -	memset(risc->cpu,0,risc->size);
>  	return 0;
>  }

Likely NAK.

This is not useless as risc->cpu may be reused
and the alloc may not have been done.
