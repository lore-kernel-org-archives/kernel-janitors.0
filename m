From: walter harms <wharms@bfs.de>
Date: Thu, 22 Nov 2012 08:09:57 +0000
Subject: Re: [PATCH] UVC: use GFP_ATOMIC under spin lock.
Message-Id: <50ADDDD5.1080709@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1353360842-18384-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1353360842-18384-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, laurent.pinchart@ideasonboard.com, kernel-janitors@vger.kernel.org



Am 19.11.2012 22:34, schrieb Cyril Roelandt:
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
> ---
>  drivers/usb/gadget/uvc_video.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/uvc_video.c b/drivers/usb/gadget/uvc_video.c
> index b0e53a8..79b4132 100644
> --- a/drivers/usb/gadget/uvc_video.c
> +++ b/drivers/usb/gadget/uvc_video.c
> @@ -309,7 +309,7 @@ uvc_video_pump(struct uvc_video *video)
>  		video->encode(req, video, buf);
>  
>  		/* Queue the USB request */
> -		if ((ret = usb_ep_queue(video->ep, req, GFP_KERNEL)) < 0) {
> +		if ((ret = usb_ep_queue(video->ep, req, GFP_ATOMIC)) < 0) {
>  			printk(KERN_INFO "Failed to queue request (%d)\n", ret);
>  			usb_ep_set_halt(video->ep);
>  			spin_unlock_irqrestore(&video->queue.irqlock, flags);


IMHO, this should be two lines, aka:

ret = usb_ep_queue(video->ep, req, GFP_KERNEL);
if (ret<0)

just my two cents,

re,
 wh
