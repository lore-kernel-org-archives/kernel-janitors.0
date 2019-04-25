From: shuah <shuah@kernel.org>
Date: Thu, 25 Apr 2019 23:09:43 +0000
Subject: Re: [PATCH] usbip: stub_rx: tidy the indenting in is_clear_halt_cmd()
Message-Id: <e13158e8-296f-bcef-eb03-0ef0ef735a1d@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190424095414.GB16664@mwanda>
In-Reply-To: <20190424095414.GB16664@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Valentina Manea <valentina.manea.m@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, shuah <shuah@kernel.org>

On 4/24/19 3:54 AM, Dan Carpenter wrote:
> There is an extra space character before the return statement.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 97b09a42a10c..f3230bed18af 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -17,9 +17,9 @@ static int is_clear_halt_cmd(struct urb *urb)
>   
>   	req = (struct usb_ctrlrequest *) urb->setup_packet;
>   
> -	 return (req->bRequest = USB_REQ_CLEAR_FEATURE) &&
> -		 (req->bRequestType = USB_RECIP_ENDPOINT) &&
> -		 (req->wValue = USB_ENDPOINT_HALT);
> +	return (req->bRequest = USB_REQ_CLEAR_FEATURE) &&
> +	       (req->bRequestType = USB_RECIP_ENDPOINT) &&
> +	       (req->wValue = USB_ENDPOINT_HALT);
>   }
>   
>   static int is_set_interface_cmd(struct urb *urb)
> 

Thanks for the patch.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
