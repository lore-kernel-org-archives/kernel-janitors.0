From: walter harms <wharms@bfs.de>
Date: Thu, 15 Aug 2019 10:35:49 +0000
Subject: Re: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
Message-Id: <5D553585.2020907@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815083252.GD27238@mwanda>
In-Reply-To: <20190815083252.GD27238@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@microchip.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>



Am 15.08.2019 10:32, schrieb Dan Carpenter:
> The problem is that if "ret" is negative then when we check if
> "ret > len", that condition is going to be true because of type
> promotion.  So this patch re-orders the code to check for negatives
> first and preserve those error codes.
> 
> Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 63af87609bac..986b0754495d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2903,10 +2903,10 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
>  
>  	while (len) {
>  		ret = spi_nor_read_data(nor, addr, len, buf);
> -		if (!ret || ret > len)
> -			return -EIO;
>  		if (ret < 0)
>  			return ret;
> +		if (!ret || ret > len)
> +			return -EIO;

Bonuspoints to make this more readable:

	if (ret=0 || ret > len)
		return -EIO;

that makes the intention more obvious.

JM2C,
 wh

>  
>  		buf += ret;
>  		addr += ret;
