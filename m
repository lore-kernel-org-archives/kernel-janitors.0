From: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Date: Fri, 23 Aug 2019 14:55:45 +0000
Subject: Re: [PATCH] staging: vt6656: Use common error handling code in vnt_alloc_bufs()
Message-Id: <20190823145540.GA2536@qd-ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <91e8a9b7-e79d-dafc-10b8-dd79eb59eff9@web.de>
In-Reply-To: <91e8a9b7-e79d-dafc-10b8-dd79eb59eff9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, Aug 23, 2019 at 03:30:11PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 23 Aug 2019 15:15:41 +0200
> 
> Adjust jump targets so that a bit of exception handling can be better
> reused at the end of this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/staging/vt6656/main_usb.c | 46 +++++++++++++------------------
>  1 file changed, 19 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
> index 856ba97aec4f..d9f14da37bbc 100644
> --- a/drivers/staging/vt6656/main_usb.c
> +++ b/drivers/staging/vt6656/main_usb.c
> @@ -443,10 +443,8 @@ static int vnt_alloc_bufs(struct vnt_private *priv)
> 
>  	for (ii = 0; ii < priv->num_tx_context; ii++) {
>  		tx_context = kmalloc(sizeof(*tx_context), GFP_KERNEL);
> -		if (!tx_context) {
> -			ret = -ENOMEM;
> -			goto free_tx;
> -		}
> +		if (!tx_context)
> +			goto e_nomem_tx;
> 
>  		priv->tx_context[ii] = tx_context;
>  		tx_context->priv = priv;
> @@ -454,20 +452,16 @@ static int vnt_alloc_bufs(struct vnt_private *priv)
> 
>  		/* allocate URBs */
>  		tx_context->urb = usb_alloc_urb(0, GFP_KERNEL);
> -		if (!tx_context->urb) {
> -			ret = -ENOMEM;
> -			goto free_tx;
> -		}
> +		if (!tx_context->urb)
> +			goto e_nomem_tx;
> 
>  		tx_context->in_use = false;
>  	}
> 
>  	for (ii = 0; ii < priv->num_rcb; ii++) {
>  		priv->rcb[ii] = kzalloc(sizeof(*priv->rcb[ii]), GFP_KERNEL);
> -		if (!priv->rcb[ii]) {
> -			ret = -ENOMEM;
> -			goto free_rx_tx;
> -		}
> +		if (!priv->rcb[ii])
> +			goto e_nomem_rx;
> 
>  		rcb = priv->rcb[ii];
> 
> @@ -475,16 +469,12 @@ static int vnt_alloc_bufs(struct vnt_private *priv)
> 
>  		/* allocate URBs */
>  		rcb->urb = usb_alloc_urb(0, GFP_KERNEL);
> -		if (!rcb->urb) {
> -			ret = -ENOMEM;
> -			goto free_rx_tx;
> -		}
> +		if (!rcb->urb)
> +			goto e_nomem_rx;
> 
>  		rcb->skb = dev_alloc_skb(priv->rx_buf_sz);
> -		if (!rcb->skb) {
> -			ret = -ENOMEM;
> -			goto free_rx_tx;
> -		}
> +		if (!rcb->skb)
> +			goto e_nomem_rx;
> 
>  		rcb->in_use = false;
> 
> @@ -495,21 +485,23 @@ static int vnt_alloc_bufs(struct vnt_private *priv)
>  	}
> 
>  	priv->interrupt_urb = usb_alloc_urb(0, GFP_KERNEL);
> -	if (!priv->interrupt_urb) {
> -		ret = -ENOMEM;
> -		goto free_rx_tx;
> -	}
> +	if (!priv->interrupt_urb)
> +		goto e_nomem_rx;
> 
>  	priv->int_buf.data_buf = kmalloc(MAX_INTERRUPT_SIZE, GFP_KERNEL);
> -	if (!priv->int_buf.data_buf) {
> -		ret = -ENOMEM;
> +	if (!priv->int_buf.data_buf)
>  		goto free_rx_tx_urb;
> -	}
> 
>  	return 0;
> 
> +e_nomem_tx:
> +	ret = -ENOMEM;
> +	goto free_tx;
> +
>  free_rx_tx_urb:
>  	usb_free_urb(priv->interrupt_urb);
> +e_nomem_rx:
> +	ret = -ENOMEM;
>  free_rx_tx:
>  	vnt_free_rx_bufs(priv);
>  free_tx:
> --
> 2.23.0
> 

Your patch remove redundant code, which is fine. However, and IMHO, the
code you changed was simple enough to be understand quickly. I think replacing
it with a crossed goto (even if it remove redundant code) might not be the best
option.

A solution might be to move the second loop to the top of the function so
you should be able to replace the end of the cleanup calls with:

enomem:
	ret = -ENOMEM;
free_rx:
	vnt_free_rx_bufs(priv);
	return ret;

This way, only a failed call to vnt_submit_rx_urb() should jump to
free_rx, another failed call should jump to enomem or previously defined
label, so we can correctly forward errors. With such solution it might
be worth adding a comment to describe that all error should be ENOMEM
except for vnt_submit_rx_urb(). Does that looks good to you?

Regards,
Quentin
