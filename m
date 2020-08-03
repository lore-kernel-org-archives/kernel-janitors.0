From: David Miller <davem@davemloft.net>
Date: Mon, 03 Aug 2020 23:01:26 +0000
Subject: Re: [PATCH 1/2] net: spider_net: Fix the size used in a 'dma_free_coherent()' call
Message-Id: <20200803.160126.133073905443244906.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802135333.690991-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200802135333.690991-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kou.ishizaki@toshiba.co.jp, kuba@kernel.org, linas@austin.ibm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun,  2 Aug 2020 15:53:33 +0200

> Update the size used in 'dma_free_coherent()' in order to match the one
> used in the corresponding 'dma_alloc_coherent()', in
> 'spider_net_init_chain()'.
> 
> Fixes: d4ed8f8d1fb7 ("Spidernet DMA coalescing")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
