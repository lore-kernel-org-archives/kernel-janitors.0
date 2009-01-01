From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 01 Jan 2009 09:37:53 +0000
Subject: Re: [PATCH 11/13] sound/usb: use USB API functions rather than constants
Message-Id: <s5hiqozz7ri.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812291122420.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812291122420.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, gregkh@suse.de, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Mon, 29 Dec 2008 11:23:02 +0100 (CET),
Julia Lawall wrote:
> 
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

Applied now.  Thanks.


Takashi
