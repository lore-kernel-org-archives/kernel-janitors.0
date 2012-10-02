From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Tue, 02 Oct 2012 20:24:05 +0000
Subject: Re: [patch 1/2] target: remove duplicate initialization
Message-Id: <1349209445.28145.62.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002082739.GF12398@elgon.mountain>
In-Reply-To: <20121002082739.GF12398@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2012-10-02 at 11:27 +0300, Dan Carpenter wrote:
> We set bAlternateSetting to zero twice.  I kept the second one
> (.bAlternateSetting = USB_G_ALT_INT_BBB) because that's more
> descriptive.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/gadget/tcm_usb_gadget.c b/drivers/usb/gadget/tcm_usb_gadget.c
> index 0a83801..1ad4a69 100644
> --- a/drivers/usb/gadget/tcm_usb_gadget.c
> +++ b/drivers/usb/gadget/tcm_usb_gadget.c
> @@ -1956,7 +1956,6 @@ static void usbg_deregister_configfs(void)
>  static struct usb_interface_descriptor bot_intf_desc = {
>  	.bLength =              sizeof(bot_intf_desc),
>  	.bDescriptorType =      USB_DT_INTERFACE,
> -	.bAlternateSetting =	0,
>  	.bNumEndpoints =        2,
>  	.bAlternateSetting =	USB_G_ALT_INT_BBB,
>  	.bInterfaceClass =      USB_CLASS_MASS_STORAGE,
> --

Looks fine, applied to target-pending/for-next

Thanks Dan!

--nab

