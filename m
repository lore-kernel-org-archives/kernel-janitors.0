From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 08 Feb 2019 09:52:07 +0000
Subject: Re: [PATCH] drm/etnaviv: potential NULL dereference
Message-Id: <CAH9NwWer6CsQCJwWvRRh173UZ_FveVk3dzyotcnsCkx4RBKUVQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190205090816.GA20168@kadam>
In-Reply-To: <20190205090816.GA20168@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, The etnaviv authors <etnaviv@lists.freedesktop.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Russell King <linux+etnaviv@armlinux.org.uk>

Am Di., 5. Feb. 2019 um 10:09 Uhr schrieb Dan Carpenter
<dan.carpenter@oracle.com>:
>
> The etnaviv_gem_prime_get_sg_table() is supposed to return error
> pointers.  Otherwise it can lead to a NULL dereference when it's called
> from drm_gem_map_dma_buf().
>
> Fixes: 5f4a4a73f437 ("drm/etnaviv: fix gem_prime_get_sg_table to return new SG table")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 0566171f8df2..f21529e635e3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -15,7 +15,7 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
>         int npages = obj->size >> PAGE_SHIFT;
>
>         if (WARN_ON(!etnaviv_obj->pages))  /* should have already pinned! */
> -               return NULL;
> +               return ERR_PTR(-EINVAL);
>
>         return drm_prime_pages_to_sg(etnaviv_obj->pages, npages);
>  }
> --
> 2.17.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info
