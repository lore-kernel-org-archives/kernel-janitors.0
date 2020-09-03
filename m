From: David Miller <davem@davemloft.net>
Date: Thu, 03 Sep 2020 23:54:32 +0000
Subject: Re: [PATCH RESEND] smsc9420: switch from 'pci_' to 'dma_' API
Message-Id: <20200903.165432.788429825388438913.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200903201055.296320-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200903201055.296320-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, steve.glendinning@shawell.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu,  3 Sep 2020 22:10:55 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'smsc9420_probe()', GFP_KERNEL can be used
> because it is a probe function and no lock is acquired.
> 
> While at it, rewrite the size passed to 'dma_alloc_coherent()' the same way
> as the one passed to 'dma_free_coherent()'. This form is less verbose:
>    sizeof(struct smsc9420_dma_desc) * RX_RING_SIZE +
>    sizeof(struct smsc9420_dma_desc) * TX_RING_SIZE,
> vs
>    sizeof(struct smsc9420_dma_desc) * (RX_RING_SIZE + TX_RING_SIZE)
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
