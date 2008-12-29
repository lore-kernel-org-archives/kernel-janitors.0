From: Alan Stern <stern@rowland.harvard.edu>
Date: Mon, 29 Dec 2008 15:27:28 +0000
Subject: Re: [PATCH 10/13] drivers/usb/gadget: use USB API functions rather
Message-Id: <Pine.LNX.4.44L0.0812291025220.2250-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0812291122180.9555@pc-004.diku.dk>
References: <Pine.LNX.4.64.0812291122180.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812291122180.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, dbrownell@users.sourceforge.net, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 29 Dec 2008, Julia Lawall wrote:

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

...

> drivers/usb/gadget/file_storage.c   |    1 +

...

> diff --git a/drivers/usb/gadget/file_storage.c b/drivers/usb/gadget/file_storage.c
> index 88fedd0..c44092b 100644
> --- a/drivers/usb/gadget/file_storage.c
> +++ b/drivers/usb/gadget/file_storage.c
> @@ -248,6 +248,7 @@
>  #include <linux/freezer.h>
>  #include <linux/utsname.h>
>  
> +#include <linux/usb.h>
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>

While there's nothing wrong with this part of the patch, it hardly 
seems necessary.  Was there any reason for including it?

Alan Stern

