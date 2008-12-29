From: Alan Stern <stern@rowland.harvard.edu>
Date: Mon, 29 Dec 2008 21:01:13 +0000
Subject: Re: [PATCH 10/13] drivers/usb/gadget: use USB API functions rather
Message-Id: <Pine.LNX.4.44L0.0812291558120.2176-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <495937C3.7090101@gmail.com>
References: <Pine.LNX.4.64.0812291122180.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812291122180.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Daiker <daikerjohn@gmail.com>
Cc: David Brownell <david-b@pacbell.net>, Julia Lawall <julia@diku.dk>, gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 29 Dec 2008, John Daiker wrote:

> So you're saying that these functions:
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
> Should be defined in ch9.h instead of usb.h?

Yes.  Also usb_endpoint_is_isoc_in(epd) and 
usb_endpoint_is_isoc_out(epd).

> If that's the case, then I'll be glad to cook up a patch! :)

Good, thank you.

Alan Stern

