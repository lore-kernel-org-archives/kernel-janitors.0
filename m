From: David Miller <davem@davemloft.net>
Date: Sun, 12 Jul 2020 22:26:10 +0000
Subject: Re: [PATCH] net: skge: switch from 'pci_' to 'dma_' API
Message-Id: <20200712.152610.441299757997798699.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711203518.256545-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200711203518.256545-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: mlindner@marvell.com, stephen@networkplumber.org, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Jul 2020 22:35:18 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GPF_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'skge_up()', GFP_KERNEL can be used because
> some other memory allocations done a few lines below in 'skge_ring_alloc()'
> already use this flag.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
