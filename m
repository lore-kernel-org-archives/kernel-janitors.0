From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 16 May 2018 15:57:47 +0000
Subject: Re: [PATCH v2] drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
Message-Id: <20180516155747.GJ3438@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <152585393757.3513.738158010667924495@mail.alporthouse.com>
 <20180516140026.GA19340@mwanda>
In-Reply-To: <20180516140026.GA19340@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, May 16, 2018 at 05:00:26PM +0300, Dan Carpenter wrote:
> There is a comment here which says that DIV_ROUND_UP() and that's where
> the problem comes from.  Say you pick:
> 
> 	args->bpp = UINT_MAX - 7;
> 	args->width = 4;
> 	args->height = 1;
> 
> The integer overflow in DIV_ROUND_UP() means "cpp" is UINT_MAX / 8 and
> because of how we picked args->width that means cpp < UINT_MAX / 4.
> 
> I've fixed it by preventing the integer overflow in DIV_ROUND_UP().  I
> removed the check for !cpp because it's not possible after this change.
> I also changed all the 0xffffffffU references to U32_MAX.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2:  additional cleanups

Thanks a lot for respinning, applied to drm-misc-fixes.
-Daniel

> 
> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> index 39ac15ce4702..9e2ae02f31e0 100644
> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> @@ -65,12 +65,13 @@ int drm_mode_create_dumb_ioctl(struct drm_device *dev,
>  		return -EINVAL;
>  
>  	/* overflow checks for 32bit size calculations */
> -	/* NOTE: DIV_ROUND_UP() can overflow */
> +	if (args->bpp > U32_MAX - 8)
> +		return -EINVAL;
>  	cpp = DIV_ROUND_UP(args->bpp, 8);
> -	if (!cpp || cpp > 0xffffffffU / args->width)
> +	if (cpp > U32_MAX / args->width)
>  		return -EINVAL;
>  	stride = cpp * args->width;
> -	if (args->height > 0xffffffffU / stride)
> +	if (args->height > U32_MAX / stride)
>  		return -EINVAL;
>  
>  	/* test for wrap-around */
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
