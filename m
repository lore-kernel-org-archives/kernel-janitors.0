From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Tue, 11 Apr 2017 11:36:59 +0000
Subject: Re: [PATCH] mtd: nand: NULL terminate a of_device_id table
Message-Id: <20170411133659.7312a443@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170411052252.20656-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170411052252.20656-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: richard@nod.at, nicolas.ferre@microchip.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 11 Apr 2017 07:22:52 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> of_device_id tables should be NULL terminated.
> 
> Fixes: 07b23e3db9ed ("mtd: nand: Cleanup/rework the atmel_nand driver")

Applied.

Thanks,

Boris

> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mtd/nand/atmel/nand-controller.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
> index 27301603f394..af9dd0e04261 100644
> --- a/drivers/mtd/nand/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/atmel/nand-controller.c
> @@ -1636,6 +1636,7 @@ static const struct of_device_id atmel_matrix_of_ids[] = {
>  		.compatible = "atmel,at91sam9x5-matrix",
>  		.data = (void *)AT91SAM9X5_MATRIX_EBICSA,
>  	},
> +	{ /* sentinel */ },
>  };
>  
>  static int atmel_nand_controller_init(struct atmel_nand_controller *nc,

