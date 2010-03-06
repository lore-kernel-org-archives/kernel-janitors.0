From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 06 Mar 2010 11:50:54 +0000
Subject: Re: [patch] i915: fix small leak on error path
Message-Id: <20100306115054.GA3462@viiv.ffwll.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100306110539.GD4958@bicker>
In-Reply-To: <20100306110539.GD4958@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@ffwll.ch>, maximlevitsky@gmail.com, Chris Wilson <chris@chris-wilson.co.uk>, Luca Barbieri <luca@luca-barbieri.com>, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Oh, dang. Thanks for catching this. Eric, please merge.

Cc: stable@kernel.org (for .33)
Reviewed-by: Daniel Vetter <daniel@ffwll.ch>

On Sat, Mar 06, 2010 at 02:05:39PM +0300, Dan Carpenter wrote:
> We should free "params" before returning.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/gpu/drm/i915/intel_overlay.c b/drivers/gpu/drm/i915/intel_overlay.c
> index d355d1d..60595fc 100644
> --- a/drivers/gpu/drm/i915/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/intel_overlay.c
> @@ -1068,14 +1068,18 @@ int intel_overlay_put_image(struct drm_device *dev, void *data,
>  
>  	drmmode_obj = drm_mode_object_find(dev, put_image_rec->crtc_id,
>                          DRM_MODE_OBJECT_CRTC);
> -	if (!drmmode_obj)
> -		return -ENOENT;
> +	if (!drmmode_obj) {
> +		ret = -ENOENT;
> +		goto out_free;
> +	}
>  	crtc = to_intel_crtc(obj_to_crtc(drmmode_obj));
>  
>  	new_bo = drm_gem_object_lookup(dev, file_priv,
>  			put_image_rec->bo_handle);
> -	if (!new_bo)
> -		return -ENOENT;
> +	if (!new_bo) {
> +		ret = -ENOENT;
> +		goto out_free;
> +	}
>  
>  	mutex_lock(&dev->mode_config.mutex);
>  	mutex_lock(&dev->struct_mutex);
> @@ -1165,6 +1169,7 @@ out_unlock:
>  	mutex_unlock(&dev->struct_mutex);
>  	mutex_unlock(&dev->mode_config.mutex);
>  	drm_gem_object_unreference_unlocked(new_bo);
> +out_free:
>  	kfree(params);
>  
>  	return ret;

-- 
Daniel Vetter
Mail: daniel@ffwll.ch
Mobile: +41 (0)79 365 57 48
