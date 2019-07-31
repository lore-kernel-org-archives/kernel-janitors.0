From: David Miller <davem@davemloft.net>
Date: Wed, 31 Jul 2019 15:36:52 +0000
Subject: Re: [PATCH] net: ethernet: et131x: Use GFP_KERNEL instead of GFP_ATOMIC when allocating tx_ring->tcb
Message-Id: <20190731.083652.764868636947922667.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731073842.16948-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190731073842.16948-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: mark.einon@gmail.com, willy@infradead.org, f.fainelli@gmail.com, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 31 Jul 2019 09:38:42 +0200

> There is no good reason to use GFP_ATOMIC here. Other memory allocations
> are performed with GFP_KERNEL (see other 'dma_alloc_coherent()' below and
> 'kzalloc()' in 'et131x_rx_dma_memory_alloc()')
> 
> Use GFP_KERNEL which should be enough.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.
