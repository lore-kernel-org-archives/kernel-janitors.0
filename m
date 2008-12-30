From: Sarah Sharp <sarah.a.sharp@intel.com>
Date: Tue, 30 Dec 2008 23:39:00 +0000
Subject: Re: [PATCH] include/linux: Move definitions from usb.h to usb/ch9.h
Message-Id: <20081230233727.GA12819@gamba.jf.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812292247300.2265@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812292247300.2265@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, dbrownell@users.sourceforge.net, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Dec 29, 2008 at 10:48:19PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The functions:
> 
> usb_endpoint_dir_in(epd)
> usb_endpoint_dir_out(epd)
> usb_endpoint_is_bulk_in(epd)
> usb_endpoint_is_bulk_out(epd)
> usb_endpoint_is_int_in(epd)
> usb_endpoint_is_int_out(epd)
> usb_endpoint_is_isoc_in(epd)
> usb_endpoint_is_isoc_out(epd)
> usb_endpoint_num(epd)
> usb_endpoint_type(epd)
> usb_endpoint_xfer_bulk(epd)
> usb_endpoint_xfer_control(epd)
> usb_endpoint_xfer_int(epd)
> usb_endpoint_xfer_isoc(epd)
> 
> are moved from include/linux/usb.h to include/linux/usb/ch9.h.
> include/linux/usb/ch9.h makes more sense for these functions because they
> only depend on constants that are defined in this file.

I thought the include/linux/usb/ch9.h was supposed to include values that are
defined in various USB specifications (starting with the protocol "chapter 9"
from the USB 1.1 bus specification).  The constants (masks) used by these
functions aren't part of the standards, so why move these functions to
include/linux/usb/ch9.h?  Was it confusing to find these functions, or do you
have an overall plan for these changes?

Sarah Sharp
