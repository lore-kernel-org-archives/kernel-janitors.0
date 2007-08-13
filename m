From: vignesh babu <vignesh.babu@wipro.com>
Date: Mon, 13 Aug 2007 13:07:05 +0000
Subject: [kj] is_power_of_2 in drivers/s390/cio
Message-Id: <1187009705.7273.7.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Replacing n & (n - 1) for power of 2 check by is_power_of_2(n)

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
diff --git a/drivers/s390/cio/device_fsm.c b/drivers/s390/cio/device_fsm.c
index 8633dc5..c00ebf4 100644
--- a/drivers/s390/cio/device_fsm.c
+++ b/drivers/s390/cio/device_fsm.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/jiffies.h>
 #include <linux/string.h>
+#include <linux/log2.h>
 
 #include <asm/ccwdev.h>
 #include <asm/cio.h>
@@ -1129,7 +1130,7 @@ device_trigger_reprobe(struct subchannel *sch)
 	sch->schib.pmcw.isc = 3;
 	sch->schib.pmcw.csense = 1;
 	sch->schib.pmcw.ena = 0;
-	if ((sch->lpm & (sch->lpm - 1)) != 0)
+	if (!is_power_of_2(sch->lpm))
 		sch->schib.pmcw.mp = 1;
 	sch->schib.pmcw.intparm = (__u32)(unsigned long)sch;
 	/* We should also udate ssd info, but this has to wait. */

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
