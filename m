From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 25 Mar 2019 09:27:14 +0000
Subject: Re: [PATCH] drm/i915: Fix an error code in i915_gem_context_open()
Message-Id: <155350603409.15930.1164453970215929715@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190325092349.GF16023@kadam>
In-Reply-To: <20190325092349.GF16023@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Quoting Dan Carpenter (2019-03-25 09:23:49)
> If gem_context_register() fails then "ctx" is a valid pointer, not an
> error pointer.  We should just return "err".
> 
> Fixes: 3aa9945a528e ("drm/i915: Separate GEM context construction and registration to userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/i915_gem_context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem_context.c b/drivers/gpu/drm/i915/i915_gem_context.c
> index e6f594668245..25f267a03d3d 100644
> --- a/drivers/gpu/drm/i915/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/i915_gem_context.c
> @@ -709,7 +709,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
>         idr_destroy(&file_priv->context_idr);
>         mutex_destroy(&file_priv->vm_idr_lock);
>         mutex_destroy(&file_priv->context_idr_lock);
> -       return PTR_ERR(ctx);
> +       return err;

I beat you by mere moments! Thanks for the patch, will be fixed
momentarily.
-Chris
