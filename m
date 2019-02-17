From: Vignesh R <vigneshr@ti.com>
Date: Sun, 17 Feb 2019 05:40:10 +0000
Subject: Re: [PATCH][next] mtd: spi-nor: cadence-quadspi: fix spelling mistake: "Couldnt't" -> "Couldn't"
Message-Id: <6eb58a44-fba9-3beb-f36a-00242e6b7e29@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190215151547.17532-1-colin.king@canonical.com>
In-Reply-To: <20190215151547.17532-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 15/02/19 8:45 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 56512c0368f9..792628750eec 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -1249,7 +1249,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  
>  	ddata = of_device_get_match_data(dev);
>  	if (!ddata) {
> -		dev_err(dev, "Couldnt't find driver data\n");
> +		dev_err(dev, "Couldn't find driver data\n");
>  		return -EINVAL;
>  	}
>  	hwcaps.mask = ddata->hwcaps_mask;
> 

Oops, my bad.. Thanks for fixing this!


-- 
Regards
Vignesh
