From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Mon, 05 Nov 2018 23:00:59 +0000
Subject: Re: [PATCH] mtd: spi-nor: cadence-quadspi: Fix the return value in case of error in 'cqspi_direct_re
Message-Id: <20181106000059.4cc1d10e@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181016071346.25383-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181016071346.25383-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 16 Oct 2018 09:13:46 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> We return 0 unconditionally in 'cqspi_direct_read_execute()'.
> However, 'ret' is set to some error codes in several error handling paths.
> 
> Return 'ret' instead to propagate the error code.
> 
> Fixes: ffa639e069fb ("mtd: spi-nor: cadence-quadspi: Add DMA support for direct mode reads")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Queued to the fixes branch after adjusting the subject to make it
shorter and adding a Cc-stable tag.

Thanks,

Boris

> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 8e714fbfa521..6e9cbd1a0b6d 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -996,7 +996,7 @@ static int cqspi_direct_read_execute(struct spi_nor *nor, u_char *buf,
>  err_unmap:
>  	dma_unmap_single(nor->dev, dma_dst, len, DMA_DEV_TO_MEM);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static ssize_t cqspi_read(struct spi_nor *nor, loff_t from,
