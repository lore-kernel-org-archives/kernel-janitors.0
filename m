From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:33:25 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 14/16] scsi/sd: replace
Message-Id: <20040927183325.GC1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22293653867961272=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040917175900.GO1712@us.ibm.com>
In-Reply-To: <20040917175900.GO1712@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============22293653867961272==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use ssleep() instead of schedule_timeout()
to guarantee the task delays as expected. Remove unused variable
time1.

--- 2.6.9-rc2-vanilla/drivers/scsi/sd.c	2004-09-13 17:16:01.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/sd.c	2004-09-27 11:32:01.000000000 -0700
@@ -48,6 +48,7 @@
 #include <linux/blkdev.h>
 #include <linux/blkpg.h>
 #include <linux/kref.h>
+#include <linux/delay.h>
 #include <asm/uaccess.h>
 
 #include <scsi/scsi.h>
@@ -943,7 +944,6 @@ sd_spinup_disk(struct scsi_disk *sdkp, c
 		 * Issue command to spin up drive when not ready
 		 */
 		} else if (SRpnt->sr_sense_buffer[2] == NOT_READY) {
-			unsigned long time1;
 			if (!spintime) {
 				printk(KERN_NOTICE "%s: Spinning up disk...",
 				       diskname);
@@ -962,12 +962,8 @@ sd_spinup_disk(struct scsi_disk *sdkp, c
 				spintime_value = jiffies;
 			}
 			spintime = 1;
-			time1 = HZ;
 			/* Wait 1 second for next try */
-			do {
-				current->state = TASK_UNINTERRUPTIBLE;
-				time1 = schedule_timeout(time1);
-			} while(time1);
+			ssleep(1);
 			printk(".");
 		} else {
 			/* we don't understand the sense code, so it's

--===============22293653867961272==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22293653867961272==--
