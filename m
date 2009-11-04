From: Hirokazu Takata <takata@linux-m32r.org>
Date: Wed, 04 Nov 2009 00:11:36 +0000
Subject: Re: [PATCH 8/15] arch/m32r: Use DIV_ROUND_CLOSEST
Message-Id: <swf8weni1xj.wl%takata@linux-m32r.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908021047060.15557@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908021047060.15557@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: takata@linux-m32r.org, linux-m32r@ml.linux-m32r.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Sun, 2 Aug 2009 10:47:27 +0200 (CEST),
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
> but is perhaps more readable.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
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
>  arch/m32r/kernel/time.c             |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/m32r/kernel/time.c b/arch/m32r/kernel/time.c
> index cada3ba..49648ba 100644
> --- a/arch/m32r/kernel/time.c
> +++ b/arch/m32r/kernel/time.c
> @@ -66,7 +66,7 @@ static unsigned long do_gettimeoffset(void)
>  		count = 0;
>  
>  	count = (latch - count) * TICK_SIZE;
> -	elapsed_time = (count + latch / 2) / latch;
> +	elapsed_time = DIV_ROUND_CLOSEST(count, latch);
>  	/* NOTE: LATCH is equal to the "interval" value (= reload count). */
>  
>  #else /* CONFIG_SMP */
> @@ -84,7 +84,7 @@ static unsigned long do_gettimeoffset(void)
>  	p_count = count;
>  
>  	count = (latch - count) * TICK_SIZE;
> -	elapsed_time = (count + latch / 2) / latch;
> +	elapsed_time = DIV_ROUND_CLOSEST(count, latch);
>  	/* NOTE: LATCH is equal to the "interval" value (= reload count). */
>  #endif /* CONFIG_SMP */
>  #elif defined(CONFIG_CHIP_M32310)
> @@ -270,7 +270,7 @@ void __init time_init(void)
>  
>  		bus_clock = boot_cpu_data.bus_clock;
>  		divide = boot_cpu_data.timer_divide;
> -		latch = (bus_clock/divide + HZ / 2) / HZ;
> +		latch = DIV_ROUND_CLOSEST(bus_clock/divide, HZ);
>  
>  		printk("Timer start : latch = %ld\n", latch);
>  
> 

Acked-by: Hirokazu Takata <takata@linux-m32r.org>

I've merged this patch into my tree.
Thank you.

-- Takata
