From: Alan Stern <stern@rowland.harvard.edu>
Date: Mon, 18 May 2015 14:42:12 +0000
Subject: Re: [patch] USB: devio: fix a condition in async_completed()
Message-Id: <Pine.LNX.4.44L0.1505181027580.1579-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150518122951.GA32633@mwanda>
References: <20150518122951.GA32633@mwanda>
In-Reply-To: <20150518122951.GA32633@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Oliver Neukum <oneukum@suse.de>, Chase Metzger <chasemetzger15@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 18 May 2015, Dan Carpenter wrote:

> Static checkers complain that the current condition is never true.  It
> seems pretty likely that it's a typo and "URB" was intended instead of
> "USB".
> 
> Fixes: 3d97ff63f899 ('usbdevfs: Use scatter-gather lists for large bulk transfers')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 4b0448c..986abde 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -513,7 +513,7 @@ static void async_completed(struct urb *urb)
>  	snoop(&urb->dev->dev, "urb complete\n");
>  	snoop_urb(urb->dev, as->userurb, urb->pipe, urb->actual_length,
>  			as->status, COMPLETE, NULL, 0);
> -	if ((urb->transfer_flags & URB_DIR_MASK) = USB_DIR_IN)
> +	if ((urb->transfer_flags & URB_DIR_MASK) = URB_DIR_IN)
>  		snoop_urb_data(urb, urb->actual_length);
>  
>  	if (as->status < 0 && as->bulk_addr && as->status != -ECONNRESET &&

Yes, this most certainly is a typo.  Or rather, it is a copy of a typo 
originally introduced in commit 0880aef49e40 (USB: usbfs_snoop: add 
data logging back in).

Acked-by: Alan Stern <stern@rowland.harvard.edu>

