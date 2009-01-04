From: Takashi Iwai <tiwai@suse.de>
Date: Sun, 04 Jan 2009 11:24:20 +0000
Subject: Re: [PATCH 2/2] sound/usb: Use negated usb_endpoint_xfer_control, etc
Message-Id: <s5hhc4f2u1n.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0901031753120.9811@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0901031753120.9811@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, gregkh@suse.de, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Sat, 3 Jan 2009 17:54:53 +0100 (CET),
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> This patch extends 42a6e66f1e40a930d093c33ba0bb9d8d8e4555ed by using
> usb_endpoint_xfer_control, usb_endpoint_xfer_isoc, usb_endpoint_xfer_bulk,
> and usb_endpoint_xfer_int in the negated case as well.
> 
> This patch also rewrites some calls to usb_endpoint_dir_in as negated calls
> to !usb_endpoint_dir_out, and vice versa, to better correspond to the
> intent of the original code.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@ struct usb_endpoint_descriptor *epd; @@
> 
> - (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_CONTROL\|0\))
> + !usb_endpoint_xfer_control(epd)
> 
> @@ struct usb_endpoint_descriptor *epd; @@
> 
> - (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_ISOC\|1\))
> + !usb_endpoint_xfer_isoc(epd)
> 
> @@ struct usb_endpoint_descriptor *epd; @@
> 
> - (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_BULK\|2\))
> + !usb_endpoint_xfer_bulk(epd)
> 
> @@ struct usb_endpoint_descriptor *epd; @@
> 
> - (usb_endpoint_type(epd) != \(USB_ENDPOINT_XFER_INT\|3\))
> + !usb_endpoint_xfer_int(epd)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied now.  Thanks.


Takashi
