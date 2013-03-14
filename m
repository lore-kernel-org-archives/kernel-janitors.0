From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 14 Mar 2013 14:09:46 +0000
Subject: Re: [patch] usb gadget: uvc: use capped length value
Message-Id: <3248328.OlbB3viqWQ@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130314080105.GA30808@longonot.mountain>
In-Reply-To: <20130314080105.GA30808@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for the patch.

On Thursday 14 March 2013 11:01:05 Dan Carpenter wrote:
> "req->length" is a capped version of "data->length".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Felipe, could you please pick this one up (I can of course send you a pull 
request if preferred) ?

> ---
> Static analysis.  I have not tested this.
> 
> diff --git a/drivers/usb/gadget/uvc_v4l2.c b/drivers/usb/gadget/uvc_v4l2.c
> index 2ca9386..8770cf0 100644
> --- a/drivers/usb/gadget/uvc_v4l2.c
> +++ b/drivers/usb/gadget/uvc_v4l2.c
> @@ -43,7 +43,7 @@ uvc_send_response(struct uvc_device *uvc, struct
> uvc_request_data *data) req->zero = data->length < uvc->event_length;
>  	req->dma = DMA_ADDR_INVALID;
> 
> -	memcpy(req->buf, data->data, data->length);
> +	memcpy(req->buf, data->data, req->length);
> 
>  	return usb_ep_queue(cdev->gadget->ep0, req, GFP_KERNEL);
>  }

-- 
Regards,

Laurent Pinchart

