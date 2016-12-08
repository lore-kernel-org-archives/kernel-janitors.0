From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2016 12:35:21 +0000
Subject: Re: [PATCH 2/5] staging: comedi: usbdux: Split a condition check in usbdux_alloc_usb_buffers()
Message-Id: <20161208123521.GT8176@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
 <50c7beca-40ba-6d58-5e2d-568844382bfe@users.sourceforge.net>
In-Reply-To: <50c7beca-40ba-6d58-5e2d-568844382bfe@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, Ian Abbott <abbotti@mev.co.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Dec 08, 2016 at 12:34:27PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 8 Dec 2016 10:01:54 +0100
> 
> The functions "kcalloc" and "kzalloc" were called in four cases by the
> function "usbdux_alloc_usb_buffers" without checking immediately
> if they succeded.
> This issue was detected by using the Coccinelle software.
> 
> Allocated memory was also not released if one of these function
> calls failed.
> 
> * Split a condition check for memory allocation failures.
> 
> * Add more exception handling.
> 
> Fixes: ef1e3c4a3b383c6da3979670fcb5c6e9c7de4741 ("staging: comedi: usbdux: tidy up usbdux_alloc_usb_buffers()")
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/staging/comedi/drivers/usbdux.c | 53 ++++++++++++++++++++++++++-------
>  1 file changed, 43 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/comedi/drivers/usbdux.c b/drivers/staging/comedi/drivers/usbdux.c
> index f4f05d29d30d..d7d683bd669c 100644
> --- a/drivers/staging/comedi/drivers/usbdux.c
> +++ b/drivers/staging/comedi/drivers/usbdux.c
> @@ -1449,24 +1449,35 @@ static int usbdux_alloc_usb_buffers(struct comedi_device *dev)
>  	struct usb_device *usb = comedi_to_usb_dev(dev);
>  	struct usbdux_private *devpriv = dev->private;
>  	struct urb *urb;
> -	int i;
> +	int i, x;
>  
>  	devpriv->dux_commands = kzalloc(SIZEOFDUXBUFFER, GFP_KERNEL);
> +	if (!devpriv->dux_commands)
> +		return -ENOMEM;
> +
>  	devpriv->in_buf = kzalloc(SIZEINBUF, GFP_KERNEL);
> +	if (!devpriv->in_buf)
> +		goto free_commands;
> +
>  	devpriv->insn_buf = kzalloc(SIZEINSNBUF, GFP_KERNEL);
> +	if (!devpriv->insn_buf)
> +		goto free_in_buf;
> +
>  	devpriv->ai_urbs = kcalloc(devpriv->n_ai_urbs, sizeof(void *),
>  				   GFP_KERNEL);
> +	if (!devpriv->ai_urbs)
> +		goto free_insn_buf;
> +
>  	devpriv->ao_urbs = kcalloc(devpriv->n_ao_urbs, sizeof(void *),
>  				   GFP_KERNEL);
> -	if (!devpriv->dux_commands || !devpriv->in_buf || !devpriv->insn_buf ||
> -	    !devpriv->ai_urbs || !devpriv->ao_urbs)
> -		return -ENOMEM;
> +	if (!devpriv->ao_urbs)
> +		goto free_ai_urbs;
>  
>  	for (i = 0; i < devpriv->n_ai_urbs; i++) {
>  		/* one frame: 1ms */
>  		urb = usb_alloc_urb(1, GFP_KERNEL);
>  		if (!urb)
> -			return -ENOMEM;
> +			goto free_n_ai_urbs;
>  		devpriv->ai_urbs[i] = urb;
>  
>  		urb->dev = usb;
> @@ -1475,7 +1486,7 @@ static int usbdux_alloc_usb_buffers(struct comedi_device *dev)
>  		urb->transfer_flags = URB_ISO_ASAP;
>  		urb->transfer_buffer = kzalloc(SIZEINBUF, GFP_KERNEL);
>  		if (!urb->transfer_buffer)
> -			return -ENOMEM;
> +			goto free_n_ai_urbs;
>  
>  		urb->complete = usbduxsub_ai_isoc_irq;
>  		urb->number_of_packets = 1;
> @@ -1488,7 +1499,7 @@ static int usbdux_alloc_usb_buffers(struct comedi_device *dev)
>  		/* one frame: 1ms */
>  		urb = usb_alloc_urb(1, GFP_KERNEL);
>  		if (!urb)
> -			return -ENOMEM;
> +			goto free_n_ao_urbs;
>  		devpriv->ao_urbs[i] = urb;
>  
>  		urb->dev = usb;
> @@ -1497,7 +1508,7 @@ static int usbdux_alloc_usb_buffers(struct comedi_device *dev)
>  		urb->transfer_flags = URB_ISO_ASAP;
>  		urb->transfer_buffer = kzalloc(SIZEOUTBUF, GFP_KERNEL);
>  		if (!urb->transfer_buffer)
> -			return -ENOMEM;
> +			goto free_n_ao_urbs;
>  
>  		urb->complete = usbduxsub_ao_isoc_irq;
>  		urb->number_of_packets = 1;
> @@ -1514,17 +1525,39 @@ static int usbdux_alloc_usb_buffers(struct comedi_device *dev)
>  	if (devpriv->pwm_buf_sz) {
>  		urb = usb_alloc_urb(0, GFP_KERNEL);
>  		if (!urb)
> -			return -ENOMEM;
> +			goto free_n_ao_urbs;
>  		devpriv->pwm_urb = urb;
>  
>  		/* max bulk ep size in high speed */
>  		urb->transfer_buffer = kzalloc(devpriv->pwm_buf_sz,
>  					       GFP_KERNEL);
>  		if (!urb->transfer_buffer)
> -			return -ENOMEM;
> +			goto free_pwm_urb;
>  	}
>  
>  	return 0;
> +free_pwm_urb:
> +	usb_free_urb(urb);
> +free_n_ao_urbs:
> +	for (x = 0; x < i; ++x) {
> +		kfree(devpriv->ao_urbs[x]->transfer_buffer);
> +		usb_free_urb(devpriv->ao_urbs[x]);
> +	}
> +free_n_ai_urbs:
> +	for (x = 0; x < i; ++x) {
> +		kfree(devpriv->ai_urbs[x]->transfer_buffer);
> +		usb_free_urb(devpriv->ai_urbs[x]);
> +	}

This is buggy.  We re-use i for two loops so if it fails part way
through allocating ->ao_urbs[] then we don't free all the ->ai_urbs[].
Also the use of "x" as a generic iterator name is not idiomatic.

Better to change the first loop to use n_ai and the second to use n_ao
as iterators.  Then use i as an iterator to free them.

regards,
dan carpenter


> +	kfree(devpriv->ao_urbs);
> +free_ai_urbs:
> +	kfree(devpriv->ai_urbs);
> +free_insn_buf:
> +	kfree(devpriv->insn_buf);
> +free_in_buf:
> +	kfree(devpriv->in_buf);
> +free_commands:
> +	kfree(devpriv->dux_commands);
> +	return -ENOMEM;
>  }
>  
>  static void usbdux_free_usb_buffers(struct comedi_device *dev)
> -- 
> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
