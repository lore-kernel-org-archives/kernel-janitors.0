From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 21 Jul 2004 21:20:04 +0000
Subject: [Kernel-janitors] [PATCH] sonycd535: replace schedule_timeout()
Message-Id: <20040721212003.GK1906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16109472133963276=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720205857.GE2959@us.ibm.com>
In-Reply-To: <20040720205857.GE2959@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============16109472133963276==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please find below the corrected patch, as the previous one would not
compile.

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch.

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/cdrom/sonycd535.c	2004-06-16 05:19:11.000000000 +0000
+++ linux-dev/drivers/cdrom/sonycd535.c	2004-07-21 16:54:55.000000000 +0000
@@ -129,7 +129,8 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/init.h>
-
+#include <linux/delay.h>
+ 
 #define REALLY_SLOW_IO
 #include <asm/system.h>
 #include <asm/io.h>
@@ -1478,8 +1479,7 @@ static int __init sony535_init(void)
 	/* look for the CD-ROM, follows the procedure in the DOS driver */
 	inb(select_unit_reg);
 	/* wait for 40 18 Hz ticks (reverse-engineered from DOS driver) */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout((HZ+17)*40/18);
+	msleep(2223);
 	inb(result_reg);
 
 	outb(0, read_status_reg);	/* does a reset? */

--===============16109472133963276==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16109472133963276==--
