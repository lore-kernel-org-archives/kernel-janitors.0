From: Ian Romanick <idr@freedesktop.org>
Date: Thu, 17 May 2012 17:05:43 +0000
Subject: Re: [patch] drm: checking the wrong variable in savage_do_init_bci()
Message-Id: <4FB52FE7.6070303@freedesktop.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120517070944.GE14660@elgon.mountain>
In-Reply-To: <20120517070944.GE14660@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nicolas Kaiser <nikai@nikai.net>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Greg Dietsche <Gregory.Dietsche@cuw.edu>

On 05/17/2012 12:09 AM, Dan Carpenter wrote:
> drm_core_ioremap() initializes ->handle.  We already know
> "dev->agp_buffer_map" is a valid pointer.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>

I'm surprised that has never been hit.

Reviewed-by: Ian Romanick <ian.d.romanick@intel.com>

>
> diff --git a/drivers/gpu/drm/savage/savage_bci.c b/drivers/gpu/drm/savage/savage_bci.c
> index cb1ee4e..6eb507a 100644
> --- a/drivers/gpu/drm/savage/savage_bci.c
> +++ b/drivers/gpu/drm/savage/savage_bci.c
> @@ -735,7 +735,7 @@ static int savage_do_init_bci(struct drm_device * dev, drm_savage_init_t * init)
>   			return -EINVAL;
>   		}
>   		drm_core_ioremap(dev->agp_buffer_map, dev);
> -		if (!dev->agp_buffer_map) {
> +		if (!dev->agp_buffer_map->handle) {
>   			DRM_ERROR("failed to ioremap DMA buffer region!\n");
>   			savage_do_cleanup_bci(dev);
>   			return -ENOMEM;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

