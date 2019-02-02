From: Liang Yang <liang.yang@amlogic.com>
Date: Sat, 02 Feb 2019 03:01:10 +0000
Subject: Re: [PATCH 1/3] mtd: rawnand: meson: Fix a limit test in meson_nfc_select_chip()
Message-Id: <8e85966c-bb40-6063-18c9-451735ad1ab3@amlogic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190201082922.GC8459@kadam>
In-Reply-To: <20190201082922.GC8459@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

Hi Dan,

On 2019/2/1 16:29, Dan Carpenter wrote:
> This test is off by one because the > should be >= and it's also testing
> against the wrong limit.  The MAX_CE_NUM is the maximum size that
> meson_chip->sels[] is allowed to be but meson_chip->nsels is the actual
> size.
> 
> Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller ")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index e858d58d97b0..94c90be7e1e0 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -225,7 +225,7 @@ static void meson_nfc_select_chip(struct nand_chip *nand, int chip)
>   	struct meson_nfc *nfc = nand_get_controller_data(nand);
>   	int ret, value;
>   
> -	if (chip < 0 || WARN_ON_ONCE(chip > MAX_CE_NUM))
> +	if (chip < 0 || WARN_ON_ONCE(chip >= meson_chip->nsels))
>   		return;
>  
Thank you.

Acked-by: Liang Yang <liang.yang@amlogic.com>

>   	nfc->param.chip_select = meson_chip->sels[chip] ? NAND_CE1 : NAND_CE0;
> 
