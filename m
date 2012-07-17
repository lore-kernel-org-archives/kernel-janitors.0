From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 17 Jul 2012 08:22:14 +0000
Subject: Re: [patch] drm/i915: dereferencing an error pointer
Message-Id: <20120717082214.GA5498@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120717064449.GB14985@elgon.mountain>
In-Reply-To: <20120717064449.GB14985@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Tue, Jul 17, 2012 at 09:44:49AM +0300, Dan Carpenter wrote:
> We need to check that "ctx" is a valid pointer before dereferencing it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued for drm-intel-next, thanks for the patch.
-Daniel

> ---
> Applies to linux-next.
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem_context.c b/drivers/gpu/drm/i915/i915_gem_context.c
> index 9ae3f2c..a82c0ec 100644
> --- a/drivers/gpu/drm/i915/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/i915_gem_context.c
> @@ -496,11 +496,13 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>  
>  	ctx = create_hw_context(dev, file_priv);
>  	mutex_unlock(&dev->struct_mutex);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
>  
>  	args->ctx_id = ctx->id;
>  	DRM_DEBUG_DRIVER("HW context %d created\n", args->ctx_id);
>  
> -	return PTR_RET(ctx);
> +	return 0;
>  }
>  
>  int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,

-- 
Daniel Vetter
Mail: daniel@ffwll.ch
Mobile: +41 (0)79 365 57 48
