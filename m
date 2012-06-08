From: Ian Abbott <abbotti@mev.co.uk>
Date: Fri, 08 Jun 2012 09:09:48 +0000
Subject: Re: staging: comedi: amplc_pci230: add a missing unlock
Message-Id: <4FD1C15C.5080408@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120608065258.GA26673@elgon.mountain>
In-Reply-To: <20120608065258.GA26673@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2012/06/08 07:52 AM, Dan Carpenter wrote:
> This side of the if else statement returned with the lock held and IRQs
> disabled.

> --- a/drivers/staging/comedi/drivers/amplc_pci230.c
> +++ b/drivers/staging/comedi/drivers/amplc_pci230.c
> @@ -1387,6 +1387,8 @@ static int pci230_ao_inttrig_scan_begin(struct comedi_device *dev,
>  		/* Delay.  Should driver be responsible for this? */
>  		/* XXX TODO: See if DAC busy bit can be used. */
>  		udelay(8);
> +	} else {
> +		spin_unlock_irqrestore(&devpriv->ao_stop_spinlock, irqflags);
>  	}

Thanks for catching that!  I'll fix it in the out-of-kernel Comedi
sources as well.

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>             )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587              )=-
