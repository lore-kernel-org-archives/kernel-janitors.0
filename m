From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 20:39:24 +0000
Subject: [Kernel-janitors] [PATCH] cdrom/sonycd535: replace
Message-Id: <20040915203924.GE5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23823041132681899=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23823041132681899==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout()
to gurantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/cdrom/sonycd535.c	2004-09-09 23:05:58.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/cdrom/sonycd535.c	2004-09-13 10:30:00.000000000 -0700
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
+	msleep_interruptible(2223);
 	inb(result_reg);
 
 	outb(0, read_status_reg);	/* does a reset? */

--===============23823041132681899==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23823041132681899==--
