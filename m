From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 22:11:07 +0000
Subject: [KJ] [PATCH] 3/34: block/DAC960: replace interruptible_sleep_on()
Message-Id: <20050125221107.GD2689@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86580454489099168=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86580454489099168==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible_timeout() instead of the deprecated
interruptible_sleep_on_timeout(). The existing code is complicated in the
conditional and so is the new code. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/block/DAC960.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/block/DAC960.c	2005-01-25 14:08:46.000000000 -0800
@@ -40,6 +40,7 @@
 #include <linux/timer.h>
 #include <linux/pci.h>
 #include <linux/init.h>
+#include <linux/wait.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
 #include "DAC960.h"
@@ -6917,15 +6918,13 @@ static int DAC960_gam_ioctl(struct inode
 			   GetHealthStatus.HealthStatusBuffer,
 			   sizeof(DAC960_V2_HealthStatusBuffer_T)))
 		return -EFAULT;
-	while (Controller->V2.HealthStatusBuffer->StatusChangeCounter
-	       == HealthStatusBuffer.StatusChangeCounter &&
-	       Controller->V2.HealthStatusBuffer->NextEventSequenceNumber
-	       == HealthStatusBuffer.NextEventSequenceNumber)
-	  {
-	    interruptible_sleep_on_timeout(&Controller->HealthStatusWaitQueue,
-					   DAC960_MonitoringTimerInterval);
-	    if (signal_pending(current)) return -EINTR;
-	  }
+	wait_event_interruptible_timeout(Controller->HealthStatusWaitQueue,
+			(Controller->V2.HealthStatusBuffer->StatusChangeCounter
+			 != HealthStatusBuffer.StatusChangeCounter ||
+			 Controller->V2.HealthStatusBuffer->NextEventSequenceNumber
+			 != HealthStatusBuffer.NextEventSequenceNumber),
+			 DAC960_MonitoringTimerInterval);
+	if (signal_pending(current)) return -EINTR;
 	if (copy_to_user(GetHealthStatus.HealthStatusBuffer,
 			 Controller->V2.HealthStatusBuffer,
 			 sizeof(DAC960_V2_HealthStatusBuffer_T)))

--===============86580454489099168==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86580454489099168==--
