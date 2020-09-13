From: David Miller <davem@davemloft.net>
Date: Sun, 13 Sep 2020 01:27:30 +0000
Subject: Re: [PATCH] net: tehuti: switch from 'pci_' to 'dma_' API
Message-Id: <20200912.182730.2087461920010304478.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200912141232.343630-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200912141232.343630-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, andy@greyhouse.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 12 Sep 2020 16:12:32 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'bdx_fifo_init()' GFP_ATOMIC must be used
> because it can be called from a '.ndo_set_rx_mode' function. Such functions
> hold the 'netif_addr_lock' spinlock.
> 
>   .ndo_set_rx_mode              (see struct net_device_ops)
>     --> bdx_change_mtu
>       --> bdx_open
>         --> bdx_rx_init
>         --> bdx_tx_init
>           --> bdx_fifo_init
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
