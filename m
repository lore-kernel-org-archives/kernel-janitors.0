From: Jerome Glisse <j.glisse@gmail.com>
Date: Thu, 08 Dec 2011 15:34:00 +0000
Subject: Re: [patch] drm/ttm: fix condition (and vs or)
Message-Id: <20111208153400.GA3179@homer.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111208065054.GC16735@elgon.mountain>
In-Reply-To: <20111208065054.GC16735@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jerome Glisse <jglisse@redhat.com>, kernel-janitors@vger.kernel.org, Thomas Hellstrom <thellstrom@vmware.com>, dri-devel@lists.freedesktop.org

On Thu, Dec 08, 2011 at 09:50:54AM +0300, Dan Carpenter wrote:
> The "if (!p && !p->dev)" condition isn't right because || was intended
> instead of &&.  But actually, "p" is the list cursor and so it's always
> non-NULL and we can just remove that bit.  We can remove the another
> similar check as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Jerome Glisse <jglisse@redhat.com>
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
> index 6678abc..1cf4c2c 100644
> --- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
> +++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
> @@ -930,10 +930,8 @@ static int ttm_dma_pool_get_num_unused_pages(void)
>  	unsigned total = 0;
>  
>  	mutex_lock(&_manager->lock);
> -	list_for_each_entry(p, &_manager->pools, pools) {
> -		if (p)
> -			total += p->pool->npages_free;
> -	}
> +	list_for_each_entry(p, &_manager->pools, pools)
> +		total += p->pool->npages_free;
>  	mutex_unlock(&_manager->lock);
>  	return total;
>  }
> @@ -1023,7 +1021,7 @@ static int ttm_dma_pool_mm_shrink(struct shrinker *shrink,
>  	list_for_each_entry(p, &_manager->pools, pools) {
>  		unsigned nr_free;
>  
> -		if (!p && !p->dev)
> +		if (!p->dev)
>  			continue;
>  		if (shrink_pages = 0)
>  			break;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
