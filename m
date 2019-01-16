From: Lucas Stach <l.stach@pengutronix.de>
Date: Wed, 16 Jan 2019 15:31:36 +0000
Subject: Re: [PATCH] drm/etnaviv: NULL vs IS_ERR() buf in etnaviv_core_dump()
Message-Id: <1547652696.4339.38.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114104946.GA22444@kadam>
In-Reply-To: <20190114104946.GA22444@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>

Am Montag, den 14.01.2019, 13:49 +0300 schrieb Dan Carpenter:
> The etnaviv_gem_get_pages() never returns NULL.  It returns error
> pointers on error.
> 
> Fixes: a8c21a5451d8 ("drm/etnaviv: add initial etnaviv DRM driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to etnaviv/next.

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_dump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> index 3fbb4855396c..33854c94cb85 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> @@ -215,7 +215,7 @@ void etnaviv_core_dump(struct etnaviv_gpu *gpu)
>  		mutex_lock(&obj->lock);
>  		pages = etnaviv_gem_get_pages(obj);
>  		mutex_unlock(&obj->lock);
> -		if (pages) {
> +		if (!IS_ERR(pages)) {
>  			int j;
>  
>  			iter.hdr->data[0] = bomap - bomap_start;
