From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Mon, 19 Feb 2007 06:25:59 +0000
Subject: [KJ] [PATCH] is_power_of_2 in s390
Message-Id: <1171865639.6127.33.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/drivers/s390/block/dasd_int.h b/drivers/s390/block/dasd_int.h
index a2cc69e..86305d5 100644
--- a/drivers/s390/block/dasd_int.h
+++ b/drivers/s390/block/dasd_int.h
@@ -53,6 +53,7 @@
 #include <linux/genhd.h>
 #include <linux/hdreg.h>
 #include <linux/interrupt.h>
+#include <linux/log2.h>
 #include <asm/ccwdev.h>
 #include <linux/workqueue.h>
 #include <asm/debug.h>
@@ -456,7 +457,7 @@ dasd_free_chunk(struct list_head *chunk_list, void *mem)
 static inline int
 dasd_check_blocksize(int bsize)
 {
-	if (bsize < 512 || bsize > 4096 || (bsize & (bsize - 1)) != 0)
+	if (bsize < 512 || bsize > 4096 || !is_power_of_2(bsize))
 		return -EMEDIUMTYPE;
 	return 0;
 }
diff --git a/drivers/s390/cio/cio.c b/drivers/s390/cio/cio.c
index b3a56dc..f61be3e 100644
--- a/drivers/s390/cio/cio.c
+++ b/drivers/s390/cio/cio.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
+#include <linux/log2.h>
 #include <asm/cio.h>
 #include <asm/delay.h>
 #include <asm/irq.h>
@@ -614,7 +615,7 @@ cio_validate_subchannel (struct subchannel *sch, struct subchannel_id schid)
 	sch->schib.pmcw.isc = 3;	/* could be smth. else */
 	sch->schib.pmcw.csense = 1;	/* concurrent sense */
 	sch->schib.pmcw.ena = 0;
-	if ((sch->lpm & (sch->lpm - 1)) != 0)
+	if (!is_power_of_2(sch->lpm))
 		sch->schib.pmcw.mp = 1;	/* multipath mode */
 	return 0;
 out:
diff --git a/drivers/s390/cio/device_fsm.c b/drivers/s390/cio/device_fsm.c
index 51238e7..3ef2092 100644
--- a/drivers/s390/cio/device_fsm.c
+++ b/drivers/s390/cio/device_fsm.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/jiffies.h>
 #include <linux/string.h>
+#include <linux/log2.h>
 
 #include <asm/ccwdev.h>
 #include <asm/cio.h>
@@ -1122,7 +1123,7 @@ device_trigger_reprobe(struct subchannel *sch)
 	sch->schib.pmcw.isc = 3;
 	sch->schib.pmcw.csense = 1;
 	sch->schib.pmcw.ena = 0;
-	if ((sch->lpm & (sch->lpm - 1)) != 0)
+	if (!is_power_of_2(sch->lpm))
 		sch->schib.pmcw.mp = 1;
 	sch->schib.pmcw.intparm = (__u32)(unsigned long)sch;
 	/* We should also udate ssd info, but this has to wait. */

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
