From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 30 Oct 2018 18:54:10 +0000
Subject: Re: [PATCH 1/2] usb: gadget: uvc: constify vb2_ops structure
Message-Id: <1946389.baEqsO8ef2@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540913482-22130-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540913482-22130-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Julia,

Thank you for the patch.

On Tuesday, 30 October 2018 17:31:21 EET Julia Lawall wrote:
> The vb2_ops structure can be const as it is only stored in the ops
> field of a vb2_queue structure and this field is const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
>  drivers/usb/gadget/function/uvc_queue.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_queue.c
> b/drivers/usb/gadget/function/uvc_queue.c index 9e33d5206d54..526a10a33094
> 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -102,7 +102,7 @@ static void uvc_buffer_queue(struct vb2_buffer *vb)
>  	spin_unlock_irqrestore(&queue->irqlock, flags);
>  }
> 
> -static struct vb2_ops uvc_queue_qops = {
> +static const struct vb2_ops uvc_queue_qops = {
>  	.queue_setup = uvc_queue_setup,
>  	.buf_prepare = uvc_buffer_prepare,
>  	.buf_queue = uvc_buffer_queue,

-- 
Regards,

Laurent Pinchart
