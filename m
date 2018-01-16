From: walter harms <wharms@bfs.de>
Date: Tue, 16 Jan 2018 11:06:08 +0000
Subject: Re: [PATCH][next] mtd: nand: fix spelling mistake: "suceed"-> "succeed"
Message-Id: <5A5DDCA0.1000908@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180116102808.23232-1-colin.king@canonical.com>
In-Reply-To: <20180116102808.23232-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Colin King <colin.king@canonical.com>, Miquel Raynal <miquel.raynal@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org



Am 16.01.2018 11:28, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistakes in dev_err error message text.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/nand/marvell_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_nand.c
> index b8fec6093b75..4bd53b360277 100644
> --- a/drivers/mtd/nand/marvell_nand.c
> +++ b/drivers/mtd/nand/marvell_nand.c
> @@ -517,7 +517,7 @@ static int marvell_nfc_prepare_cmd(struct nand_chip *chip)
>  	/* Poll ND_RUN and clear NDSR before issuing any command */
>  	ret = marvell_nfc_wait_ndrun(chip);
>  	if (ret) {
> -		dev_err(nfc->dev, "Last operation did not suceed\n");
> +		dev_err(nfc->dev, "Last operation did not succeed\n");
>  		return ret;
>  	}
>  

not succeed = Failed ??
someone who is debugging may also interessted to know what operation failed.

just my 2 cents,
 wh



