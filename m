From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 10 Feb 2008 21:12:03 +0000
Subject: Re: [PATCH 7/8] drivers/usb: Use FIELD_SIZEOF
Message-Id: <20080210211203.GD1754@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802102114330.23906@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0802102114330.23906@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, linux-usb-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Feb 10, 2008 at 09:15:09PM +0100, Julia Lawall wrote:
> --- a/drivers/usb/atm/usbatm.c
> +++ b/drivers/usb/atm/usbatm.c
> @@ -1349,7 +1349,7 @@ static int __init usbatm_usb_init(void)
>  {
>  	dbg("%s: driver version %s", __func__, DRIVER_VERSION);
>  
> -	if (sizeof(struct usbatm_control) > sizeof(((struct sk_buff *) 0)->cb)) {
> +	if (sizeof(struct usbatm_control) > FIELD_SIZEOF(struct sk_buff, cb)) {

NAK. Driver should BUILD_BUG_ON instead.

>  		printk(KERN_ERR "%s unusable with this kernel!\n", usbatm_driver_name);
>  		return -EIO;
>  	}
