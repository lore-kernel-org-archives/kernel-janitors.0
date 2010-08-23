From: Dan Carpenter <error27@gmail.com>
Date: Mon, 23 Aug 2010 11:22:16 +0000
Subject: Re: [patch] i915: return -EFAULT if copy_to_user fails
Message-Id: <20100823111941.GI6674@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100619131251.GB5467@bicker>
In-Reply-To: <20100619131251.GB5467@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Sat, Jun 19, 2010 at 03:12:51PM +0200, Dan Carpenter wrote:
> copy_to_user returns the number of bytes remaining to be copied, but we
> want to return a negative error code here.  These are returned to
> userspace.
> 

I didn't get a response on this patch.

regards,
dan carpenter

> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/gpu/drm/i915/i915_dma.c b/drivers/gpu/drm/i915/i915_dma.c
> index 59a2bf8..5fd876e 100644
> --- a/drivers/gpu/drm/i915/i915_dma.c
> +++ b/drivers/gpu/drm/i915/i915_dma.c
> @@ -608,8 +608,10 @@ static int i915_batchbuffer(struct drm_device *dev, void *data,
>  		ret = copy_from_user(cliprects, batch->cliprects,
>  				     batch->num_cliprects *
>  				     sizeof(struct drm_clip_rect));
> -		if (ret != 0)
> +		if (ret != 0) {
> +			ret = -EFAULT;
>  			goto fail_free;
> +		}
>  	}
>  
>  	mutex_lock(&dev->struct_mutex);
> @@ -650,8 +652,10 @@ static int i915_cmdbuffer(struct drm_device *dev, void *data,
>  		return -ENOMEM;
>  
>  	ret = copy_from_user(batch_data, cmdbuf->buf, cmdbuf->sz);
> -	if (ret != 0)
> +	if (ret != 0) {
> +		ret = -EFAULT;
>  		goto fail_batch_free;
> +	}
>  
>  	if (cmdbuf->num_cliprects) {
>  		cliprects = kcalloc(cmdbuf->num_cliprects,
> @@ -664,8 +668,10 @@ static int i915_cmdbuffer(struct drm_device *dev, void *data,
>  		ret = copy_from_user(cliprects, cmdbuf->cliprects,
>  				     cmdbuf->num_cliprects *
>  				     sizeof(struct drm_clip_rect));
> -		if (ret != 0)
> +		if (ret != 0) {
> +			ret = -EFAULT;
>  			goto fail_clip_free;
> +		}
>  	}
>  
>  	mutex_lock(&dev->struct_mutex);
