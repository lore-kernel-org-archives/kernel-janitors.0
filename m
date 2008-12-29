From: David Brownell <david-b@pacbell.net>
Date: Mon, 29 Dec 2008 21:01:11 +0000
Subject: Re: [PATCH 10/13] drivers/usb/gadget: use USB API functions rather than constants
Message-Id: <200812291301.11438.david-b@pacbell.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.44L0.0812291452580.1979-100000@iolanthe.rowland.org> <200812291222.48966.david-b@pacbell.net> <495937C3.7090101@gmail.com>
In-Reply-To: <495937C3.7090101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Daiker <daikerjohn@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Julia Lawall <julia@diku.dk>, gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Monday 29 December 2008, John Daiker wrote:
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

Also usb_endpoint_is_isoc_{in,out}() ...

 
> If that's the case, then I'll be glad to cook up a patch! :)

I think Julia just signed up for that ...

- Dave

