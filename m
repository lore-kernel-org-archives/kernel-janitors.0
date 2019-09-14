From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Sat, 14 Sep 2019 12:46:09 +0000
Subject: Re: [PATCH] media: uvcvideo: Fix a typo in UVC_METATADA_BUF_SIZE
Message-Id: <20190914124609.GE4734@pendragon.ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190724045612.29870-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190724045612.29870-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

Thank you for the patch.

On Wed, Jul 24, 2019 at 06:56:12AM +0200, Christophe JAILLET wrote:
> It is likely that it should be UVC_METADATA_BUF_SIZE instead.
> Fix it and use it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Oops indeed. Applied to my tree for v5.5.

> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 4 ++--
>  drivers/media/usb/uvc/uvc_queue.c    | 2 +-
>  drivers/media/usb/uvc/uvcvideo.h     | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 99bb71b47117..b6279ad7ac84 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -51,7 +51,7 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *fh,
>  	memset(fmt, 0, sizeof(*fmt));
>  
>  	fmt->dataformat = stream->meta.format;
> -	fmt->buffersize = UVC_METATADA_BUF_SIZE;
> +	fmt->buffersize = UVC_METADATA_BUF_SIZE;
>  
>  	return 0;
>  }
> @@ -72,7 +72,7 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
>  
>  	fmt->dataformat = fmeta = dev->info->meta_format
>  			? fmeta : V4L2_META_FMT_UVC;
> -	fmt->buffersize = UVC_METATADA_BUF_SIZE;
> +	fmt->buffersize = UVC_METADATA_BUF_SIZE;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index da72577c2998..cd60c6c1749e 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -79,7 +79,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  
>  	switch (vq->type) {
>  	case V4L2_BUF_TYPE_META_CAPTURE:
> -		size = UVC_METATADA_BUF_SIZE;
> +		size = UVC_METADATA_BUF_SIZE;
>  		break;
>  
>  	default:
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index c7c1baa90dea..f773dc5d802c 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -491,7 +491,7 @@ struct uvc_stats_stream {
>  	unsigned int max_sof;		/* Maximum STC.SOF value */
>  };
>  
> -#define UVC_METATADA_BUF_SIZE 1024
> +#define UVC_METADATA_BUF_SIZE 1024
>  
>  /**
>   * struct uvc_copy_op: Context structure to schedule asynchronous memcpy

-- 
Regards,

Laurent Pinchart
