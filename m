From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Mon, 08 Dec 2014 10:24:27 +0000
Subject: Re: [PATCH 7/20] drm/i915: fix misspelling of current function in string
Message-Id: <87fvcqo2w4.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr> <1417980062-25151-8-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-8-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Daniel Vetter <daniel.vetter@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

On Sun, 07 Dec 2014, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> Replace a misspelled function name by %s and then __func__.
>
> This was done using Coccinelle, including the use of Levenshtein distance,
> as proposed by Rasmus Villemoes.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
> The semantic patch is difficult to summarize, but is available in the cover
> letter of this patch series.
>
> The message is sort of ambiguous, but I assume that it is intended to refer
> to the function in which the problem is detected.

Hmm, DRM_DEBUG prints __func__ too.

Jani.

>
>  drivers/gpu/drm/i915/i915_gem.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index d2ba315..fa21d1c 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -4335,7 +4335,7 @@ i915_gem_unpin_ioctl(struct drm_device *dev, void *data,
>  	}
>  
>  	if (obj->pin_filp != file) {
> -		DRM_DEBUG("Not pinned by caller in i915_gem_pin_ioctl(): %d\n",
> +		DRM_DEBUG("Not pinned by caller in %s(): %d\n", __func__,
>  			  args->handle);
>  		ret = -EINVAL;
>  		goto out;
>

-- 
Jani Nikula, Intel Open Source Technology Center
