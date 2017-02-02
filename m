From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Date: Thu, 02 Feb 2017 09:47:24 +0000
Subject: Re: [PATCH] mtd: spi-nor: cqspi: remove redundant dead code on error return check
Message-Id: <5b9ebe65-d572-0162-3984-8e7a7800148d@atmel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170131155317.20106-1-colin.king@canonical.com>
In-Reply-To: <20170131155317.20106-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Le 31/01/2017 à 16:53, Colin King a écrit :
> From: Colin Ian King <colin.king@canonical.com>
> 
> Checking for ret < 0 is redundant because a previous check on ret
> being non-zero already handles the ret < 0 case. Remove the redundant
> code. Found by CoverityScan, CID#1398863, CID#1398864
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to the github spi-nor tree.

Thanks!
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 3fb7be8..9f8102d 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -893,7 +893,7 @@ static ssize_t cqspi_write(struct spi_nor *nor, loff_t to,
>  	if (ret)
>  		return ret;
>  
> -	return (ret < 0) ? ret : len;
> +	return len;
>  }
>  
>  static ssize_t cqspi_read(struct spi_nor *nor, loff_t from,
> @@ -913,7 +913,7 @@ static ssize_t cqspi_read(struct spi_nor *nor, loff_t from,
>  	if (ret)
>  		return ret;
>  
> -	return (ret < 0) ? ret : len;
> +	return len;
>  }
>  
>  static int cqspi_erase(struct spi_nor *nor, loff_t offs)
> 

