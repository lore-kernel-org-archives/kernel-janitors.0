From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Wed, 18 Apr 2012 07:12:53 +0000
Subject: Re: [patch 2/2] target: usb-gadget: cleanup duplicate initialization
Message-Id: <1334733173.15333.2.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120417063215.GE26756@elgon.mountain>
In-Reply-To: <20120417063215.GE26756@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2012-04-17 at 09:32 +0300, Dan Carpenter wrote:
> Sparse points out that we initialize .bAlternateSetting twice.  But
> fortunately USB_G_ALT_INT_BBB is zero so we initialize it to the same
> value both times.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/target/usb-gadget/usb_gadget.c b/drivers/target/usb-gadget/usb_gadget.c
> index ba62bef..78aa37e 100644
> --- a/drivers/target/usb-gadget/usb_gadget.c
> +++ b/drivers/target/usb-gadget/usb_gadget.c
> @@ -1977,7 +1977,6 @@ static void usbg_deregister_configfs(void)
>  static struct usb_interface_descriptor bot_intf_desc = {
>  	.bLength =              sizeof(bot_intf_desc),
>  	.bDescriptorType =      USB_DT_INTERFACE,
> -	.bAlternateSetting =	0,
>  	.bNumEndpoints =        2,
>  	.bAlternateSetting =	USB_G_ALT_INT_BBB,
>  	.bInterfaceClass =      USB_CLASS_MASS_STORAGE,
> --

Applied.  Thanks DanC!

--nab

