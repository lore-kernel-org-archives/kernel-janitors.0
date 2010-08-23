From: Dan Carpenter <error27@gmail.com>
Date: Mon, 23 Aug 2010 11:24:59 +0000
Subject: Re: [patch] i915: return -EFAULT if copy_to_user fails
Message-Id: <20100823112408.GJ6674@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100623170217.GA15424@bicker>
In-Reply-To: <20100623170217.GA15424@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>

On Wed, Jun 23, 2010 at 07:03:01PM +0200, Dan Carpenter wrote:
> copy_to_user() returns the number of bytes remaining to be copied and
> I'm pretty sure we want to return a negative error code here.
> 

This patch wasn't applied either.

regards,
dan carpenter


> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 9ded3da..22691b4 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -3707,6 +3707,7 @@ i915_gem_do_execbuffer(struct drm_device *dev, void *data,
>  		if (ret != 0) {
>  			DRM_ERROR("copy %d cliprects failed: %d\n",
>  				  args->num_cliprects, ret);
> +			ret = -EFAULT;
>  			goto pre_mutex_err;
>  		}
>  	}
