From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Fri, 20 Oct 2006 00:55:53 +0000
Subject: Re: [KJ] [PATCH] Use time_after instead of comparisons for jiffies
Message-Id: <20061019175553.d349c7c1.randy.dunlap@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610191707.54729.karhudever@gmial.com>
In-Reply-To: <200610191707.54729.karhudever@gmial.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David KOENIG <karhudever@gmail.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On Thu, 19 Oct 2006 17:07:54 -0700 David KOENIG wrote:

> ---
>  drivers/net/tokenring/3c359.c |   29 +++++++++++++++--------------
>  1 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/tokenring/3c359.c b/drivers/net/tokenring/3c359.c
> index 7580bde..8ebcef1 100644
> --- a/drivers/net/tokenring/3c359.c
> +++ b/drivers/net/tokenring/3c359.c
> @@ -48,6 +48,7 @@ #include <linux/errno.h>
>  #include <linux/timer.h>
>  #include <linux/in.h>
>  #include <linux/ioport.h>
> +#include <linux/jiffies.h>
>  #include <linux/string.h>
>  #include <linux/proc_fs.h>
>  #include <linux/ptrace.h>
> @@ -409,7 +410,7 @@ static int xl_hw_reset(struct net_device
>  	t=jiffies;
>  	while (readw(xl_mmio + MMIO_INTSTATUS) & INTSTAT_CMD_IN_PROGRESS) { 
>  		schedule();		
> -		if(jiffies-t > 40*HZ) {
> +		if(time_after(jiffies, t + HZ * 2)) {

Why is this one HZ * 2 instead of 40 * HZ, whereas none of
the others were changed like this?

and since most of this driver uses
	if (
instead of
	if(
please change those lines to that (preferred) style while you are there.

>  			printk(KERN_ERR "%s: 3COM 3C359 Velocity XL  card not responding to global 
> reset.\n", dev->name);
>  			return -ENODEV;
>  		}
> @@ -520,7 +521,7 @@ #endif
>  	t=jiffies;
>  	while ( !(readw(xl_mmio + MMIO_INTSTATUS_AUTO) & INTSTAT_SRB) ) { 
>  		schedule();		
> -		if(jiffies-t > 15*HZ) {
> +		if(time_after(jiffies, t + 15 * HZ)) {
>  			printk(KERN_ERR "3COM 3C359 Velocity XL  card not responding.\n");
>  			return -ENODEV; 
>  		}
> @@ -795,8 +796,8 @@ static int xl_open_hw(struct net_device 
>  
>  	t=jiffies;
>  	while (! (readw(xl_mmio + MMIO_INTSTATUS) & INTSTAT_SRB)) { 
> -		schedule();		
> -		if(jiffies-t > 40*HZ) {
> +		schedule();
> +		if(time_after(jiffies, t + 40 * HZ) {
>  			printk(KERN_ERR "3COM 3C359 Velocity XL  card not responding.\n");
>  			break ; 
>  		}
> @@ -1010,8 +1011,8 @@ static void xl_reset(struct net_device *
>  	 */
>  
>  	t=jiffies;
> -	while (readw(xl_mmio + MMIO_INTSTATUS) & INTSTAT_CMD_IN_PROGRESS) { 
> -		if(jiffies-t > 40*HZ) {
> +	while (readw(xl_mmio + MMIO_INTSTATUS) & INTSTAT_CMD_IN_PROGRESS) {
> +		if(time_after(jiffies, t + 40 * HZ)) {
>  			printk(KERN_ERR "3COM 3C359 Velocity XL  card not responding.\n");
>  			break ; 
>  		}
> @@ -1282,8 +1283,8 @@ static int xl_close(struct net_device *d
>      	writew(DNSTALL, xl_mmio + MMIO_COMMAND) ; 
>  	t=jiffies;
>  	while (readw(xl_mmio + MMIO_INTSTATUS) & INTSTAT_CMD_IN_PROGRESS) { 
> -		schedule();		
> -		if(jiffies-t > 10*HZ) {
> +		schedule();
> +		if(time_after(jiffies, t + 10 * HZ)) {
>  			printk(KERN_ERR "%s: 3COM 3C359 Velocity XL-DNSTALL not responding.\n", 
> dev->name);
>  			break ; 
>  		}
> @@ -1291,8 +1292,8 @@ static int xl_close(struct net_device *d
>      	writew(DNDISABLE, xl_mmio + MMIO_COMMAND) ; 
>  	t=jiffies;
>  	while (readw(xl_mmio + MMIO_INTSTATUS) & INTSTAT_CMD_IN_PROGRESS) { 
> -		schedule();		
> -		if(jiffies-t > 10*HZ) {
> +		schedule();
> +		if(time_after(jiffies, t + 10 * HZ)) {
>  			printk(KERN_ERR "%s: 3COM 3C359 Velocity XL-DNDISABLE not responding.\n", 
> dev->name);
>  			break ;
>  		}
> @@ -1301,7 +1302,7 @@ static int xl_close(struct net_device *d
>  	t=jiffies;
>  	while (readw(xl_mmio + MMIO_INTSTATUS) & INTSTAT_CMD_IN_PROGRESS) { 
>  		schedule();		
> -		if(jiffies-t > 10*HZ) {
> +		if(time_after(jiffies, t + 10 * HZ)) {
>  			printk(KERN_ERR "%s: 3COM 3C359 Velocity XL-UPSTALL not responding.\n", 
> dev->name);
>  			break ; 
>  		}
> @@ -1318,7 +1319,7 @@ static int xl_close(struct net_device *d
>  	t=jiffies;
>  	while (!(readw(xl_mmio + MMIO_INTSTATUS) & INTSTAT_SRB)) { 
>  		schedule();		
> -		if(jiffies-t > 10*HZ) {
> +		if(time_after(jiffies, t + 10 * HZ)) {
>  			printk(KERN_ERR "%s: 3COM 3C359 Velocity XL-CLOSENIC not responding.\n", 
> dev->name);
>  			break ; 
>  		}
> @@ -1347,7 +1348,7 @@ static int xl_close(struct net_device *d
>  	t=jiffies;
>  	while (readw(xl_mmio + MMIO_INTSTATUS) & INTSTAT_CMD_IN_PROGRESS) { 
>  		schedule();		
> -		if(jiffies-t > 10*HZ) {
> +		if(time_after(jiffies, t + 10 * HZ)) {
>  			printk(KERN_ERR "%s: 3COM 3C359 Velocity XL-UPRESET not responding.\n", 
> dev->name);
>  			break ; 
>  		}
> @@ -1356,7 +1357,7 @@ static int xl_close(struct net_device *d
>  	t=jiffies;
>  	while (readw(xl_mmio + MMIO_INTSTATUS) & INTSTAT_CMD_IN_PROGRESS) { 
>  		schedule();		
> -		if(jiffies-t > 10*HZ) {
> +		if(time_after(jiffies, t + 10 * HZ)) {
>  			printk(KERN_ERR "%s: 3COM 3C359 Velocity XL-DNRESET not responding.\n", 
> dev->name);
>  			break ; 
>  		}
> -- 


---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
