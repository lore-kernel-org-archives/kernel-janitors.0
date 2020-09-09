From: David Miller <davem@davemloft.net>
Date: Wed, 09 Sep 2020 03:17:16 +0000
Subject: Re: [PATCH] hippi: switch from 'pci_' to 'dma_' API
Message-Id: <20200908.201716.965139535841943259.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200908200839.323530-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200908200839.323530-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: jes@trained-monkey.org, kuba@kernel.org, linux-hippi@sunsite.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue,  8 Sep 2020 22:08:39 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'rr_init_one()' GFP_KERNEL can be used because
> it is a probe function and no spinlock is taken in the between.
> 
> When memory is allocated in 'rr_open()' GFP_KERNEL can be used because
> it is a '.ndo_open' function (see struct net_device_ops) and no spinlock is
> taken in the between.
> '.ndo_open' functions are synchronized using the rtnl_lock() semaphore.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
