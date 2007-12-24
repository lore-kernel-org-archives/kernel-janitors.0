From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 16:06:41 +0000
Subject: Re: [PATCH 1/38] arch/alpha: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241706320.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712241516010.23999@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712241516010.23999@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Please ignore this patch, in which I have found an error.

julia




On Mon, 24 Dec 2007, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> The functions time_before, time_before_eq, time_after, and time_after_eq
> are more robust for comparing jiffies against other values.
> 
> A simplified version of the semantic patch making this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @ change_compare_np @
> expression E;
> @@
> 
> (
> - jiffies <= E
> + time_before_eq(jiffies,E)
> |
> - jiffies >= E
> + time_after_eq(jiffies,E)
> |
> - jiffies < E
> + time_before(jiffies,E)
> |
> - jiffies > E
> + time_after(jiffies,E)
> )
> 
> @ include depends on change_compare_np @
> @@
> 
> #include <linux/jiffies.h>
> 
> @ no_include depends on !include && change_compare_np @
> @@
> 
>   #include <linux/...>
> + #include <linux/jiffies.h>
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
> 
> diff -r -u -p a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> --- a/arch/alpha/kernel/traps.c	2007-10-22 11:24:57.000000000 +0200
> +++ b/arch/alpha/kernel/traps.c	2007-12-23 20:30:39.000000000 +0100
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/kallsyms.h>
> +#include <linux/jiffies.h>
>  
>  #include <asm/gentrap.h>
>  #include <asm/uaccess.h>
> @@ -781,7 +782,7 @@ do_entUnaUser(void __user * va, unsigned
>  	   with the unaliged access.  */
>  
>  	if (!test_thread_flag (TIF_UAC_NOPRINT)) {
> -		if (cnt >= 5 && jiffies - last_time > 5*HZ) {
> +		if (cnt >= 5 && time_after(jiffies, last_time + 5*HZ)) {
>  			cnt = 0;
>  		}
>  		if (++cnt < 5) {
> 
