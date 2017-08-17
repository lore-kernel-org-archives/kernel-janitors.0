From: Imre Deak <imre.deak@intel.com>
Date: Thu, 17 Aug 2017 09:37:00 +0000
Subject: Re: [PATCH] drm/i915: Fix integer overflow tests
Message-Id: <20170817093700.5srkwji7mxexouts@ideak-desk.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817062310.rc6ol2c5vttvrjlx@mwanda>
In-Reply-To: <20170817062310.rc6ol2c5vttvrjlx@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Thu, Aug 17, 2017 at 09:23:10AM +0300, Dan Carpenter wrote:
> There are some potential integer overflows here on 64 bit systems.
> 
> The condition "if (nfences > SIZE_MAX / sizeof(*fences))" can only be
> true on 32 bit systems, it's a no-op on 64 bit, so let's ignore the
> check for now and look a couple lines after:
> 
> 	if (!access_ok(VERIFY_READ, user, nfences * 2 * sizeof(u32)))
>                                           ^^^^^^^^^^^
> "nfences" is an unsigned int, so if we set it to UINT_MAX and multiply
> by two, it's going to have an integer overflow.  

AFAICS it wouldn't overflow due the promotion to unsigned long
by '* sizeof(u32)'.

> The "args->buffer_count"
> is also an unsigned int so it could overflow if it's set to UINT_MAX
> when we do:
> 
> 	exec2_list = kvmalloc_array(args->buffer_count + 1, sz,
>                                     ^^^^^^^^^^^^^^^^^^^^^^

Yes, this could overflow.

> Fixes: 2889caa92321 ("drm/i915: Eliminate lots of iterations over the execobjects array")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
> index 15ab3e6792f9..f569721aad1a 100644
> --- a/drivers/gpu/drm/i915/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
> @@ -2152,7 +2152,7 @@ get_fence_array(struct drm_i915_gem_execbuffer2 *args,
>  	if (!(args->flags & I915_EXEC_FENCE_ARRAY))
>  		return NULL;
>  
> -	if (nfences > SIZE_MAX / sizeof(*fences))
> +	if (nfences > UINT_MAX / sizeof(*fences))
>  		return ERR_PTR(-EINVAL);
>  
>  	user = u64_to_user_ptr(args->cliprects_ptr);
> @@ -2520,7 +2520,7 @@ i915_gem_execbuffer(struct drm_device *dev, void *data,
>  	unsigned int i;
>  	int err;
>  
> -	if (args->buffer_count < 1 || args->buffer_count > SIZE_MAX / sz - 1) {
> +	if (args->buffer_count < 1 || args->buffer_count > UINT_MAX / sz - 1) {
>  		DRM_DEBUG("execbuf2 with %d buffers\n", args->buffer_count);
>  		return -EINVAL;
>  	}
> @@ -2609,7 +2609,7 @@ i915_gem_execbuffer2(struct drm_device *dev, void *data,
>  	struct drm_syncobj **fences = NULL;
>  	int err;
>  
> -	if (args->buffer_count < 1 || args->buffer_count > SIZE_MAX / sz - 1) {
> +	if (args->buffer_count < 1 || args->buffer_count > UINT_MAX / sz - 1) {
>  		DRM_DEBUG("execbuf2 with %d buffers\n", args->buffer_count);
>  		return -EINVAL;
>  	}
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
