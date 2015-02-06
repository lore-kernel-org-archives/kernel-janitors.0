From: David Miller <davem@davemloft.net>
Date: Fri, 06 Feb 2015 20:50:27 +0000
Subject: Re: [patch] net: sxgbe: fix error handling in init_rx_ring()
Message-Id: <20150206.125027.797640169824978113.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150116071229.GH5520@mwanda>
	<20150205080042.GC27855@mwanda>
In-Reply-To: <20150205080042.GC27855@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: bh74.an@samsung.com, kgene@kernel.org, ks.giri@samsung.com, vipul.pandya@samsung.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 5 Feb 2015 11:00:42 +0300

> There are a couple bugs with the error handling in this function.
> 
> 1) If we can't allocate "rx_ring->rx_skbuff" then we should call
>    dma_free_coherent() but we don't.
> 2) free_rx_ring() frees "rx_ring->rx_skbuff_dma" and "rx_ring->rx_skbuff"
>    so calling it in a loop causes a double free.
> 
> Also it was a bit confusing how we sometimes freed things before doing
> the goto.  I've cleaned it up so it does error handling in normal kernel
> style.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good, applied, thanks Dan.
