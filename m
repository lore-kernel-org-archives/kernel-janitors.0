From: "Zhang, Jerry(Junwei)" <Jerry.Zhang@amd.com>
Date: Thu, 08 Nov 2018 02:17:05 +0000
Subject: Re: [PATCH -next] drm/ttm: remove set but not used variable 'driver'
Message-Id: <b1283edd-0124-a6f4-fbd1-22707aecea9e@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541643300-109641-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541643300-109641-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On 11/8/18 10:15 AM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/ttm/ttm_execbuf_util.c: In function 'ttm_eu_fence_buffer_objects':
> drivers/gpu/drm/ttm/ttm_execbuf_util.c:190:24: warning:
>   variable 'driver' set but not used [-Wunused-but-set-variable]
>
> It not used any more after
> commit f2c24b83ae90 ("drm/ttm: flip the switch, and convert to dma_fence")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks.
Reviewed-by: Junwei Zhang <Jerry.Zhang@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_execbuf_util.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> index e493edb..efa005a 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -187,14 +187,12 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
>   	struct ttm_buffer_object *bo;
>   	struct ttm_bo_global *glob;
>   	struct ttm_bo_device *bdev;
> -	struct ttm_bo_driver *driver;
>   
>   	if (list_empty(list))
>   		return;
>   
>   	bo = list_first_entry(list, struct ttm_validate_buffer, head)->bo;
>   	bdev = bo->bdev;
> -	driver = bdev->driver;
>   	glob = bo->bdev->glob;
>   
>   	spin_lock(&glob->lru_lock);
>
>
>
