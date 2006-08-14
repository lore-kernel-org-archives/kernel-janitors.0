From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 14 Aug 2006 23:59:34 +0000
Subject: Re: [KJ] [PATCH] Convert DPRINTK to pr_debug in
Message-Id: <20060814235934.GK4919@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44B44D3A.8010101@gmail.com>
In-Reply-To: <44B44D3A.8010101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 14.08.2006 [18:16:08 -0500], Matthew Martin wrote:
> Hello,
>     This converts a DPRINTK macro in drivers/parport/daisy.c to pr_debug.
> 
> Signed-Off-By: Matthew Martin <lihnucks@gmail.com>
> 
> ---
> 
> --- vanilla-linux-2.6.18-rc4/drivers/parport/daisy.c	2006-08-09 19:55:17.000000000 -0500
> +++ linux-2.6.18-rc4/drivers/parport/daisy.c	2006-08-14 17:22:38.000000000 -0500
> @@ -23,17 +23,12 @@
>  #include <linux/parport.h>
>  #include <linux/delay.h>
>  #include <linux/sched.h>
> +#include <linux/kernel.h>
>  
>  #include <asm/current.h>
>  #include <asm/uaccess.h>
>  
> -#undef DEBUG
>  
> -#ifdef DEBUG
> -#define DPRINTK(stuff...) printk (stuff)
> -#else
> -#define DPRINTK(stuff...)
> -#endif
>  
>  static struct daisydev {
>  	struct daisydev *next;
> @@ -322,8 +317,7 @@ static int cpp_daisy (struct parport *po
>  		  | PARPORT_STATUS_PAPEROUT
>  		  | PARPORT_STATUS_SELECT
>  		  | PARPORT_STATUS_ERROR)) {
> -		DPRINTK (KERN_DEBUG "%s: cpp_daisy: aa5500ff(%02x)\n",
> -			 port->name, s);
> +		pr_debug ("%s: cpp_daisy: aa5500ff(%02x)\n", port->name, s);

Care to stack a patch on top or before this, to not put a space before
the ( in every function call?

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
