From: Jody McIntyre <scjody@modernduck.com>
Date: Mon, 07 Mar 2005 18:56:00 +0000
Subject: [KJ] Re: [UPDATE PATCH] ieee1394/video1394: replace
Message-Id: <20050307185600.GU1111@conscoop.ottawa.on.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17067010754386258=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============17067010754386258==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2005 at 03:22:35PM -0800, Nishanth Aravamudan wrote:
> 
> Description: Use wait_event_interruptible() instead of the deprecated
> interruptible_sleep_on(). Add a helper function to make the condition
> for wait_event_interruptible() sane and lock-safe. Patch is compile-tested.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Thanks, applied.

Jody

> 
> 
> --- 2.6.11-v/drivers/ieee1394/video1394.c	2005-03-01 23:37:49.000000000 -0800
> +++ 2.6.11/drivers/ieee1394/video1394.c	2005-03-03 15:22:01.000000000 -0800
> @@ -699,6 +699,17 @@ static void initialize_dma_it_ctx(struct
>  	reg_write(ohci, OHCI1394_IsoXmitIntMaskSet, 1<<d->ctx);
>  }
>  
> +static inline unsigned video1394_buffer_state(struct dma_iso_ctx *d,
> +					      unsigned int buffer)
> +{
> +	unsigned long flags;
> +	unsigned int ret;
> +	spin_lock_irqsave(&d->lock, flags);
> +	ret = d->buffer_status[buffer];
> +	spin_unlock_irqrestore(&d->lock, flags);
> +	return ret;
> +}
> +
>  static int __video1394_ioctl(struct file *file,
>  			     unsigned int cmd, unsigned long arg)
>  {
> @@ -952,24 +963,12 @@ static int __video1394_ioctl(struct file
>  			    return -EINTR;
>  			}
>  
> -#if 1
> -			while (d->buffer_status[v.buffer]!=
> -			      VIDEO1394_BUFFER_READY) {
> -				spin_unlock_irqrestore(&d->lock, flags);
> -				interruptible_sleep_on(&d->waitq);
> -				spin_lock_irqsave(&d->lock, flags);
> -				if (signal_pending(current)) {
> -					spin_unlock_irqrestore(&d->lock,flags);
> -					return -EINTR;
> -				}
> -			}
> -#else
> -			if (wait_event_interruptible(d->waitq,
> -						     d->buffer_status[v.buffer]
> -						     == VIDEO1394_BUFFER_READY)
> -			    == -ERESTARTSYS)
> +			spin_unlock_irqrestore(&d->lock, flags);
> +			wait_event_interruptible(d->waitq,
> +					video1394_buffer_state(d, v.buffer) == VIDEO1394_BUFFER_READY);
> +			if (signal_pending(current))
>  				return -EINTR;
> -#endif
> +			spin_lock_irqsave(&d->lock, flags);
>  			d->buffer_status[v.buffer]=VIDEO1394_BUFFER_FREE;
>  			break;
>  		default:
> 
> 
> -------------------------------------------------------
> SF email is sponsored by - The IT Product Guide
> Read honest & candid reviews on hundreds of IT Products from real users.
> Discover which products truly live up to the hype. Start reading now.
> http://ads.osdn.com/?ad_id=6595&alloc_id=14396&op=click
> _______________________________________________
> mailing list linux1394-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux1394-devel

-- 

--===============17067010754386258==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17067010754386258==--
