From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:17:35 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/16] scsi/ide-scsi: replace
Message-Id: <20040927181735.GS1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34791777205113172=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34791777205113172==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/ide-scsi.c	2004-09-13 17:16:00.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/ide-scsi.c	2004-09-14 10:06:57.000000000 -0700
@@ -45,6 +45,7 @@
 #include <linux/hdreg.h>
 #include <linux/slab.h>
 #include <linux/ide.h>
+#include <linux/delay.h>
 
 #include <asm/io.h>
 #include <asm/bitops.h>
@@ -1047,7 +1048,7 @@ static int idescsi_eh_reset (Scsi_Cmnd *
 	do {
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		spin_unlock_irq(cmd->device->host->host_lock);
-		schedule_timeout(HZ/20);
+		msleep(50);
 		spin_lock_irq(cmd->device->host->host_lock);
 	} while ( HWGROUP(drive)->handler );
 

--===============34791777205113172==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34791777205113172==--
