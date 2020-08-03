From: David Miller <davem@davemloft.net>
Date: Mon, 03 Aug 2020 23:01:06 +0000
Subject: Re: [PATCH] net: sgi: ioc3-eth: Fix the size used in some 'dma_free_coherent()' calls
Message-Id: <20200803.160106.2190172984461163076.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802135204.690832-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200802135204.690832-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: ralf@linux-mips.org, kuba@kernel.org, tbogendoerfer@suse.de, linux-mips@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun,  2 Aug 2020 15:52:04 +0200

> Update the size used in 'dma_free_coherent()' in order to match the one
> used in the corresponding 'dma_alloc_coherent()'.
> 
> Fixes: 369a782af0f1 ("net: sgi: ioc3-eth: ensure tx ring is 16k aligned.")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
