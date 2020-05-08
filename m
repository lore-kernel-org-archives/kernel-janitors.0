From: Finn Thain <fthain@telegraphics.com.au>
Date: Fri, 08 May 2020 23:28:38 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <alpine.LNX.2.22.394.2005090919460.8@nippy.intranet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508172557.218132-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200508172557.218132-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On Fri, 8 May 2020, Christophe JAILLET wrote:

> A call to 'dma_alloc_coherent()' is hidden in 
> 'sonic_alloc_descriptors()'.
> 
> This is correctly freed in the remove function, but not in the error 
> handling path of the probe function. Fix it and add the missing 
> 'dma_free_coherent()' call.
> 
> While at it, rename a label in order to be slightly more informative and 
> split some too long lines.
> 
> This patch is similar to commit 10e3cc180e64 ("net/sonic: Fix a resource 
> leak in an error handling path in 'jazz_sonic_probe()'") which was for 
> 'jazzsonic.c'.
> 
> Suggested-by: Finn Thain <fthain@telegraphics.com.au>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks.

Reviewed-by: Finn Thain <fthain@telegraphics.com.au>

> ---
> Only macsonic has been compile tested. I don't have the needed setup to
> compile xtsonic

I compile tested xtsonic.c. I didn't use an xtensa toolchain as there's 
probably no need: the new code already appears elsewhere in that file.
