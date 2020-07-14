From: David Miller <davem@davemloft.net>
Date: Tue, 14 Jul 2020 20:48:38 +0000
Subject: Re: [PATCH] lan743x: switch from 'pci_' to 'dma_' API
Message-Id: <20200714.134838.855399731021149194.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714075224.290759-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200714075224.290759-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 14 Jul 2020 09:52:24 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GPF_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'lan743x_tx_ring_cleanup()' and
> 'lan743x_rx_ring_init()', GFP_KERNEL can be used because this flag is
> already used to allocate some memory in these functions.
> 
> While at it, remove a useless (void *) casting in the first hunk in so that
> the code is more consistent.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Appied to net-next, thank you.
