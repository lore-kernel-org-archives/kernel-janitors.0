From: vignesh babu <vignesh.babu@wipro.com>
Date: Tue, 12 Jun 2007 05:36:36 +0000
Subject: [KJ] [PATCH]is_power_of_2-scsi/NCR53C9x.c
Message-Id: <1181625877.11780.24.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matthew@wil.cx
Cc: linux-scsi@vger.kernel.org, Kernel Janitors List <kernel-janitors@lists.osdl.org>


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/drivers/scsi/NCR53C9x.c b/drivers/scsi/NCR53C9x.c
index 8b5334c..2868b1a 100644
--- a/drivers/scsi/NCR53C9x.c
+++ b/drivers/scsi/NCR53C9x.c
@@ -33,6 +33,7 @@
 #include <linux/proc_fs.h>
 #include <linux/stat.h>
 #include <linux/init.h>
+#include <linux/log2.h>
 
 #include "scsi.h"
 #include <scsi/scsi_host.h>
@@ -1651,7 +1652,7 @@ static inline int reconnect_target(struct NCR_ESP *esp, struct ESP_regs *eregs)
 	if(!(it & me))
 		return -1;
 	it &= ~me;
-	if(it & (it - 1))
+	if(!is_power_of_2(it))
 		return -1;
 	while(!(it & 1))
 		targ++, it >>= 1;

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
