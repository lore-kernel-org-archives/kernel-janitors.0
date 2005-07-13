From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Wed, 13 Jul 2005 05:58:36 +0000
Subject: [KJ] [PATCH] drivers/scsi/BusLogic.c : Use of time_after macro
Message-Id: <42D4AD8C.90607@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040704020800050405040206"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040704020800050405040206
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------040704020800050405040206
Content-Type: text/x-patch;
 name="BusLogic.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="BusLogic.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/scsi/BusLogic.c	2005-07-07 19:13:16.000000000 -0300
+++ linux-kj/drivers/scsi/BusLogic.c	2005-07-08 02:02:42.454851376 -0300
@@ -42,6 +42,7 @@
 #include <linux/pci.h>
 #include <linux/spinlock.h>
 #include <linux/dma-mapping.h>
+#include <linux/jiffies.h>
 #include <scsi/scsicam.h>
 
 #include <asm/dma.h>
@@ -2896,7 +2897,8 @@
 		 */
 		if (HostAdapter->ActiveCommands[TargetID] == 0)
 			HostAdapter->LastSequencePoint[TargetID] = jiffies;
-		else if (jiffies - HostAdapter->LastSequencePoint[TargetID] > 4 * HZ) {
+		else if (time_after(jiffies,
+			 HostAdapter->LastSequencePoint[TargetID] + 4 * HZ)) {
 			HostAdapter->LastSequencePoint[TargetID] = jiffies;
 			QueueTag = BusLogic_OrderedQueueTag;
 		}

--------------040704020800050405040206
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040704020800050405040206--
