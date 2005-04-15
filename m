From: Mark Hollomon <markhollomon@comcast.net>
Date: Fri, 15 Apr 2005 01:33:06 +0000
Subject: Re: [KJ] [PATCH] drivers/net/ne2k-pci.c : Use of time_after() macro
Message-Id: <425F19D2.1010100@comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <425F030B.5000008@feitoza.com.br>
In-Reply-To: <425F030B.5000008@feitoza.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Marcelo Feitoza Parisi wrote:
> Added the use of time_after() macro, that is defined at linux/jiffies.h
> 
> Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
> 
> --- linux/drivers/net/ne2k-pci.c    2005-04-07 22:25:51.000000000 -0300
> +++ development/drivers/net/ne2k-pci.c    2005-04-14 20:00:28.000000000 
> -0300
> @@ -53,6 +53,7 @@
> #include <linux/ethtool.h>
> #include <linux/netdevice.h>
> #include <linux/etherdevice.h>
> +#include <linux/jiffies.h>
> 
> #include <asm/system.h>
> #include <asm/io.h>
> @@ -271,7 +272,7 @@
> 
>     /* Reset card. Who knows what dain-bramaged state it was left in. */
>     {
> -        unsigned long reset_start_time = jiffies;
> +        unsigned long reset_start_time = jiffies + 2;

A nit pick, but if you add 2 to jiffies, it is no longer the reset start time. 
Maybe rename the variable reset_timeout or something.

> 
>         outb(inb(ioaddr + NE_RESET), ioaddr + NE_RESET);
> 
> @@ -280,7 +281,7 @@
>         */
>         while ((inb(ioaddr + EN0_ISR) & ENISR_RESET) = 0)
>             /* Limit wait: '2' avoids jiffy roll-over. */
> -            if (jiffies - reset_start_time > 2) {
> +            if (time_after(jiffies, reset_start_time)) {
>                 printk(KERN_ERR PFX "Card failure (no reset ack).\n");
>                 goto err_out_free_netdev;
>             }
> @@ -441,7 +442,7 @@
>    8390 reset command required, but that shouldn't be necessary. */
> static void ne2k_pci_reset_8390(struct net_device *dev)
> {
> -    unsigned long reset_start_time = jiffies;
> +    unsigned long reset_start_time = jiffies + 2;

ditto

> 
>     if (debug > 1) printk("%s: Resetting the 8390 t=%ld...",
>                           dev->name, jiffies);
> @@ -453,7 +454,7 @@
> 
>     /* This check _should_not_ be necessary, omit eventually. */
>     while ((inb(NE_BASE+EN0_ISR) & ENISR_RESET) = 0)
> -        if (jiffies - reset_start_time > 2) {
> +        if (time_after(jiffies, reset_start_time)) {
>             printk("%s: ne2k_pci_reset_8390() did not complete.\n", 
> dev->name);
>             break;
>         }
> @@ -607,10 +608,10 @@
>         }
>     }
> 
> -    dma_start = jiffies;
> +    dma_start = jiffies + 2;

ditto

> 
>     while ((inb(nic_base + EN0_ISR) & ENISR_RDC) = 0)
> -        if (jiffies - dma_start > 2) {            /* Avoid clock 
> roll-over. */
> +        if (time_after(jiffies, dma_start)) {            /* Avoid clock 
> roll-over. */
>             printk(KERN_WARNING "%s: timeout waiting for Tx RDC.\n", 
> dev->name);
>             ne2k_pci_reset_8390(dev);
>             NS8390_init(dev,1);
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors
> 


-- 
Mark Hollomon
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
