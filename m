From: James Nelson <james4765@verizon.net>
Date: Fri, 17 Dec 2004 23:59:05 +0000
Subject: [KJ] [PATCH] lcd: replace cli()/sti() with
Message-Id: <20041217235927.17998.75228.61750@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78232967538750353=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org
Cc: akpm@osdl.org, James Nelson <james4765@verizon.net>

--===============78232967538750353==

Remove the cli()/sti() calls in drivers/char/lcd.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.10-rc3-mm1-original/drivers/char/lcd.c linux-2.6.10-rc3-mm1/drivers/char/lcd.c
--- linux-2.6.10-rc3-mm1-original/drivers/char/lcd.c	2004-12-03 16:53:42.000000000 -0500
+++ linux-2.6.10-rc3-mm1/drivers/char/lcd.c	2004-12-17 18:57:10.760197439 -0500
@@ -33,6 +33,8 @@
 
 #include "lcd.h"
 
+static spinlock_t lcd_lock = SPIN_LOCK_UNLOCKED;
+
 static int lcd_ioctl(struct inode *inode, struct file *file,
 		     unsigned int cmd, unsigned long arg);
 
@@ -464,14 +466,13 @@
 			}
 
 			printk("Churning and Burning -");
-			save_flags(flags);
 			for (i = 0; i < FLASH_SIZE; i = i + 128) {
 
 				if (copy_from_user
 				    (rom, display.RomImage + i, 128))
 					return -EFAULT;
 				burn_addr = kFlashBase + i;
-				cli();
+				spin_lock_irqsave(&lcd_lock, flags);
 				for (index = 0; index < (128); index++) {
 
 					WRITE_FLASH(kFlash_Addr1,
@@ -492,7 +493,7 @@
 					}
 					burn_addr++;
 				}
-				restore_flags(flags);
+				spin_unlock_irqrestore(&lcd_lock, flags);
 				if (*
 				    ((volatile unsigned char *) (burn_addr
 								 - 1)) ==

--===============78232967538750353==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78232967538750353==--
