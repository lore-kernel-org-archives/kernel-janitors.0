From: vignesh babu <vignesh.babu@wipro.com>
Date: Tue, 12 Jun 2007 05:13:05 +0000
Subject: [KJ] [PATCH]is_power_of_2-mtd/ubi/build.c
Message-Id: <1181624466.3109.23.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, dedekind@infradead.org
Cc: Kernel Janitors List <kernel-janitors@lists.osdl.org>, linux-mtd@lists.infradead.org


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 555d594..54e923f 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -33,6 +33,7 @@
 #include <linux/moduleparam.h>
 #include <linux/stringify.h>
 #include <linux/stat.h>
+#include <linux/log2.h>
 #include "ubi.h"
 
 /* Maximum length of the 'mtd=' parameter */
@@ -422,8 +423,7 @@ static int io_init(struct ubi_device *ubi)
 	ubi->hdrs_min_io_size = ubi->mtd->writesize >> ubi->mtd->subpage_sft;
 
 	/* Make sure minimal I/O unit is power of 2 */
-	if (ubi->min_io_size = 0 ||
-	    (ubi->min_io_size & (ubi->min_io_size - 1))) {
+	if (!is_power_of_2(ubi->min_io_size)) {
 		ubi_err("bad min. I/O unit");
 		return -EINVAL;
 	}

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
