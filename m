From: walter harms <wharms@bfs.de>
Date: Thu, 20 Jul 2017 07:24:03 +0000
Subject: Re: [PATCH] dmaengine: ioatdma: Fix error handling path in 'ioat_dma_self_test()'
Message-Id: <59705A93.2090305@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170719221648.30253-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170719221648.30253-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dan.j.williams@intel.com, vinod.koul@intel.com, dave.jiang@intel.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 20.07.2017 00:16, schrieb Christophe JAILLET:
> If the 'memcmp' fails, free allocated resources as done in all other
> error handling paths.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Please review carefully, this patch looks "too obvious" to me!
> ---
>  drivers/dma/ioat/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
> index ed8ed1192775..948fc1f8fb5c 100644
> --- a/drivers/dma/ioat/init.c
> +++ b/drivers/dma/ioat/init.c
> @@ -390,7 +390,7 @@ static int ioat_dma_self_test(struct ioatdma_device *ioat_dma)
>  	if (memcmp(src, dest, IOAT_TEST_SIZE)) {
>  		dev_err(dev, "Self-test copy failed compare, disabling\n");
>  		err = -ENODEV;
> -		goto free_resources;
> +		goto unmap_dma;
>  	}
>  
>  unmap_dma:

^^^^^^^^^^


is the goto needed at all ?

re,
 wh
