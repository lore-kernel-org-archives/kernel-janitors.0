From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:16:11 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/16] scsi/ibmvscsi: replace
Message-Id: <20040927181610.GR1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97968413541636434=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97968413541636434==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/ibmvscsi/ibmvscsi.c	2004-09-13 17:16:01.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/ibmvscsi/ibmvscsi.c	2004-09-27 11:14:52.000000000 -0700
@@ -69,6 +69,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/dma-mapping.h>
+#include <linux/delay.h>
 #include <asm/vio.h>
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
@@ -1327,8 +1328,7 @@ static int ibmvscsi_probe(struct vio_dev
 		     time_before(jiffies, wait_switch) &&
 		     atomic_read(&hostdata->request_limit) < 0;) {
 
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ / 100);
+			msleep(10);
 		}
 
 		/* if we now have a valid request_limit, initiate a scan */

--===============97968413541636434==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97968413541636434==--
