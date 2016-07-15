From: Peter Chen <hzpeterchen@gmail.com>
Date: Fri, 15 Jul 2016 06:34:29 +0000
Subject: Re: [patch] usb: gadget: fsl_qe_udc: off by one in setup_received_handle()
Message-Id: <20160715063429.GD817@shlinux2>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713101433.GI29468@mwanda>
In-Reply-To: <20160713101433.GI29468@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Li Yang <leoli@freescale.com>, Xie Xiaobo <X.Xie@freescale.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Wed, Jul 13, 2016 at 01:14:33PM +0300, Dan Carpenter wrote:
> The udc->eps[] array has USB_MAX_ENDPOINTS elements so > should be >=.
> 
> Fixes: 3948f0e0c999 ('usb: add Freescale QE/CPM USB peripheral controller driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
> index 93d28cb..cf8819a 100644
> --- a/drivers/usb/gadget/udc/fsl_qe_udc.c
> +++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
> @@ -2053,7 +2053,7 @@ static void setup_received_handle(struct qe_udc *udc,
>  			struct qe_ep *ep;
>  
>  			if (wValue != 0 || wLength != 0
> -				|| pipe > USB_MAX_ENDPOINTS)
> +				|| pipe >= USB_MAX_ENDPOINTS)
>  				break;
>  			ep = &udc->eps[pipe];
>  

Acked-by: Peter Chen <peter.chen@nxp.com>

-- 

Best Regards,
Peter Chen
