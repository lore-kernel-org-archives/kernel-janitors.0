From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Mon, 15 May 2017 20:45:44 +0000
Subject: Re: [PATCH] mtd: nand: make nand_ooblayout_lp_hamming_ops static
Message-Id: <20170515224544.221974bc@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170504121100.2709-1-colin.king@canonical.com>
In-Reply-To: <20170504121100.2709-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu,  4 May 2017 13:11:00 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> nand_ooblayout_lp_hamming_ops can be made static as it does not need to be
> in global scope.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to nand/fixes.

Thanks,

Boris

> ---
>  drivers/mtd/nand/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d474378ed810..d3a735012b81 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -202,7 +202,7 @@ static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int section,
>  	return 0;
>  }
>  
> -const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
> +static const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
>  	.ecc = nand_ooblayout_ecc_lp_hamming,
>  	.free = nand_ooblayout_free_lp_hamming,
>  };

