From: walter harms <wharms@bfs.de>
Date: Fri, 05 Apr 2013 07:09:04 +0000
Subject: Re: [patch 2/2 v2] USB: keyspan: add a sanity test on "len"
Message-Id: <515E7890.2070905@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130405054320.GB26528@longonot.mountain>
In-Reply-To: <20130405054320.GB26528@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 05.04.2013 07:43, schrieb Dan Carpenter:
> "len" comes from the USB transfer and it's probably correct.  The thing
> is that we already have similar checks like:
> 
>         if (data[i] >= serial->num_ports) {
> 
> So adding a sanity test here matches the rest of the code and is a good
> idea.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: No change.  Rebased.
> 
> diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
> index 3d303f0..eb30d7b 100644
> --- a/drivers/usb/serial/keyspan.c
> +++ b/drivers/usb/serial/keyspan.c
> @@ -727,14 +727,15 @@ static void usa49wg_indat_callback(struct urb *urb)
>  		if ((data[i] & 0x80) = 0) {
>  			/* no error on any byte */
>  			i++;
> -			for (x = 1; x < len ; ++x)
> +			for (x = 1; x < len && i < urb->actual_length; ++x)
>  				tty_insert_flip_char(&port->port,
>  						data[i++], 0);

maybe is is a bit late ...
mixing i,x here is prone to error, the casual reader will be confused.
i suggest the following variation.
 for (x = 1; x < len && i < urb->actual_length; ++x)
	if (i < urb->actual_length)
 		tty_insert_flip_char(&port->port,ata[i++], 0);
  					

>  		} else {
>  			/*
>  			 * some bytes had errors, every byte has status
>  			 */
> -			for (x = 0; x + 1 < len; x += 2) {
> +			for (x = 0; x + 1 < len &&
> +				    i + 1 < urb->actual_length; x += 2) {
>  				int stat = data[i], flag = 0;
>  
>  				if (stat & RXERROR_OVERRUN)
same as above.

re,
 wh

> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
