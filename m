From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:56:00 +0000
Subject: [Kernel-janitors] [PATCH] scsi/sd: replace schedule_timeout() with
Message-Id: <20040727225600.GD4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80717871851086431=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============80717871851086431==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/scsi/sd.c	2004-06-16 05:19:44.000000000 +0000
+++ linux-dev/drivers/scsi/sd.c	2004-07-15 23:13:08.000000000 +0000
@@ -49,6 +49,7 @@
 #include <linux/blkdev.h>
 #include <linux/blkpg.h>
 #include <linux/kref.h>
+#include <linux/delay.h>
 #include <asm/uaccess.h>
 
 #include "scsi.h"
@@ -887,7 +888,6 @@ sd_spinup_disk(struct scsi_disk *sdkp, c
 		 * Issue command to spin up drive when not ready
 		 */
 		} else if (SRpnt->sr_sense_buffer[2] == NOT_READY) {
-			unsigned long time1;
 			if (!spintime) {
 				printk(KERN_NOTICE "%s: Spinning up disk...",
 				       diskname);
@@ -906,12 +906,8 @@ sd_spinup_disk(struct scsi_disk *sdkp, c
 				spintime_value = jiffies;
 			}
 			spintime = 1;
-			time1 = HZ;
 			/* Wait 1 second for next try */
-			do {
-				current->state = TASK_UNINTERRUPTIBLE;
-				time1 = schedule_timeout(time1);
-			} while(time1);
+			msleep(1000);
 			printk(".");
 		} else {
 			/* we don't understand the sense code, so it's

--===============80717871851086431==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80717871851086431==--
