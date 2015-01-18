From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Sun, 18 Jan 2015 23:56:33 +0000
Subject: Re: [patch 4/6] usb: gadget: uvc: memory leak in uvcg_frame_make()
Message-Id: <47389617.hboloCg8JV@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150114210308.GD23203@mwanda>
In-Reply-To: <20150114210308.GD23203@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Thursday 15 January 2015 00:03:08 Dan Carpenter wrote:
> We need to add a kfree(h) on an error path.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> diff --git a/drivers/usb/gadget/function/uvc_configfs.c
> b/drivers/usb/gadget/function/uvc_configfs.c index 738d68f..1af2686 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -1300,6 +1300,7 @@ static struct config_item *uvcg_frame_make(struct
> config_group *group, h->fmt_type = UVCG_MJPEG;
>  	} else {
>  		mutex_unlock(&opts->lock);
> +		kfree(h);
>  		return ERR_PTR(-EINVAL);
>  	}
>  	++fmt->num_frames;

-- 
Regards,

Laurent Pinchart

