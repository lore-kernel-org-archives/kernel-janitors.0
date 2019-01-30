From: Liang Yang <liang.yang@amlogic.com>
Date: Wed, 30 Jan 2019 05:20:41 +0000
Subject: Re: [PATCH][next] mtd: rawnand: meson: fix missing assignment of ret on a call to meson_chip_buffer_
Message-Id: <ec92a9c0-8b9f-2551-69a4-72e12b1ce3e2@amlogic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190129105757.19138-1-colin.king@canonical.com>
In-Reply-To: <20190129105757.19138-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Colin,

On 2019/1/29 18:57, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to meson_chip_buffer_init is not assigning ret, however, ret
> is being checked for failure. Fix this by adding in the missing assignment.
> 
ok. thanks for your time.

> Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index e858d58d97b0..b9c543d1054c 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1206,7 +1206,7 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
>   		dev_err(nfc->dev, "16bits bus width not supported");
>   		return -EINVAL;
>   	}
> -	meson_chip_buffer_init(nand);
> +	ret = meson_chip_buffer_init(nand); >   	if (ret)
>   		return -ENOMEM;
>   
> 
