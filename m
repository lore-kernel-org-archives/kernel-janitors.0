From: "Sosnowski, Maciej" <maciej.sosnowski@intel.com>
Date: Wed, 23 Dec 2009 15:08:32 +0000
Subject: RE: [PATCH 1/6] drivers/dma: Correct use after free
Message-Id: <129600E5E5FB004392DDC3FB599660D7CB370DD8@irsmsx504.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912222130370.28669@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912222130370.28669@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "Williams, Dan J" <dan.j.williams@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Move the kfree after the iounmap that refers to the same structure.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,e;
> identifier f;
> iterator I;
> statement S;
> @@
> 
> *kfree(x);
> ... when != &x
>     when != x = e
>     when != I(x,...) S
> *x->f
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/dma/coh901318.c             |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/dma/coh901318.c b/drivers/dma/coh901318.c
> index 4a99cd9..b5f2ee0 100644
> --- a/drivers/dma/coh901318.c
> +++ b/drivers/dma/coh901318.c
> @@ -1294,8 +1294,8 @@ static int __exit coh901318_remove(struct platform_device *pdev)
>  	dma_async_device_unregister(&base->dma_slave);
>  	coh901318_pool_destroy(&base->pool);
>  	free_irq(platform_get_irq(pdev, 0), base);
> -	kfree(base);
>  	iounmap(base->virtbase);
> +	kfree(base);
>  	release_mem_region(pdev->resource->start,
>  			   resource_size(pdev->resource));
>  	return 0;

Acked-by: Maciej Sosnowski <maciej.sosnowski@intel.com>
