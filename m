From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 23:19:59 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/4] pci hotplug/pciehp: replace
Message-Id: <20040924231959.GE1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9391184334138869=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920235847.GF2270@us.ibm.com>
In-Reply-To: <20040920235847.GF2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============9391184334138869==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/pci/hotplug/pciehp.h	2004-09-13 17:15:46.000000000 -0700
+++ 2.6.9-rc2/drivers/pci/hotplug/pciehp.h	2004-09-24 16:16:29.000000000 -0700
@@ -31,6 +31,7 @@
 
 #include <linux/types.h>
 #include <linux/pci.h>
+#include <linux/delay.h>
 #include <asm/semaphore.h>
 #include <asm/io.h>		
 #include "pci_hotplug.h"
@@ -261,14 +262,12 @@ static inline int wait_for_ctrl_irq(stru
 
 	dbg("%s : start\n", __FUNCTION__);
 	add_wait_queue(&ctrl->queue, &wait);
-	set_current_state(TASK_INTERRUPTIBLE);
-	if (!pciehp_poll_mode) {
+	if (!pciehp_poll_mode)
 		/* Sleep for up to 1 second */
-		schedule_timeout(1*HZ);
-	} else
-		schedule_timeout(2.5*HZ);
+		msleep_interruptible(1000);
+	else
+		msleep_interruptible(2500);
 	
-	set_current_state(TASK_RUNNING);
 	remove_wait_queue(&ctrl->queue, &wait);
 	if (signal_pending(current))
 		retval =  -EINTR;

--===============9391184334138869==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9391184334138869==--
