From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 01 Jul 2019 07:13:52 +0000
Subject: Re: [PATCH][next] mtd: rawnand: gpmi: remove double assignment to block_size
Message-Id: <20190701091352.3e3caf11@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190604105859.16627-1-colin.king@canonical.com>
In-Reply-To: <20190604105859.16627-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

Hi Colin,

Colin King <colin.king@canonical.com> wrote on Tue,  4 Jun 2019
11:58:59 +0100:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable block_size is being assigned to itself and to
> geo->ecc_chunk_size.  Clean up the double assignment by removing
> the assignment to itself.
> 
> Addresses-Coverity: ("Evaluation order violation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 5db84178edff..334fe3130285 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -1428,7 +1428,7 @@ static void gpmi_bch_layout_std(struct gpmi_nand_data *this)
>  	struct bch_geometry *geo = &this->bch_geometry;
>  	unsigned int ecc_strength = geo->ecc_strength >> 1;
>  	unsigned int gf_len = geo->gf_len;
> -	unsigned int block_size = block_size = geo->ecc_chunk_size;
> +	unsigned int block_size = geo->ecc_chunk_size;
>  
>  	this->bch_flashlayout0 >  		BF_BCH_FLASH0LAYOUT0_NBLOCKS(geo->ecc_chunk_count - 1) |



Applied to nand/next, thanks.

Miquèl


Thanks,
Miquèl
