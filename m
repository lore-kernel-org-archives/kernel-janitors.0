From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 09 May 2018 08:23:07 +0000
Subject: Re: [PATCH] drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
Message-Id: <20180509082307.GS28661@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180509072249.GA12754@mwanda>
In-Reply-To: <20180509072249.GA12754@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, May 09, 2018 at 10:22:49AM +0300, Dan Carpenter wrote:
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
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Btw, DIV_ROUND_UP() integer overflows have been a recurring source of
> bugs so I have an unreleased static checker warning specific for that.
> This line triggers three warnings for me on my unreleased code:
> 
> drivers/gpu/drm/drm_dumb_buffers.c:69 drm_mode_create_dumb_ioctl() warn: negative user subtract: 0-u32max - 1
> drivers/gpu/drm/drm_dumb_buffers.c:69 drm_mode_create_dumb_ioctl() warn: potential integer overflow from user '(args->bpp) + (8)'
> drivers/gpu/drm/drm_dumb_buffers.c:69 drm_mode_create_dumb_ioctl() warn: potential integer overflow in 'DIV_ROUND_UP'
> 
> It's a pretty common idiom in the kernel to overflow and then test for
> it later so I'm not able to release this code because of the number of
> false positives that this idiom causes...
> 
> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> index 39ac15ce4702..45b0b5bbb5f8 100644
> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> @@ -65,7 +65,8 @@ int drm_mode_create_dumb_ioctl(struct drm_device *dev,
>  		return -EINVAL;
>  
>  	/* overflow checks for 32bit size calculations */
> -	/* NOTE: DIV_ROUND_UP() can overflow */
> +	if (args->bpp > UINT_MAX - 8)
> +		return -EINVAL;
>  	cpp = DIV_ROUND_UP(args->bpp, 8);
>  	if (!cpp || cpp > 0xffffffffU / args->width)

The !cpp check is now redundant, this was our minimal overflow check. Note
that we only really care for cpp != 0 and that the size calculation doesn't
overflow. Userspace specifying a completely bogus bpp value is ok
otherwise (reasonable values only go up to about 128). So I think there's
no security issue here.

Anyway, can you pls respin with the !cpp check removed? See also

commit 6a77e80e55cacace60ff03aa717a6d364a401d2b (HEAD -> stuff)
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon Apr 30 17:04:10 2018 +0200

    backlight: remove obsolete comment for ->state

for context.

Thanks, Daniel

>  		return -EINVAL;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
