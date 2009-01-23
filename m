From: Felipe Balbi <me@felipebalbi.com>
Date: Fri, 23 Jan 2009 17:31:36 +0000
Subject: Re: [PATCH 12/13] drivers/usb/musb: use USB API functions rather
Message-Id: <20090123173135.GR440@frodo>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812291123050.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812291123050.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: felipe.balbi@nokia.com, linux-usb@vger.kernel.org, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Dec 29, 2008 at 11:23:22AM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> This set of patches introduces calls to the following set of functions:
> 
> usb_endpoint_dir_in(epd)
> usb_endpoint_dir_out(epd)
> usb_endpoint_is_bulk_in(epd)
> usb_endpoint_is_bulk_out(epd)
> usb_endpoint_is_int_in(epd)
> usb_endpoint_is_int_out(epd)
> usb_endpoint_num(epd)
> usb_endpoint_type(epd)
> usb_endpoint_xfer_bulk(epd)
> usb_endpoint_xfer_control(epd)
> usb_endpoint_xfer_int(epd)
> usb_endpoint_xfer_isoc(epd)
> 
> In some cases, introducing one of these functions is not possible, and it
> just replaces an explicit integer value by one of the following constants:
> 
> USB_ENDPOINT_XFER_BULK
> USB_ENDPOINT_XFER_CONTROL
> USB_ENDPOINT_XFER_INT
> USB_ENDPOINT_XFER_ISOC
> 
> An extract of the semantic patch that makes these changes is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @r1@ struct usb_endpoint_descriptor *epd; @@
> 
> - ((epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\)) =
> - \(USB_ENDPOINT_XFER_CONTROL\|0\))
> + usb_endpoint_xfer_control(epd)
> 
> @r5@ struct usb_endpoint_descriptor *epd; @@
> 
> - ((epd->bEndpointAddress & \(USB_ENDPOINT_DIR_MASK\|0x80\)) =
> -  \(USB_DIR_IN\|0x80\))
> + usb_endpoint_dir_in(epd)
> 
> @inc@
> @@
> 
> #include <linux/usb.h>
> 
> @depends on !inc && (r1||r5)@
> @@
> 
> + #include <linux/usb.h>
>   #include <linux/usb/...>
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Felipe Balbi <felipe.balbi@nokia.com>

> ---
>  drivers/usb/musb/musb_gadget.c |    6 +++---
>  drivers/usb/musb/musb_host.c   |    4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
> index 6197dae..4ea3053 100644
> --- a/drivers/usb/musb/musb_gadget.c
> +++ b/drivers/usb/musb/musb_gadget.c
> @@ -874,10 +874,10 @@ static int musb_gadget_enable(struct usb_ep *ep,
>  		status = -EBUSY;
>  		goto fail;
>  	}
> -	musb_ep->type = desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK;
> +	musb_ep->type = usb_endpoint_type(desc);
>  
>  	/* check direction and (later) maxpacket size against endpoint */
> -	if ((desc->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK) != epnum)
> +	if (usb_endpoint_num(desc) != epnum)
>  		goto fail;
>  
>  	/* REVISIT this rules out high bandwidth periodic transfers */
> @@ -890,7 +890,7 @@ static int musb_gadget_enable(struct usb_ep *ep,
>  	 * packet size (or fail), set the mode, clear the fifo
>  	 */
>  	musb_ep_select(mbase, epnum);
> -	if (desc->bEndpointAddress & USB_DIR_IN) {
> +	if (usb_endpoint_dir_in(desc)) {
>  		u16 int_txe = musb_readw(mbase, MUSB_INTRTXE);
>  
>  		if (hw_ep->is_shared_fifo)
> diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
> index 99fa612..a035cec 100644
> --- a/drivers/usb/musb/musb_host.c
> +++ b/drivers/usb/musb/musb_host.c
> @@ -1847,8 +1847,8 @@ static int musb_urb_enqueue(
>  		goto done;
>  	}
>  
> -	qh->epnum = epd->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK;
> -	qh->type = epd->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK;
> +	qh->epnum = usb_endpoint_num(epd);
> +	qh->type = usb_endpoint_type(epd);
>  
>  	/* NOTE: urb->dev->devnum is wrong during SET_ADDRESS */
>  	qh->addr_reg = (u8) usb_pipedevice(urb->pipe);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
balbi
