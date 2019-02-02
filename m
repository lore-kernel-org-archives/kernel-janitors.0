From: Liang Yang <liang.yang@amlogic.com>
Date: Sat, 02 Feb 2019 03:01:45 +0000
Subject: Re: [PATCH 2/3] mtd: rawnand: meson: fix a loop in meson_nand_bch_mode()
Message-Id: <6afa6288-cbad-9d43-002a-5f44348e9e1a@amlogic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190201083009.GD8459@kadam>
In-Reply-To: <20190201083009.GD8459@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>


On 2019/2/1 16:30, Dan Carpenter wrote:
> There is a sizeof() vs ARRAY_SIZE() bug here.  We want the number of
> elements in the array, not the number of bytes.  It means we potentially
> read beyond the end of the array.
> 
> Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 94c90be7e1e0..0d93d0b9c1af 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1143,7 +1143,7 @@ static int meson_nand_bch_mode(struct nand_chip *nand)
>   	if (nand->ecc.strength > 60 || nand->ecc.strength < 8)
>   		return -EINVAL;
>   
> -	for (i = 0; i < sizeof(meson_ecc); i++) {
> +	for (i = 0; i < ARRAY_SIZE(meson_ecc); i++) {

ok.

Acked-by: Liang Yang <liang.yang@amlogic.com>

>   		if (meson_ecc[i].strength = nand->ecc.strength) {
>   			meson_chip->bch_mode = meson_ecc[i].bch;
>   			return 0;
> 
