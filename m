From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 03 Jul 2018 13:01:05 +0000
Subject: Re: [PATCH] drm/i810: off by one in i810_dma_vertex()
Message-Id: <20180703130105.GC3891@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180703123015.kma7v7rwtdy4urce@kili.mountain>
In-Reply-To: <20180703123015.kma7v7rwtdy4urce@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Tue, Jul 03, 2018 at 03:30:16PM +0300, Dan Carpenter wrote:
> If vertex->idx = dma->buf_count then we end up reading one element
> beyond the end of the dma->buflist[] array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This driver is a full-on root hole no matter what, but applied to appease
the checkers :-)

Thanks, Daniel

> 
> diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
> index 576a417690d4..3b378936f575 100644
> --- a/drivers/gpu/drm/i810/i810_dma.c
> +++ b/drivers/gpu/drm/i810/i810_dma.c
> @@ -934,7 +934,7 @@ static int i810_dma_vertex(struct drm_device *dev, void *data,
>  	DRM_DEBUG("idx %d used %d discard %d\n",
>  		  vertex->idx, vertex->used, vertex->discard);
>  
> -	if (vertex->idx < 0 || vertex->idx > dma->buf_count)
> +	if (vertex->idx < 0 || vertex->idx >= dma->buf_count)
>  		return -EINVAL;
>  
>  	i810_dma_dispatch_vertex(dev,
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
