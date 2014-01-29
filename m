From: Richard Weinberger <richard@nod.at>
Date: Wed, 29 Jan 2014 13:29:27 +0000
Subject: Re: [patch] UBI: fix some use after free bugs
Message-Id: <52E90237.1050005@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140129131756.GC10678@elgon.mountain>
In-Reply-To: <20140129131756.GC10678@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>

Am 29.01.2014 14:17, schrieb Dan Carpenter:
> Move the kmem_cache_free() calls down a couple lines.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for fixing this Dan!

Acked-by: Richard Weinberger <richard@nod.at>

> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index ead861307b3c..c5dad652614d 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -463,8 +463,8 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  				}
>  			}
>  			if (found_orphan) {
> -				kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
>  				list_del(&tmp_aeb->u.list);
> +				kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
>  			}
>  
>  			new_aeb = kmem_cache_alloc(ai->aeb_slab_cache,
> @@ -846,16 +846,16 @@ fail_bad:
>  	ret = UBI_BAD_FASTMAP;
>  fail:
>  	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list) {
> -		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
>  		list_del(&tmp_aeb->u.list);
> +		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
>  	}
>  	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &eba_orphans, u.list) {
> -		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
>  		list_del(&tmp_aeb->u.list);
> +		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
>  	}
>  	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
> -		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
>  		list_del(&tmp_aeb->u.list);
> +		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
>  	}
>  
>  	return ret;
> 
