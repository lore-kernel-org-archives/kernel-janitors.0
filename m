From: "Huang, Ray" <Ray.Huang@amd.com>
Date: Thu, 08 Nov 2018 06:11:51 +0000
Subject: RE: [PATCH -next] drm/ttm: remove set but not used variable 'driver'
Message-Id: <BY2PR12MB0040B73B02AD39434F410677ECC50@BY2PR12MB0040.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541643300-109641-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541643300-109641-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhang, Jerry" <Jerry.Zhang@amd.com>, David Airlie <airlied@linux.ie>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

> -----Original Message-----
> From: YueHaibing [mailto:yuehaibing@huawei.com]
> Sent: Thursday, November 08, 2018 10:15 AM
> To: Koenig, Christian <Christian.Koenig@amd.com>; Huang, Ray
> <Ray.Huang@amd.com>; Zhang, Jerry <Jerry.Zhang@amd.com>; David Airlie
> <airlied@linux.ie>
> Cc: YueHaibing <yuehaibing@huawei.com>; dri-devel@lists.freedesktop.org;
> linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH -next] drm/ttm: remove set but not used variable 'driver'
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/ttm/ttm_execbuf_util.c: In function
> 'ttm_eu_fence_buffer_objects':
> drivers/gpu/drm/ttm/ttm_execbuf_util.c:190:24: warning:
>  variable 'driver' set but not used [-Wunused-but-set-variable]
> 
> It not used any more after
> commit f2c24b83ae90 ("drm/ttm: flip the switch, and convert to dma_fence")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_execbuf_util.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> index e493edb..efa005a 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -187,14 +187,12 @@ void ttm_eu_fence_buffer_objects(struct
> ww_acquire_ctx *ticket,
>  	struct ttm_buffer_object *bo;
>  	struct ttm_bo_global *glob;
>  	struct ttm_bo_device *bdev;
> -	struct ttm_bo_driver *driver;
> 
>  	if (list_empty(list))
>  		return;
> 
>  	bo = list_first_entry(list, struct ttm_validate_buffer, head)->bo;
>  	bdev = bo->bdev;
> -	driver = bdev->driver;
>  	glob = bo->bdev->glob;
> 
>  	spin_lock(&glob->lru_lock);
> 
> 
