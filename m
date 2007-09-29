From: Randy Dunlap <rdunlap@xenotime.net>
Date: Sat, 29 Sep 2007 17:45:45 +0000
Subject: Re: [PATCH] sa1100 dma s/DPRINTK/pr_debug/
Message-Id: <20070929104545.ac7c2150.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46FE2982.3070405@tiscali.nl>
In-Reply-To: <46FE2982.3070405@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 29 Sep 2007 12:31:30 +0200 Roel Kluin wrote:

> I replaced a DPRINTK with pr_debug and was wondering whether I was doing it
> correctly. See the example changes to arch/arm/mach-sa1100/dma.c, diffed 
> against the current git.
> 
> * Are the changes in arch/arm/mach-sa1100/kconfig files also required?

Yes, the option needs to be presented during 'make *config'.

> * Should changes be made to the arch/arm/mach-sa1100/Makefile?

Not that I know of.  What would they be?

> * Is an '#undef DEBUG' at the end not required?

Right, it is not required.

The biggest thing that I see missing is this (and this is not
part of the new doc file about using pr_debug() either; it probably
needs to be added):

a.  pr_debug() is #defined in <linux/kernel.h>, so that file needs
    to be #included.  This is happening indirectly now, but it should
    be done explictly.

b.  The value of DEBUG must be known (set) before the #include of
    <linux/kernel.h> so that pr_debug() is defined correctly, so all
    of the new CONFIG + DEBUG lines need to be before (all of) the
    #include lines.


> Signed-off-by: Roel Kluin <12o3l@tiscali.nl>
> ---
> diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
> index f99d901..f81c323 100644
> --- a/arch/arm/mach-sa1100/Kconfig
> +++ b/arch/arm/mach-sa1100/Kconfig
> @@ -157,6 +157,11 @@ config SA1100_SSP
>  	  This isn't for audio support, but for attached sensors and
>  	  other devices, eg for BadgePAD 4 sensor support.
>  
> +config SA1100_DMA_DEBUG
> +	bool "dma"

	bool "Debug DMA"

> +	help
> +	  Say Y here if you want verbose debugging for StrongARM 1110 dma.
> +
>  config H3600_SLEEVE
>  	tristate "Compaq iPAQ Handheld sleeve support"
>  	depends on SA1100_H3100 || SA1100_H3600
> diff --git a/arch/arm/mach-sa1100/dma.c b/arch/arm/mach-sa1100/dma.c
> index 1fbe053..d925dda 100644
> --- a/arch/arm/mach-sa1100/dma.c
> +++ b/arch/arm/mach-sa1100/dma.c
> @@ -22,11 +22,8 @@
>  #include <asm/dma.h>
>  
>  
> -#undef DEBUG
> -#ifdef DEBUG
> -#define DPRINTK( s, arg... )  printk( "dma<%p>: " s, regs , ##arg )
> -#else
> -#define DPRINTK( x... )
> +#ifdef CONFIG_SA1100_DMA_DEBUG
> +#	define DEBUG 1
>  #endif
>  
>  
> @@ -232,7 +229,7 @@ int sa1100_start_dma(dma_regs_t *regs, dma_addr_t dma_ptr, u_int size)
>  
>  	/* If both DMA buffers are started, there's nothing else we can do. */
>  	if ((status & (DCSR_STRTA | DCSR_STRTB)) = (DCSR_STRTA | DCSR_STRTB)) {
> -		DPRINTK("start: st %#x busy\n", status);
> +		pr_debug("dma<%p>: start: st %#x busy\n", regs , status);
>  		ret = -EBUSY;
>  		goto out;
>  	}
> @@ -247,7 +244,7 @@ int sa1100_start_dma(dma_regs_t *regs, dma_addr_t dma_ptr, u_int size)
>  		regs->DBSA = dma_ptr;
>  		regs->DBTA = size;
>  		regs->SetDCSR = DCSR_STRTA | DCSR_IE | DCSR_RUN;
> -		DPRINTK("start a=%#x s=%d on A\n", dma_ptr, size);
> +		pr_debug("dma<%p>: start a=%#x s=%d on A\n", regs , dma_ptr, size);
>  	} else {
>  		if (status & DCSR_DONEB) {
>  			/* give a chance for the interrupt to be processed */
> @@ -257,7 +254,7 @@ int sa1100_start_dma(dma_regs_t *regs, dma_addr_t dma_ptr, u_int size)
>  		regs->DBSB = dma_ptr;
>  		regs->DBTB = size;
>  		regs->SetDCSR = DCSR_STRTB | DCSR_IE | DCSR_RUN;
> -		DPRINTK("start a=%#x s=%d on B\n", dma_ptr, size);
> +		pr_debug("dma<%p>: start a=%#x s=%d on B\n", regs , dma_ptr, size);
>  	}
>  	ret = 0;
>  
> -

---
~Randy
Phaedrus says that Quality is about caring.
