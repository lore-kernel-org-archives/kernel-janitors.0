From: vignesh babu <vignesh.babu@wipro.com>
Date: Tue, 12 Jun 2007 05:36:41 +0000
Subject: [KJ] [PATCH]is_power_of_2-scsi/esp_scsi.c
Message-Id: <1181625881.11780.25.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@SteelEye.com
Cc: linux-scsi@vger.kernel.org, Kernel Janitors List <kernel-janitors@lists.osdl.org>


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
index ec71061..c416154 100644
--- a/drivers/scsi/esp_scsi.c
+++ b/drivers/scsi/esp_scsi.c
@@ -14,6 +14,7 @@
 #include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/irqreturn.h>
+#include <linux/log2.h>
 
 #include <asm/irq.h>
 #include <asm/io.h>
@@ -1130,7 +1131,7 @@ static int esp_reconnect(struct esp *esp)
 		if (!(bits & esp->scsi_id_mask))
 			goto do_reset;
 		bits &= ~esp->scsi_id_mask;
-		if (!bits || (bits & (bits - 1)))
+		if (!is_power_of_2(bits))
 			goto do_reset;
 
 		target = ffs(bits) - 1;

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
