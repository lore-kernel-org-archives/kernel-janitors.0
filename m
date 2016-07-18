From: Peter Chen <hzpeterchen@gmail.com>
Date: Mon, 18 Jul 2016 01:50:23 +0000
Subject: Re: [patch] usb: gadget: fsl_qe_udc: signedness bug in qe_get_frame()
Message-Id: <20160718015023.GA31293@shlinux2>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715111547.GF9258@mwanda>
In-Reply-To: <20160715111547.GF9258@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Li Yang <leoli@freescale.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Fri, Jul 15, 2016 at 02:15:47PM +0300, Dan Carpenter wrote:
> We can't assign -EINVAL to a u16.
> 
> Fixes: 3948f0e0c999 ('usb: add Freescale QE/CPM USB peripheral controller driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
> index 93d28cb..901366f 100644
> --- a/drivers/usb/gadget/udc/fsl_qe_udc.c
> +++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
> @@ -1878,11 +1878,8 @@ static int qe_get_frame(struct usb_gadget *gadget)
>  
>  	tmp = in_be16(&udc->usb_param->frame_n);
>  	if (tmp & 0x8000)
> -		tmp = tmp & 0x07ff;
> -	else
> -		tmp = -EINVAL;
> -
> -	return (int)tmp;
> +		return tmp & 0x07ff;
> +	return -EINVAL;
>  }

Acked-by: Peter Chen <peter.chen@nxp.com>
>  
>  static int fsl_qe_start(struct usb_gadget *gadget,
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 

Best Regards,
Peter Chen
