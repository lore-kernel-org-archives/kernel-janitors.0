From: Jim Nelson <james4765@verizon.net>
Date: Sat, 18 Dec 2004 03:02:16 +0000
Subject: [KJ] Re: [PATCH] lcd: replace cli()/sti() with
Message-Id: <41C39DB8.6050403@verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77598589299175114=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041217235927.17998.75228.61750@localhost.localdomain> <41C380D0.9020001@ppp0.net>
In-Reply-To: <41C380D0.9020001@ppp0.net>
To: Jan Dittmer <jdittmer@ppp0.net>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============77598589299175114==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Jan Dittmer wrote:
> James Nelson wrote:
> 
>>Remove the cli()/sti() calls in drivers/char/lcd.c
> 
> 
> Why is this cli() there in the first place? ioctl is already
> called under lock_kernel.
> 
> 

First - a warning.  Newbie on the loose, running around, asking for a whack with 
the cluebat.

I had seen other drivers that had cli()/sti() calls in the ioctl functions.  So, 
that is wrong?  Should all of those cli()/sti() calls be removed?

Just to site things properly in my mind, was it always the case that ioctl is 
called under lock_kernel, or is this a relatively recent (2.3+) development?  Some 
of the *really* abandoned drivers haven't been touched in at least that long.

>>Signed-off-by: James Nelson <james4765@gmail.com>
>>
>>diff -urN --exclude='*~' linux-2.6.10-rc3-mm1-original/drivers/char/lcd.c linux-2.6.10-rc3-mm1/drivers/char/lcd.c
>>--- linux-2.6.10-rc3-mm1-original/drivers/char/lcd.c	2004-12-03 16:53:42.000000000 -0500
>>+++ linux-2.6.10-rc3-mm1/drivers/char/lcd.c	2004-12-17 18:57:10.760197439 -0500
>>@@ -33,6 +33,8 @@
>> 
>> #include "lcd.h"
>> 
>>+static spinlock_t lcd_lock = SPIN_LOCK_UNLOCKED;
>>+
>> static int lcd_ioctl(struct inode *inode, struct file *file,
>> 		     unsigned int cmd, unsigned long arg);
>> 
>>@@ -464,14 +466,13 @@
>> 			}
>> 
>> 			printk("Churning and Burning -");
>>-			save_flags(flags);
>> 			for (i = 0; i < FLASH_SIZE; i = i + 128) {
>> 
>> 				if (copy_from_user
>> 				    (rom, display.RomImage + i, 128))
>> 					return -EFAULT;
> 
> 
> The driver is leaking memory, rom is not freed in this case.

Erm.  Didn't notice that.

> 
> Jan
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 


--===============77598589299175114==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77598589299175114==--
