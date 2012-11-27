From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 27 Nov 2012 13:14:15 +0000
Subject: Re: [PATCH v2] UVC: use GFP_ATOMIC under spin lock.
Message-Id: <2500725.v6dAOyECjO@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50ADDDD5.1080709@bfs.de> <1353808699-17224-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1353808699-17224-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, kernel-janitors@vger.kernel.org

Hi Cyril,

Thank you for the patch.

On Sunday 25 November 2012 02:58:19 Cyril Roelandt wrote:
> Found using the following semantic patch:
> <spml>
> @@
> @@
> spin_lock_irqsave(...);
> ... when != spin_unlock_irqrestore(...);
> * GFP_KERNEL
> </spml>
> 
> Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree

> ---
>  drivers/usb/gadget/uvc_video.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/uvc_video.c b/drivers/usb/gadget/uvc_video.c
> index b0e53a8..cd067a6 100644
> --- a/drivers/usb/gadget/uvc_video.c
> +++ b/drivers/usb/gadget/uvc_video.c
> @@ -309,7 +309,8 @@ uvc_video_pump(struct uvc_video *video)
>  		video->encode(req, video, buf);
> 
>  		/* Queue the USB request */
> -		if ((ret = usb_ep_queue(video->ep, req, GFP_KERNEL)) < 0) {
> +		ret = usb_ep_queue(video->ep, req, GFP_ATOMIC);
> +		if (ret < 0) {
>  			printk(KERN_INFO "Failed to queue request (%d)\n", ret);
>  			usb_ep_set_halt(video->ep);
>  			spin_unlock_irqrestore(&video->queue.irqlock, flags);
-- 
Regards,

Laurent Pinchart

