From: David Miller <davem@davemloft.net>
Date: Tue, 25 Aug 2020 00:56:37 +0000
Subject: Re: [PATCH] chelsio: switch from 'pci_' to 'dma_' API
Message-Id: <20200824.175637.805257656507953369.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200823083648.171858-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200823083648.171858-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, leon@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 23 Aug 2020 10:36:48 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'free_rx_resources()' and
> 'alloc_tx_resources()' (sge.c) GFP_KERNEL can be used because it is
> already used in these functions.
> 
> Moreover, they can only be called from a .ndo_open	function. So it is
> guarded by the 'rtnl_lock()', which is a mutex.
> 
> While at it, a pr_err message in 'init_one()' has been updated accordingly
> (s/consistent/coherent).
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.
