From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 19:12:38 +0000
Subject: [KJ] [UPDATE PATCH 3/34]: block/DAC960: remove sleep_on*() usage
Message-Id: <20050126191238.GB3593@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84964684362636855=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84964684362636855==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 25, 2005 at 02:11:07PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.
> 
> Description: Use wait_event_interruptible_timeout() instead of the deprecated
> interruptible_sleep_on_timeout(). The existing code is complicated in the
> conditional and so is the new code. Patch is compile-tested.

The following patch should be considered instead, as it removes completely
callers of sleep_on*().

Thanks,
Nish

Description: Use wait_event_interruptible_timeout() instead of the deprecated
interruptible_sleep_on_timeout(). The existing code is complicated in the
conditional and so is the new code. Also replace sleep_on_timeout() with direct
wait-queue usage. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc2-kj-v/drivers/block/DAC960.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/block/DAC960.c	2005-01-26 10:40:20.000000000 -0800
@@ -40,6 +40,7 @@
 #include <linux/timer.h>
 #include <linux/pci.h>
 #include <linux/init.h>
+#include <linux/wait.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
 #include "DAC960.h"
@@ -6127,6 +6128,7 @@ static boolean DAC960_V2_TranslatePhysic
 static boolean DAC960_V2_ExecuteUserCommand(DAC960_Controller_T *Controller,
 					    unsigned char *UserCommand)
 {
+  DEFINE_WAIT(wait);
   DAC960_Command_T *Command;
   DAC960_V2_CommandMailbox_T *CommandMailbox;
   unsigned long flags;
@@ -6317,7 +6319,9 @@ static boolean DAC960_V2_ExecuteUserComm
 	  while (Controller->V2.NewControllerInformation->PhysicalScanActive)
 	    {
 	      DAC960_ExecuteCommand(Command);
-	      sleep_on_timeout(&Controller->CommandWaitQueue, HZ);
+	      prepare_to_wait(&Controller->CommandWaitQueue, &wait, TASK_UNINTERRUPTIBLE);
+	      schedule_timeout(HZ);
+	      finish_wait(&Controller->CommandWaitQueue, &wait);
 	    }
 	  DAC960_UserCritical("Discovery Completed\n", Controller);
  	}
@@ -6917,15 +6921,13 @@ static int DAC960_gam_ioctl(struct inode
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

--===============84964684362636855==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84964684362636855==--
