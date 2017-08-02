From: Leo Li <leoyang.li@nxp.com>
Date: Wed, 02 Aug 2017 18:54:58 +0000
Subject: RE: [PATCH] usb: gadget: fsl_qe_udc: constify qe_ep0_desc
Message-Id: <AM4PR0401MB1699B3AAF1609CB04AF01E668FB00@AM4PR0401MB1699.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501687767-12768-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501687767-12768-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bhumika Goyal <bhumirks@gmail.com>



> -----Original Message-----
> From: Julia Lawall [mailto:Julia.Lawall@lip6.fr]
> Sent: Wednesday, August 02, 2017 10:29 AM
> To: Leo Li <leoyang.li@nxp.com>
> Cc: kernel-janitors@vger.kernel.org; Felipe Balbi <balbi@kernel.org>; Greg
> Kroah-Hartman <gregkh@linuxfoundation.org>; linux-usb@vger.kernel.org;
> linuxppc-dev@lists.ozlabs.org; linux-kernel@vger.kernel.org; Bhumika Goyal
> <bhumirks@gmail.com>
> Subject: [PATCH] usb: gadget: fsl_qe_udc: constify qe_ep0_desc
> 
> qe_ep0_desc is only passed as the second argument to qe_ep_init, which is
> const, so qe_ep0_desc can be const too.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Li Yang <leoyang.li@nxp.com>

> 
> ---
> I got a lot of warnings when compiling this file, but none seemed to be related
> to the change.
> 
>  drivers/usb/gadget/udc/fsl_qe_udc.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c
> b/drivers/usb/gadget/udc/fsl_qe_udc.c
> index 303328ce..a3e72d6 100644
> --- a/drivers/usb/gadget/udc/fsl_qe_udc.c
> +++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
> @@ -62,7 +62,7 @@
>  	"ep3",
>  };
> 
> -static struct usb_endpoint_descriptor qe_ep0_desc = {
> +static const struct usb_endpoint_descriptor qe_ep0_desc = {
>  	.bLength =		USB_DT_ENDPOINT_SIZE,
>  	.bDescriptorType =	USB_DT_ENDPOINT,
> 

