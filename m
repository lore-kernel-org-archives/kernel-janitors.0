From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 12 Jul 2016 14:20:36 +0000
Subject: Re: [patch 2/2] qxl: silence uninitialized variable warning
Message-Id: <20160712142036.GP23520@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160711084716.GB31411@mwanda>
In-Reply-To: <20160711084716.GB31411@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Mon, Jul 11, 2016 at 11:47:16AM +0300, Dan Carpenter wrote:
> GCC doesn't complain about this but my static checker does.  We're
> passing "drawable" before initializing it.  It's not actually used so
> it's harmless and I just removed it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Both of your qxl patches applied to drm-misc, thanks.
-Daniel

> 
> diff --git a/drivers/gpu/drm/qxl/qxl_draw.c b/drivers/gpu/drm/qxl/qxl_draw.c
> index 56e1d63..ffe8853 100644
> --- a/drivers/gpu/drm/qxl/qxl_draw.c
> +++ b/drivers/gpu/drm/qxl/qxl_draw.c
> @@ -37,7 +37,6 @@ static int alloc_clips(struct qxl_device *qdev,
>   * the qxl_clip_rects. This is *not* the same as the memory allocated
>   * on the device, it is offset to qxl_clip_rects.chunk.data */
>  static struct qxl_rect *drawable_set_clipping(struct qxl_device *qdev,
> -					      struct qxl_drawable *drawable,
>  					      unsigned num_clips,
>  					      struct qxl_bo *clips_bo)
>  {
> @@ -349,7 +350,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
>  	if (ret)
>  		goto out_release_backoff;
>  
> -	rects = drawable_set_clipping(qdev, drawable, num_clips, clips_bo);
> +	rects = drawable_set_clipping(qdev, num_clips, clips_bo);
>  	if (!rects)
>  		goto out_release_backoff;
>  
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
