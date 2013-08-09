From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 09 Aug 2013 10:05:52 +0000
Subject: Re: [patch] drm/i915: unbreak i915_gem_object_ggtt_unbind()
Message-Id: <20130809100552.GA24203@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130809094411.GB29282@elgon.mountain>
In-Reply-To: <20130809094411.GB29282@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Ben Widawsky <ben@bwidawsk.net>

On Fri, Aug 09, 2013 at 12:44:11PM +0300, Dan Carpenter wrote:
> There is an extra semi-colon here so we just leak and never unbind
> anything.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 735f43f..a582540 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -2656,7 +2656,7 @@ i915_gem_object_ggtt_unbind(struct drm_i915_gem_object *obj)
>  	struct drm_i915_private *dev_priv = obj->base.dev->dev_private;
>  	struct i915_address_space *ggtt = &dev_priv->gtt.base;
>  
> -	if (!i915_gem_obj_ggtt_bound(obj));
> +	if (!i915_gem_obj_ggtt_bound(obj))

Oops, thanks for spotting this. Applied to dinq.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
