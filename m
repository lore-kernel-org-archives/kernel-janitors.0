From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Mon, 04 Jul 2016 12:42:07 +0000
Subject: Re: [patch] mtd: nand: sunxi: prevent a small memory leak
Message-Id: <20160704144207.369cdd48@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160624122403.GC23169@mwanda>
In-Reply-To: <20160624122403.GC23169@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

On Fri, 24 Jun 2016 15:24:03 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> I moved the sanity check on ecc->size before the allocation so that we
> don't leak memory on error.
> 
> Fixes: 05af074a4b73 ('mtd: nand: sunxi: check ecc->size values')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,

Boris

> 
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index f582fe4..9f4e1c7 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -1812,13 +1812,13 @@ static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
>  	int ret;
>  	int i;
>  
> +	if (ecc->size != 512 && ecc->size != 1024)
> +		return -EINVAL;
> +
>  	data = kzalloc(sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>  
> -	if (ecc->size != 512 && ecc->size != 1024)
> -		return -EINVAL;
> -
>  	/* Prefer 1k ECC chunk over 512 ones */
>  	if (ecc->size = 512 && mtd->writesize > 512) {
>  		ecc->size = 1024;

