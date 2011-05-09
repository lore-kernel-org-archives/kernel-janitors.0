From: Julia Lawall <julia@diku.dk>
Date: Mon, 09 May 2011 14:32:41 +0000
Subject: Re: [PATCH] drivers/mmc/card/block.c: fix potential null dereference
Message-Id: <Pine.LNX.4.64.1105091631400.15483@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4DC7F4AB.90607@gmail.com>
In-Reply-To: <4DC7F4AB.90607@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Motyka <vladimir.motyka@gmail.com>
Cc: cjb@laptop.org, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 9 May 2011, Vladimir Motyka wrote:

> When allocation of idata fails there was a null dereferece.

Why not have a different label for the two cases?  That would make the 
code easier to statically analyze, and perhaps be more understandable as 
well.

julia


> Signed-off-by: Vladimir Motyka <vladimir.motyka@gmail.com>
> 
> ---
> diff --git a/drivers/mmc/card/block.c b/drivers/mmc/card/block.c
> index 407836d..3dec493 100644
> --- a/drivers/mmc/card/block.c
> +++ b/drivers/mmc/card/block.c
> @@ -266,10 +266,10 @@ static struct mmc_blk_ioc_data
> *mmc_blk_ioctl_copy_from_user(
>  	return idata;
> 
>  copy_err:
> -	kfree(idata->buf);
> +	if(idata)
> +		kfree(idata->buf);
>  	kfree(idata);
>  	return ERR_PTR(err);
> -
>  }
> 
>  static int mmc_blk_ioctl_cmd(struct block_device *bdev,
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
