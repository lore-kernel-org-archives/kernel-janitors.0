From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Wed, 04 Oct 2017 20:17:26 +0000
Subject: Re: [PATCH 4/5] cris: nand: Delete an unnecessary local variable in crisv32_nand_flash_probe()
Message-Id: <f78d591a-cb83-2443-ac09-81068a62dd2e@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
 <e3759e95-cd25-0272-aea4-8b0f347dbf80@users.sourceforge.net>
In-Reply-To: <e3759e95-cd25-0272-aea4-8b0f347dbf80@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-cris-kernel@axis.com, Boris Brezillon <boris.brezillon@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Krzysztof Halasa <khalasa@piap.pl>, Mikael Starvik <starvik@axis.com>, Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 04/10/17 20:48, SF Markus Elfring wrote:
> The local variable "err" was never read in this function.
> Thus remove it.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  arch/cris/arch-v32/drivers/mach-a3/nandflash.c |  6 +-----
>  arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 10 ++--------
>  2 files changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> index f30579ec8ad7..03a01bfa6ad9 100644
> --- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> +++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> @@ -108,7 +108,6 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
>  
>  	struct mtd_info_wrapper *wrapper;
>  	struct nand_chip *this;
> -	int err = 0;
>  
>  	reg_pio_rw_man_ctrl man_ctrl = {
>  		.regf_NCE = regk_pio_yes,
> @@ -135,10 +134,8 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
>  
>  	/* Allocate memory for MTD device structure and private data */
>  	wrapper = kzalloc(sizeof(*wrapper), GFP_KERNEL);
> -	if (!wrapper) {
> -		err = -ENOMEM;
> +	if (!wrapper)
>  		return NULL;
> -	}
>  
>  	read_cs = write_cs = (void __iomem *)REG_ADDR(pio, regi_pio,
>  		rw_io_access0);
> @@ -162,7 +159,6 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
>  
>  	/* Scan to find existence of the device */
>  	if (nand_scan(crisv32_mtd, 1)) {
> -		err = -ENXIO;
>  		kfree(wrapper);
>  		return NULL;
>  	}
> diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> index 5dfd72a89b8a..2b53f0c615ea 100644
> --- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> +++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> @@ -106,21 +106,17 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
>  	reg_gio_rw_pa_oe pa_oe = REG_RD(gio, regi_gio, rw_pa_oe);
>  	struct mtd_info_wrapper *wrapper;
>  	struct nand_chip *this;
> -	int err = 0;
>  
>  	/* Allocate memory for MTD device structure and private data */
>  	wrapper = kzalloc(sizeof(*wrapper), GFP_KERNEL);
> -	if (!wrapper) {
> -		err = -ENOMEM;
> +	if (!wrapper)
>  		return NULL;
> -	}
>  
>  	read_cs = ioremap(MEM_CSP0_START | MEM_NON_CACHEABLE, 8192);
>  	write_cs = ioremap(MEM_CSP1_START | MEM_NON_CACHEABLE, 8192);
>  
>  	if (!read_cs || !write_cs) {
>  		printk(KERN_ERR "CRISv32 NAND ioremap failed\n");
> -		err = -EIO;
>  		goto out_mtd;
>  	}
>  
> @@ -152,10 +148,8 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
>  	/* this->bbt_options = NAND_BBT_USE_FLASH; */
>  
>  	/* Scan to find existence of the device */
> -	if (nand_scan(crisv32_mtd, 1)) {
> -		err = -ENXIO;
> +	if (nand_scan(crisv32_mtd, 1))
>  		goto out_ior;
> -	}
>  
>  	return crisv32_mtd;
>  
> 
