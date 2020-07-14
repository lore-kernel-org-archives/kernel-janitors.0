From: David Miller <davem@davemloft.net>
Date: Tue, 14 Jul 2020 00:54:54 +0000
Subject: Re: [PATCH] pcnet32: switch from 'pci_' to 'dma_' API
Message-Id: <20200713.175454.2187017553694804805.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200713201846.282847-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200713201846.282847-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: pcnet32@frontier.com, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Jul 2020 22:18:45 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GPF_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'pcnet32_realloc_tx_ring()' and
> 'pcnet32_realloc_rx_ring()', GFP_ATOMIC must be used because a spin_lock is
> hold.
> The call chain is:
>    pcnet32_set_ringparam
>    ** spin_lock_irqsave(&lp->lock, flags);
>    --> pcnet32_realloc_tx_ring
>    --> pcnet32_realloc_rx_ring
>    ** spin_unlock_irqrestore(&lp->lock, flags);
> 
> When memory is in 'pcnet32_probe1()' and 'pcnet32_alloc_ring()', GFP_KERNEL
> can be used.
> 
> While at it, update a few comments and pr_err messages to be more in line
> with the new function names.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.
