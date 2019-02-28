From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 28 Feb 2019 02:41:41 +0000
Subject: Re: [PATCH -next] drm/ttm: remove set but not used variable 'bdev'
Message-Id: <CADnq5_OJnArPi3FvGO_a_q8_qQu2uSLaBA=SqZKH0HkvVdLJLA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218135935.132773-1-yuehaibing@huawei.com>
In-Reply-To: <20190218135935.132773-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Feb 19, 2019 at 3:22 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/ttm/ttm_execbuf_util.c: In function 'ttm_eu_fence_buffer_objects':
> drivers/gpu/drm/ttm/ttm_execbuf_util.c:191:24: warning:
>  variable 'bdev' set but not used [-Wunused-but-set-variable]
>
> It's not used any more and can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/ttm/ttm_execbuf_util.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> index 93860346c426..0075eb9a0b52 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -188,13 +188,11 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
>         struct ttm_validate_buffer *entry;
>         struct ttm_buffer_object *bo;
>         struct ttm_bo_global *glob;
> -       struct ttm_bo_device *bdev;
>
>         if (list_empty(list))
>                 return;
>
>         bo = list_first_entry(list, struct ttm_validate_buffer, head)->bo;
> -       bdev = bo->bdev;
>         glob = bo->bdev->glob;
>
>         spin_lock(&glob->lru_lock);
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
