From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 04 Dec 2018 10:47:19 +0000
Subject: Re: [PATCH -next] drm/vkms: Remove set but not used variable 'vkms_obj'
Message-Id: <20181204104719.GB21184@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543634444-186448-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543634444-186448-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>, Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Dec 01, 2018 at 03:20:44AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/vkms/vkms_plane.c: In function 'vkms_prepare_fb':
> drivers/gpu/drm/vkms/vkms_plane.c:144:26: warning:
>  variable 'vkms_obj' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction in commit
> 8ce1bb0b5337 ("drm/vkms: map/unmap buffers in [prepare/cleanup]_fb hooks")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/vkms/vkms_plane.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e3bcea4..4188176 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -141,14 +141,12 @@ static int vkms_prepare_fb(struct drm_plane *plane,
>  			   struct drm_plane_state *state)
>  {
>  	struct drm_gem_object *gem_obj;
> -	struct vkms_gem_object *vkms_obj;
>  	int ret;
>  
>  	if (!state->fb)
>  		return 0;
>  
>  	gem_obj = drm_gem_fb_get_obj(state->fb, 0);
> -	vkms_obj = drm_gem_to_vkms_gem(gem_obj);
>  	ret = vkms_gem_vmap(gem_obj);
>  	if (ret)
>  		DRM_ERROR("vmap failed: %d\n", ret);
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
