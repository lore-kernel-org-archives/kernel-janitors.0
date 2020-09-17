From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 17 Sep 2020 10:49:34 +0000
Subject: Re: [PATCH v2] drm/i915: Fix an error code i915_gem_object_copy_blt()
Message-Id: <7c10479e-31ad-5392-b2d6-0264cc845c3d@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200911075243.GG12635@kadam>
In-Reply-To: <20200911075243.GG12635@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>

Op 11-09-2020 om 09:52 schreef Dan Carpenter:
> This code should use "vma[1]" instead of "vma".  The "vma" variable is a
> valid pointer.
>
> Fixes: 6b05030496f7 ("drm/i915: Convert i915_gem_object/client_blt.c to use ww locking as well, v2.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
> v2: Fix confusing typo in the commit message
>
>  drivers/gpu/drm/i915/gem/i915_gem_object_blt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
> index d93eb36160c9..aee7ad3cc3c6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
> @@ -364,7 +364,7 @@ int i915_gem_object_copy_blt(struct drm_i915_gem_object *src,
>  
>  	vma[1] = i915_vma_instance(dst, vm, NULL);
>  	if (IS_ERR(vma[1]))
> -		return PTR_ERR(vma);
> +		return PTR_ERR(vma[1]);
>  
>  	i915_gem_ww_ctx_init(&ww, true);
>  	intel_engine_pm_get(ce->engine);

Thanks, applied to drm-intel-gt-next. :)
