From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:30:57 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 13/16] scsi/scsi_lib: replace
Message-Id: <20040927183057.GB1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71292421777287962=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============71292421777287962==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/scsi_lib.c	2004-09-13 17:16:00.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/scsi_lib.c	2004-09-14 11:08:51.000000000 -0700
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/pci.h>
+#include <linux/delay.h>
 
 #include <scsi/scsi.h>
 #include <scsi/scsi_dbg.h>
@@ -1714,7 +1715,7 @@ scsi_device_quiesce(struct scsi_device *
 
 	scsi_run_queue(sdev->request_queue);
 	while (sdev->device_busy) {
-		schedule_timeout(HZ/5);
+		msleep_interruptible(200);
 		scsi_run_queue(sdev->request_queue);
 	}
 	return 0;

--===============71292421777287962==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71292421777287962==--
