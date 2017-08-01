From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Date: Tue, 01 Aug 2017 16:33:17 +0000
Subject: Re: [PATCH][mtd-next] mtd: spi-nor: remove redundant check on err
Message-Id: <e9fe2e63-aadf-d9cf-e7b1-dc7149677600@wedev4u.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170629175054.12231-1-colin.king@canonical.com>
In-Reply-To: <20170629175054.12231-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

Le 29/06/2017 à 19:50, Colin King a écrit :
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is not updated since the previous check on it, so
> the subsequent check on err is redundant and can be removed.
> 
> Detected by CoverityScan, CID#1448658 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 196b52f083ae..1296c1931591 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2307,9 +2307,6 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  		default:
>  			break;
>  		}
> -
> -		if (err)
> -			goto exit;

Sorry but this was done on purpose to prepare the structure of the
source code so it's more easy to add later parsing of optional SFDP
tables such as the 4-byte address instruction set table or sector erase
map table.
At that time each case of the switch statement should update the value
of 'err'.

Best regards,

Cyrille
>  	}
>  
>  exit:
> 

