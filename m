From: Jody McIntyre <scjody@modernduck.com>
Date: Tue, 22 Feb 2005 17:29:02 +0000
Subject: [KJ] Re: [PATCH] 18/34: ieee1394/video1394: replace
Message-Id: <20050222172902.GV9231@conscoop.ottawa.on.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90330758512046039=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050215002049.GH9231@conscoop.ottawa.on.ca>
In-Reply-To: <20050215002049.GH9231@conscoop.ottawa.on.ca>
To: kernel-janitors@vger.kernel.org

--===============90330758512046039==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please add a Signed-off-by: line.

(more comments below)

On Mon, Feb 21, 2005 at 09:46:23AM -0800, Nishanth Aravamudan wrote:

> --- 2.6.11-rc4-v/drivers/ieee1394/video1394.c	2005-02-21 09:44:31.000000000 -0800
> +++ 2.6.11-rc4/drivers/ieee1394/video1394.c	2005-02-21 09:38:37.000000000 -0800
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
> +			if (signal_pending(current)) {

Extra {.

>  				return -EINTR;
> -#endif
> +			spin_lock_irqsave(&d->lock, flags);
>  			d->buffer_status[v.buffer]=VIDEO1394_BUFFER_FREE;
>  			break;
>  		default:

With this fixed, it compiles.  I'll find a video1394 user to test it.

Thanks,
Jody

-- 

--===============90330758512046039==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90330758512046039==--
