From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 07 Nov 2013 08:52:55 +0000
Subject: Re: [patch 1/2] resources: clean up pnp_irq() error return
Message-Id: <s5hk3gkvbiw.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107081748.GU21844@elgon.mountain>
In-Reply-To: <20131107081748.GU21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>, Bill Pemberton <wfp5p@virginia.edu>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Toshi Kani <toshi.kani@hp.com>, Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org

At Thu, 7 Nov 2013 11:17:49 +0300,
Dan Carpenter wrote:
> 
> pnp_irq() returns -1 on error but cast to an unsigned.  It is confusing
> for callers who assume that it returns a negative value.  I have
> introduced a new define IORESOURCE_INVALID which is the same value but
> hopefully it looks less like a negative value.

How about just returning int instead of resource_size_t?
IRQ numbers are handled by int in almost all drivers.


thanks,

Takashi

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/include/linux/ioport.h b/include/linux/ioport.h
> index 89b7c24..fdccfa5 100644
> --- a/include/linux/ioport.h
> +++ b/include/linux/ioport.h
> @@ -55,6 +55,8 @@ struct resource {
>  #define IORESOURCE_AUTO		0x40000000
>  #define IORESOURCE_BUSY		0x80000000	/* Driver has marked this resource busy */
>  
> +#define IORESOURCE_INVALID	((resource_size_t)-1)
> +
>  /* PnP IRQ specific bits (IORESOURCE_BITS) */
>  #define IORESOURCE_IRQ_HIGHEDGE		(1<<0)
>  #define IORESOURCE_IRQ_LOWEDGE		(1<<1)
> diff --git a/include/linux/pnp.h b/include/linux/pnp.h
> index 195aafc..818669c 100644
> --- a/include/linux/pnp.h
> +++ b/include/linux/pnp.h
> @@ -151,7 +151,7 @@ static inline resource_size_t pnp_irq(struct pnp_dev *dev, unsigned int bar)
>  
>  	if (pnp_resource_valid(res))
>  		return res->start;
> -	return -1;
> +	return IORESOURCE_INVALID;
>  }
>  
>  static inline unsigned long pnp_irq_flags(struct pnp_dev *dev, unsigned int bar)
> 
