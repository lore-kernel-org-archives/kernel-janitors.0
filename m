From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 01 Sep 2004 22:19:03 +0000
Subject: [Kernel-janitors] [PATCH] sonycd535: replace schedule_timeout() with
Message-Id: <20040901221903.GC2516@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32970358975029823=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720205857.GE2959@us.ibm.com>
In-Reply-To: <20040720205857.GE2959@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============32970358975029823==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is one of 10 patches which have either not been pushed to mainline
(2.6.9-rc1-bk7) or have not been included in any of the recent kjt's.

Applys-to: 2.6.9-rc1-bk7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc1-bk7-vanilla/drivers/cdrom/sonycd535.c	2004-08-31 21:26:50.000000000 +0000
+++ 2.6.9-rc1-bk7-dev/drivers/cdrom/sonycd535.c	2004-09-01 21:38:39.000000000 +0000
@@ -129,6 +129,7 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 
 #define REALLY_SLOW_IO
 #include <asm/system.h>
@@ -1478,8 +1479,7 @@ static int __init sony535_init(void)
 	/* look for the CD-ROM, follows the procedure in the DOS driver */
 	inb(select_unit_reg);
 	/* wait for 40 18 Hz ticks (reverse-engineered from DOS driver) */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout((HZ+17)*40/18);
+	msleep(2223);
 	inb(result_reg);
 
 	outb(0, read_status_reg);	/* does a reset? */

--===============32970358975029823==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32970358975029823==--
