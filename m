From: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 12 Feb 2015 21:37:40 +0000
Subject: Re: [patch] mtd: hisilicon: && vs & typo
Message-Id: <20150212213740.GA18140@ld-irv-0074>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150211102509.GB18515@mwanda>
In-Reply-To: <20150211102509.GB18515@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Zhou Wang <wangzhou1@hisilicon.com>, David Woodhouse <dwmw2@infradead.org>

Hi,

On Wed, Feb 11, 2015 at 01:25:09PM +0300, Dan Carpenter wrote:
> The intent was to mask away some bits here, not to test true or false.
> 
> Fix: 54f531f6e332 ('mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
> index 484e1db..289ad3a 100644
> --- a/drivers/mtd/nand/hisi504_nand.c
> +++ b/drivers/mtd/nand/hisi504_nand.c
> @@ -495,7 +495,7 @@ static void hisi_nfc_cmdfunc(struct mtd_info *mtd, unsigned command, int column,
>  		flag = hinfc_read(host, HINFC504_CON);
>  		if (chip->ecc.mode = NAND_ECC_HW)
>  			hinfc_write(host,
> -				    flag && ~(HINFC504_CON_ECCTYPE_MASK <<
> +				    flag & ~(HINFC504_CON_ECCTYPE_MASK <<

Looks good to me. Zhou, can I get an ack?

>  				    HINFC504_CON_ECCTYPE_SHIFT), HINFC504_CON);
>  
>  		host->offset = 0;

Brian
