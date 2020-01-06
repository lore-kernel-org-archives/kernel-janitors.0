From: <Cristian.Birsan@microchip.com>
Date: Mon, 06 Jan 2020 11:16:05 +0000
Subject: Re: [PATCH 04/16] usb: gadget: udc: atmel: constify copied structure
Message-Id: <d81c389b-f377-8ff0-7206-70c9b9a01f4a@microchip.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
 <1577864614-5543-5-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-5-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@inria.fr
Cc: balbi@kernel.org, alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com, linux-arm-kernel@lists.infradead.org


On 1/1/20 9:43 AM, Julia Lawall wrote:

> The usba_gadget_template structure is only copied into another
> structure, so make it const.
> 
> The opportunity for this change was found using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Acked-by: Cristian Birsan <cristian.birsan@microchip.com>

> 
> ---
>   drivers/usb/gadget/udc/atmel_usba_udc.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
> index 8a42768e3213..6e0432141c40 100644
> --- a/drivers/usb/gadget/udc/atmel_usba_udc.c
> +++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
> @@ -1122,7 +1122,7 @@ static struct usb_endpoint_descriptor usba_ep0_desc = {
>          .bInterval = 1,
>   };
> 
> -static struct usb_gadget usba_gadget_template = {
> +static const struct usb_gadget usba_gadget_template = {
>          .ops            = &usba_udc_ops,
>          .max_speed      = USB_SPEED_HIGH,
>          .name           = "atmel_usba_udc",
> 
