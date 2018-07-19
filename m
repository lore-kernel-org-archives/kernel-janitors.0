From: Oleksandr Andrushchenko <andr2000@gmail.com>
Date: Thu, 19 Jul 2018 09:06:38 +0000
Subject: Re: [PATCH] drm/xen-front: Fix error code in xen_drm_front_gem_get_sg_table()
Message-Id: <b8154096-3a43-cca1-316e-4d60d69ee9ab@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180719081133.k7asay4fl2qhhpjf@mwanda>
In-Reply-To: <20180719081133.k7asay4fl2qhhpjf@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org

Hi, Dan!

Thank you for the patch and sorry I was clumsy sending v3.

Do you want me to send v3 now with the fixes for both Xen and CMA?

Thank you,

Oleksandr


On 07/19/2018 11:11 AM, Dan Carpenter wrote:
> The xen_drm_front_gem_get_sg_table() function is supposed to return
> error pointer.  The current code, would trigger a NULL dereference in
> drm_gem_map_dma_buf().
>
> Fixes: c575b7eeb89f ("drm/xen-front: Add support for Xen PV display frontend")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> index c85bfe7571cb..4507bc03ed8f 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> @@ -179,7 +179,7 @@ struct sg_table *xen_drm_front_gem_get_sg_table(struct drm_gem_object *gem_obj)
>   	struct xen_gem_object *xen_obj = to_xen_gem_obj(gem_obj);
>   
>   	if (!xen_obj->pages)
> -		return NULL;
> +		return ERR_PTR(-EINVAL);
>   
>   	return drm_prime_pages_to_sg(xen_obj->pages, xen_obj->num_pages);
>   }

