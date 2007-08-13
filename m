From: vignesh babu <vignesh.babu@wipro.com>
Date: Mon, 13 Aug 2007 13:05:59 +0000
Subject: [kj] is_power_of_2 in drivers/s390/block/dasd_int.h
Message-Id: <1187009639.7273.6.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Replacing n & (n - 1) for power of 2 check by is_power_of_2(n)

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
diff --git a/drivers/s390/block/dasd_int.h b/drivers/s390/block/dasd_int.h
index aeda526..d427dae 100644
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
