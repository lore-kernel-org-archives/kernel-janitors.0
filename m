From: David Miller <davem@davemloft.net>
Date: Mon, 27 Apr 2020 19:08:00 +0000
Subject: Re: [PATCH] net/sonic: Fix a resource leak in an error handling path in 'jazz_sonic_probe()'
Message-Id: <20200427.120800.2048743248471906857.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427061803.53857-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200427061803.53857-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: fthain@telegraphics.com.au, tsbogend@alpha.franken.de, jgarzik@pobox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 27 Apr 2020 08:18:03 +0200

> A call to 'dma_alloc_coherent()' is hidden in 'sonic_alloc_descriptors()',
> called from 'sonic_probe1()'.
> 
> This is correctly freed in the remove function, but not in the error
> handling path of the probe function.
> Fix it and add the missing 'dma_free_coherent()' call.
> 
> While at it, rename a label in order to be slightly more informative.
> 
> Fixes: efcce839360f ("[PATCH] macsonic/jazzsonic network drivers update")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.
