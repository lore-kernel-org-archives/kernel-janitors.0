From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 16:51:42 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/15] isdn/boardergo: replace
Message-Id: <20040917165141.GC1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89995668613873292=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89995668613873292==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Uses msleep_interruptible() in place of
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/hysdn/boardergo.c	2004-09-13 17:16:04.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/hysdn/boardergo.c	2004-09-17 09:50:04.000000000 -0700
@@ -21,6 +21,7 @@
 #include <linux/ioport.h>
 #include <linux/interrupt.h>
 #include <linux/vmalloc.h>
+#include <linux/delay.h>
 #include <asm/io.h>
 
 #include "hysdn_defs.h"
@@ -246,8 +247,7 @@ ergo_writebootimg(struct HYSDN_CARD *car
 		/* the interrupts are still masked */
 
 		sti();
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout((20 * HZ) / 1000);	/* Timeout 20ms */
+		msleep_interruptible(20);		/* Timeout 20ms */
 
 		if (((tDpramBootSpooler *) card->dpram)->Len != DPRAM_SPOOLER_DATA_SIZE) {
 			if (card->debug_flags & LOG_POF_CARD)
@@ -386,8 +386,7 @@ ergo_waitpofready(struct HYSDN_CARD *car
 			return (0);	/* success */
 		}		/* data has arrived */
 		sti();
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout((50 * HZ) / 1000);	/* Timeout 50ms */
+		msleep_interruptible(50);		/* Timeout 50ms */
 	}			/* wait until timeout */
 
 	if (card->debug_flags & LOG_POF_CARD)

--===============89995668613873292==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89995668613873292==--
