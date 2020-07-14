From: David Miller <davem@davemloft.net>
Date: Tue, 14 Jul 2020 00:53:30 +0000
Subject: Re: [PATCH] amd8111e: switch from 'pci_' to 'dma_' API
Message-Id: <20200713.175330.150197545165980586.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200713195503.281339-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200713195503.281339-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, leon@kernel.org, natechancellor@gmail.com, snelson@pensando.io, vaibhavgupta40@gmail.com, mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Jul 2020 21:55:03 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GPF_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'amd8111e_init_ring()', GFP_ATOMIC must be used
> because a spin_lock is hold.
> One of the call chains is:
>    amd8111e_open
>    ** spin_lock_irq(&lp->lock);
>    --> amd8111e_restart
>       --> amd8111e_init_ring
>    ** spin_unlock_irq(&lp->lock);
> 
> The rest of the patch is produced by coccinelle with a few adjustments to
> please checkpatch.pl.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.
