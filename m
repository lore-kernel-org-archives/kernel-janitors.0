From: Frediano Ziglio <fziglio@redhat.com>
Date: Wed, 23 Sep 2015 10:45:05 +0000
Subject: Re: [patch 4/4 v2] drm/qxl: integer overflow in qxl_alloc_surf_ioctl()
Message-Id: <151358038.30813068.1443005105969.JavaMail.zimbra@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150922143208.GA2319@mwanda>
In-Reply-To: <20150922143208.GA2319@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

> 
> The size calculation can overflow.  I don't know if this leads to
> memory corruption, but it causes a static checker warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: I don't know think the size is capped anywhere.  In my first version
> of this patch, I introduced a divide by zero bug.
> 

Beside the second sentence I would ack

Frediano

> diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c
> b/drivers/gpu/drm/qxl/qxl_ioctl.c
> index b2db482..49b3158 100644
> --- a/drivers/gpu/drm/qxl/qxl_ioctl.c
> +++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
> @@ -396,12 +396,14 @@ static int qxl_alloc_surf_ioctl(struct drm_device *dev,
> void *data,
>  	struct qxl_bo *qobj;
>  	int handle;
>  	int ret;
> -	int size, actual_stride;
> +	u64 size, actual_stride;
>  	struct qxl_surface surf;
>  
>  	/* work out size allocate bo with handle */
>  	actual_stride = param->stride < 0 ? -param->stride : param->stride;
>  	size = actual_stride * param->height + actual_stride;
> +	if (size > INT_MAX)
> +		return -EINVAL;
>  
>  	surf.format = param->format;
>  	surf.width = param->width;
> 
