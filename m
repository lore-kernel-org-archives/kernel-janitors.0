From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 11 Sep 2018 07:34:39 +0000
Subject: Re: [PATCH -next] drm: Remove set but not used variable 'config'
Message-Id: <20180911073438.GG19774@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536646814-186429-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536646814-186429-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>

On Tue, Sep 11, 2018 at 06:20:14AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/drm_plane.c: In function 'drm_mode_getplane_res':
> drivers/gpu/drm/drm_plane.c:475:26: warning:
>  variable 'config' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
-Daniel
> ---
>  drivers/gpu/drm/drm_plane.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 36bf3fe..4a72c68 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -472,7 +472,6 @@ int drm_mode_getplane_res(struct drm_device *dev, void *data,
>  			  struct drm_file *file_priv)
>  {
>  	struct drm_mode_get_plane_res *plane_resp = data;
> -	struct drm_mode_config *config;
>  	struct drm_plane *plane;
>  	uint32_t __user *plane_ptr;
>  	int count = 0;
> @@ -480,7 +479,6 @@ int drm_mode_getplane_res(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EINVAL;
>  
> -	config = &dev->mode_config;
>  	plane_ptr = u64_to_user_ptr(plane_resp->plane_id_ptr);
>  
>  	/*
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
