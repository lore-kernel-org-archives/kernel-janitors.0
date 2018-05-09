From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 09 May 2018 08:18:57 +0000
Subject: Re: [PATCH v2] drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
Message-Id: <152585393757.3513.738158010667924495@mail.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180509081254.qxcetabxj74hltoq@mwanda>
In-Reply-To: <20180509081254.qxcetabxj74hltoq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Gustavo Padovan <gustavo@padovan.org>, David Herrmann <dh.herrmann@gmail.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Quoting Dan Carpenter (2018-05-09 09:12:54)
> There is a comment here which says that DIV_ROUND_UP() can overflow and
> that's where the problem comes from.  Say you pick:
> 
>         args->bpp = UINT_MAX - 7;
>         args->width = 4;
>         args->height = 1;
> 
> The integer overflow in DIV_ROUND_UP() means "cpp" is UINT_MAX / 8 and
> because of how we picked args->width that means cpp < UINT_MAX / 4.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: correct a typo in the commit message
> 
> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> index 39ac15ce4702..45b0b5bbb5f8 100644
> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> @@ -65,7 +65,8 @@ int drm_mode_create_dumb_ioctl(struct drm_device *dev,
>                 return -EINVAL;
>  
>         /* overflow checks for 32bit size calculations */
> -       /* NOTE: DIV_ROUND_UP() can overflow */
> +       if (args->bpp > UINT_MAX - 8)
> +               return -EINVAL;

#define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d)

both args->bpp and cpp are u32, so should we use U32_MAX to be typesafe?

>         cpp = DIV_ROUND_UP(args->bpp, 8);
>         if (!cpp || cpp > 0xffffffffU / args->width)

And these constants should also be U32_MAX?
-Chris
