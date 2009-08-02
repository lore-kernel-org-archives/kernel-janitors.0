From: Ryan Mallon <ryan@bluewatersys.com>
Date: Sun, 02 Aug 2009 20:37:52 +0000
Subject: Re: [PATCH 4/15] arch/arm/mach-ep93xx: Use DIV_ROUND_CLOSEST
Message-Id: <4A75F920.20101@bluewatersys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908021045190.15557@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908021045190.15557@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: hsweeten@visionengravers.com, linux-arm-kernel@lists.arm.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
> but is perhaps more readable.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)

I had a read through the website, that's a very neat tool.

> 
> // <smpl>
> @haskernel@
> @@
> 
> #include <linux/kernel.h>
> 
> @depends on haskernel@
> expression x,__divisor;
> @@
> 
> - (((x) + ((__divisor) / 2)) / (__divisor))
> + DIV_ROUND_CLOSEST(x,__divisor)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  arch/arm/mach-ep93xx/core.c         |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
> index 4075529..16b92c3 100644
> --- a/arch/arm/mach-ep93xx/core.c
> +++ b/arch/arm/mach-ep93xx/core.c
> @@ -82,7 +82,7 @@ void __init ep93xx_map_io(void)
>   */
>  static unsigned int last_jiffy_time;
>  
> -#define TIMER4_TICKS_PER_JIFFY		((CLOCK_TICK_RATE + (HZ/2)) / HZ)
> +#define TIMER4_TICKS_PER_JIFFY		DIV_ROUND_CLOSEST(CLOCK_TICK_RATE, HZ)
>  
>  static irqreturn_t ep93xx_timer_interrupt(int irq, void *dev_id)
>  {

Acked-by: Ryan Mallon <ryan@bluewatersys.com>

Can you please apply to the ARM patch system
(http://www.arm.linux.org.uk/developer/patches/) unless someone else is
picking this up.

~Ryan

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

       Ryan Mallon                              Unit 5, Amuri Park
       Phone: +64 3 3779127                     404 Barbadoes St
       Fax:   +64 3 3779135                     PO Box 13 889
       Email: ryan@bluewatersys.com             Christchurch, 8013
       Web:   http://www.bluewatersys.com       New Zealand
       Freecall Australia  1800 148 751         USA 1800 261 2934
