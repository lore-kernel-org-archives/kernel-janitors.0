From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Wed, 21 Mar 2018 09:03:20 +0000
Subject: Re: [PATCH] mtd: nand: fix return value in nand_erase_nand()
Message-Id: <20180321100320.70d14c17@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180321081014.GC9826@mwanda>
In-Reply-To: <20180321081014.GC9826@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, 21 Mar 2018 11:10:14 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The problem is that "ret" isn't initialized on the success path.
> 
> Fixes: cc4ac09da649 ("mtd: Stop updating erase_info->state and calling mtd_erase_callback()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I squashed those changes into the offending commit.

As usual, thanks for this report (and fix).

Boris

> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 13dd67106859..87b72bf626ae 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4653,6 +4653,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>  		}
>  	}
>  
> +	ret = 0;
>  erase_exit:
>  
>  	/* Deselect and wake up anyone waiting on the device */



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
