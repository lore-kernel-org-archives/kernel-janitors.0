From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 19 Dec 2013 01:03:05 +0000
Subject: Re: [patch v2] [media] v4l: omap4iss: Restore irq flags correctly in omap4iss_video_buffer_next()
Message-Id: <9772816.NZs94s1p3P@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131216150612.GA15506@elgon.mountain>
In-Reply-To: <20131216150612.GA15506@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Sergio Aguirre <sergio.a.aguirre@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Wednesday 18 December 2013 10:29:24 Dan Carpenter wrote:
> The spin_lock_irqsave() macro is not nestable.  The second call will
> overwrite the first record of "flags" so the IRQs will not be enabled
> correctly at the end of the function.
> 
> In the current code, this function is always called from the IRQ handler
> so everything works fine and this fix doesn't change anything.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree. I'll send a pull request shortly.

> ---
> v2:  Updated the change log
> 
> diff --git a/drivers/staging/media/omap4iss/iss_video.c
> b/drivers/staging/media/omap4iss/iss_video.c index
> 766491e6a8d0..c9b71c750b15 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -451,9 +451,9 @@ struct iss_buffer *omap4iss_video_buffer_next(struct
> iss_video *video) }
> 
>  	if (video->type = V4L2_BUF_TYPE_VIDEO_CAPTURE && pipe->input != NULL) {
> -		spin_lock_irqsave(&pipe->lock, flags);
> +		spin_lock(&pipe->lock);
>  		pipe->state &= ~ISS_PIPELINE_STREAM;
> -		spin_unlock_irqrestore(&pipe->lock, flags);
> +		spin_unlock(&pipe->lock);
>  	}
> 
>  	buf = list_first_entry(&video->dmaqueue, struct iss_buffer,

-- 
Regards,

Laurent Pinchart

