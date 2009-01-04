From: Wim Van Sebroeck <wim@iguana.be>
Date: Sun, 04 Jan 2009 18:19:23 +0000
Subject: Re: [PATCH 13/13] drivers/watchdog: use USB API functions rather than constants
Message-Id: <20090104181923.GY11454@infomag.infomag.iguana.be>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812291123240.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812291123240.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Julia,

> diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
> index afb0896..b5320a8 100644
> --- a/drivers/watchdog/pcwd_usb.c
> +++ b/drivers/watchdog/pcwd_usb.c
> @@ -609,9 +609,7 @@ static int usb_pcwd_probe(struct usb_interface *interface, const struct usb_devi
>  	/* check out the endpoint: it has to be Interrupt & IN */
>  	endpoint = &iface_desc->endpoint[0].desc;
>  
> -	if (!((endpoint->bEndpointAddress & USB_DIR_IN) &&
> -	     ((endpoint->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK)
> -				= USB_ENDPOINT_XFER_INT))) {
> +	if (!usb_endpoint_is_int_in(endpoint)) {
>  		/* we didn't find a Interrupt endpoint with direction IN */
>  		printk(KERN_ERR PFX "Couldn't find an INTR & IN endpoint\n");
>  		return -ENODEV;

Seems OK. I will test it this week and let you know.

Kind regards,
Wim.

