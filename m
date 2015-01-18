From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Sun, 18 Jan 2015 23:52:41 +0000
Subject: Re: [patch 1/6] usb: gadget: uvc: fix some error codes
Message-Id: <17997359.TW9fNDsBGr@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150114205948.GA23203@mwanda>
In-Reply-To: <20150114205948.GA23203@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Wednesday 14 January 2015 23:59:48 Dan Carpenter wrote:
> We're basically saying ERR_CAST(NULL) and PTR_ERR(NULL) here, which is
> nonsensical.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> diff --git a/drivers/usb/gadget/function/uvc_configfs.c
> b/drivers/usb/gadget/function/uvc_configfs.c index 33d92ab..d112c99 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -148,7 +148,7 @@ static struct config_item
> *uvcg_control_header_make(struct config_group *group,
> 
>  	h = kzalloc(sizeof(*h), GFP_KERNEL);
>  	if (!h)
> -		return ERR_CAST(h);
> +		return ERR_PTR(-ENOMEM);
> 
>  	h->desc.bLength			= UVC_DT_HEADER_SIZE(1);
>  	h->desc.bDescriptorType		= USB_DT_CS_INTERFACE;
> @@ -840,7 +840,7 @@ static int uvcg_streaming_header_allow_link(struct
> config_item *src,
> 
>  	format_ptr = kzalloc(sizeof(*format_ptr), GFP_KERNEL);
>  	if (!format_ptr) {
> -		ret = PTR_ERR(format_ptr);
> +		ret = -ENOMEM;
>  		goto out;
>  	}
>  	ret = 0;
> @@ -960,7 +960,7 @@ static struct config_item
> 
>  	h = kzalloc(sizeof(*h), GFP_KERNEL);
>  	if (!h)
> -		return ERR_CAST(h);
> +		return ERR_PTR(-ENOMEM);
> 
>  	INIT_LIST_HEAD(&h->formats);
>  	h->desc.bDescriptorType		= USB_DT_CS_INTERFACE;
> @@ -1278,7 +1278,7 @@ static struct config_item *uvcg_frame_make(struct
> config_group *group,
> 
>  	h = kzalloc(sizeof(*h), GFP_KERNEL);
>  	if (!h)
> -		return ERR_CAST(h);
> +		return ERR_PTR(-ENOMEM);
> 
>  	h->frame.b_descriptor_type		= USB_DT_CS_INTERFACE;
>  	h->frame.b_frame_index			= 1;
> @@ -1563,7 +1563,7 @@ static struct config_group
> *uvcg_uncompressed_make(struct config_group *group,
> 
>  	h = kzalloc(sizeof(*h), GFP_KERNEL);
>  	if (!h)
> -		return ERR_CAST(h);
> +		return ERR_PTR(-ENOMEM);
> 
>  	h->desc.bLength			= UVC_DT_FORMAT_UNCOMPRESSED_SIZE;
>  	h->desc.bDescriptorType		= USB_DT_CS_INTERFACE;
> @@ -1772,7 +1772,7 @@ static struct config_group *uvcg_mjpeg_make(struct
> config_group *group,
> 
>  	h = kzalloc(sizeof(*h), GFP_KERNEL);
>  	if (!h)
> -		return ERR_CAST(h);
> +		return ERR_PTR(-ENOMEM);
> 
>  	h->desc.bLength			= UVC_DT_FORMAT_MJPEG_SIZE;
>  	h->desc.bDescriptorType		= USB_DT_CS_INTERFACE;
> @@ -2124,7 +2124,7 @@ static int uvcg_streaming_class_allow_link(struct
> config_item *src, count += 2; /* color_matching, NULL */
>  	*class_array = kcalloc(count, sizeof(void *), GFP_KERNEL);
>  	if (!*class_array) {
> -		ret = PTR_ERR(*class_array);
> +		ret = -ENOMEM;
>  		goto unlock;
>  	}

-- 
Regards,

Laurent Pinchart

