From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 18:27:41 +0000
Subject: [KJ] [RFC][PATCH 5/5] ieee1394/amdtp: use poll_event*() interface
Message-Id: <20050303182741.GH11600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27043839171374273=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27043839171374273==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description: Use new poll_event*() interface to encapsulate sleep-loops.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-kj-v/drivers/ieee1394/amdtp.c	2005-03-01 23:38:10.000000000 -0800
+++ 2.6.11-kj/drivers/ieee1394/amdtp.c	2005-03-03 09:50:47.000000000 -0800
@@ -83,6 +83,7 @@
 #include <linux/ioctl32.h>
 #include <linux/compat.h>
 #include <linux/cdev.h>
+#include <linux/delay.h>
 #include <asm/uaccess.h>
 #include <asm/atomic.h>
 
@@ -314,16 +315,11 @@ void ohci1394_stop_it_ctx(struct ti_ohci
 		  OHCI1394_CONTEXT_RUN);
 	wmb();
 
-	if (synchronous) {
-		for (wait = 0; wait < 5; wait++) {
-			control = reg_read(ohci, OHCI1394_IsoXmitContextControlSet + ctx * 16);
-			if ((control & OHCI1394_CONTEXT_ACTIVE) == 0)
-				break;
-
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1);
-		}
-	}
+	if (synchronous)
+		/* check every ms for condition, up to 5 ms */
+		poll_event_interruptible_timeout((reg_read(ohci,
+			OHCI1394_IsoXmitContextControlSet + ctx * 16) &
+			OHCI1394_CONTEXT_ACTIVE == 0), 1, 5);
 }
 
 /* Note: we can test if free_packet_lists is empty without aquiring

--===============27043839171374273==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27043839171374273==--
