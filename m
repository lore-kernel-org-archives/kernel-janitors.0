From: Jan Dittmer <jdittmer@ppp0.net>
Date: Sat, 18 Dec 2004 00:58:56 +0000
Subject: [KJ] Re: [PATCH] lcd: replace cli()/sti() with
Message-Id: <41C380D0.9020001@ppp0.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041217235927.17998.75228.61750@localhost.localdomain>
In-Reply-To: <20041217235927.17998.75228.61750@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Nelson <james4765@verizon.net>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, akpm@osdl.org

James Nelson wrote:
> Remove the cli()/sti() calls in drivers/char/lcd.c

Why is this cli() there in the first place? ioctl is already
called under lock_kernel.

> Signed-off-by: James Nelson <james4765@gmail.com>
> 
> diff -urN --exclude='*~' linux-2.6.10-rc3-mm1-original/drivers/char/lcd.c linux-2.6.10-rc3-mm1/drivers/char/lcd.c
> --- linux-2.6.10-rc3-mm1-original/drivers/char/lcd.c	2004-12-03 16:53:42.000000000 -0500
> +++ linux-2.6.10-rc3-mm1/drivers/char/lcd.c	2004-12-17 18:57:10.760197439 -0500
> @@ -33,6 +33,8 @@
>  
>  #include "lcd.h"
>  
> +static spinlock_t lcd_lock = SPIN_LOCK_UNLOCKED;
> +
>  static int lcd_ioctl(struct inode *inode, struct file *file,
>  		     unsigned int cmd, unsigned long arg);
>  
> @@ -464,14 +466,13 @@
>  			}
>  
>  			printk("Churning and Burning -");
> -			save_flags(flags);
>  			for (i = 0; i < FLASH_SIZE; i = i + 128) {
>  
>  				if (copy_from_user
>  				    (rom, display.RomImage + i, 128))
>  					return -EFAULT;

The driver is leaking memory, rom is not freed in this case.

Jan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
