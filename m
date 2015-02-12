From: Richard Weinberger <richard@nod.at>
Date: Thu, 12 Feb 2015 22:35:01 +0000
Subject: Re: [patch] UBI: block: checking for NULL instead of IS_ERR()
Message-Id: <54DD2A95.3090702@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150205073819.GB27855@mwanda>
In-Reply-To: <20150205073819.GB27855@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

Am 05.02.2015 um 08:38 schrieb Dan Carpenter:
> We recently switched from allocating ->rq using blk_init_queue() to
> use blk_mq_init_queue() so we need to update the error handling to
> check for IS_ERR() instead of NULL.
> 
> Fixes: ff1f48ee3bb3 ('UBI: Block: Add blk-mq support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index 995e61c..d0a9349 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -409,9 +409,9 @@ int ubiblock_create(struct ubi_volume_info *vi)
>  	}
>  
>  	dev->rq = blk_mq_init_queue(&dev->tag_set);
> -	if (!dev->rq) {
> +	if (IS_ERR(dev->rq)) {
>  		dev_err(disk_to_dev(gd), "blk_mq_init_queue failed");
> -		ret = -ENODEV;
> +		ret = PTR_ERR(dev->rq);
>  		goto out_free_tags;
>  	}
>  	blk_queue_max_segments(dev->rq, UBI_MAX_SG_COUNT);

Applied. Thanks Dan!
