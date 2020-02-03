From: Steven Price <steven.price@arm.com>
Date: Mon, 03 Feb 2020 15:41:06 +0000
Subject: Re: [PATCH -next] drm/panfrost: Remove set but not used variable 'bo'
Message-Id: <20200203154106.GA2114@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200203152724.42611-1-yuehaibing@huawei.com>
In-Reply-To: <20200203152724.42611-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, Hulk Robot <hulkci@huawei.com>, Boris Brezillon <boris.brezillon@collabora.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>

On Mon, Feb 03, 2020 at 03:27:24PM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_cleanup':
> drivers/gpu/drm/panfrost/panfrost_job.c:278:31: warning:
>  variable 'bo' set but not used [-Wunused-but-set-variable]
> 
> commit bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
> involved this unused variable.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

I'm not sure how I didn't spot that before! Thanks for fixing it.

Note commit bdefca2d8dc0 is actually in v5.5 and not (yet) in
drm-misc-next.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 7c36ec675b73..ccb8546a9342 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -275,12 +275,8 @@ static void panfrost_job_cleanup(struct kref *ref)
>  	}
>  
>  	if (job->bos) {
> -		struct panfrost_gem_object *bo;
> -
> -		for (i = 0; i < job->bo_count; i++) {
> -			bo = to_panfrost_bo(job->bos[i]);
> +		for (i = 0; i < job->bo_count; i++)
>  			drm_gem_object_put_unlocked(job->bos[i]);
> -		}
>  
>  		kvfree(job->bos);
>  	}
> 
> 
> 
