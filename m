From: Jingoo Han <jg1.han@samsung.com>
Date: Wed, 14 May 2014 23:08:25 +0000
Subject: Re: [patch] mtd: cfi: indent some if statements
Message-Id: <005301cf6fc9$69236270$3b6a2750$%han@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140514141900.GB18082@mwanda>
In-Reply-To: <20140514141900.GB18082@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, 'David Woodhouse' <dwmw2@infradead.org>
Cc: 'Jingoo Han' <jg1.han@samsung.com>, kernel-janitors@vger.kernel.org, 'Brian Norris' <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org

On Wednesday, May 14, 2014 11:19 PM, Dan Carpenter wrote:
> 
> The break statements should be indented another tab.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
> index 6293855..423666b 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0020.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0020.c
> @@ -961,7 +961,7 @@ static int cfi_staa_erase_varsize(struct mtd_info *mtd,
>  			chipnum++;
> 
>  			if (chipnum >= cfi->numchips)
> -			break;
> +				break;
>  		}
>  	}
> 
> @@ -1170,7 +1170,7 @@ static int cfi_staa_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  			chipnum++;
> 
>  			if (chipnum >= cfi->numchips)
> -			break;
> +				break;
>  		}
>  	}
>  	return 0;
> diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
> index 08049f6..09c79bd 100644
> --- a/drivers/mtd/chips/cfi_util.c
> +++ b/drivers/mtd/chips/cfi_util.c
> @@ -239,7 +239,7 @@ int cfi_varsize_frob(struct mtd_info *mtd, varsize_frob_t frob,
>  			chipnum++;
> 
>  			if (chipnum >= cfi->numchips)
> -			break;
> +				break;
>  		}
>  	}
> 

