From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 21:10:04 +0000
Subject: [PATCH] lightnvm/pblk-gc: Delete an error message for a failed memory allocation in pblk_gc_line_pre
Message-Id: <0ef6e852-9c76-ce74-6f21-c0398722c9e5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-block@vger.kernel.org, Matias Bjorling <mb@lightnvm.io>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 22:00:15 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/lightnvm/pblk-gc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/lightnvm/pblk-gc.c b/drivers/lightnvm/pblk-gc.c
index 9c8e114c8a54..54cdb4360366 100644
--- a/drivers/lightnvm/pblk-gc.c
+++ b/drivers/lightnvm/pblk-gc.c
@@ -147,10 +147,8 @@ static void pblk_gc_line_prepare_ws(struct work_struct *work)
 	int ret;
 
 	invalid_bitmap = kmalloc(lm->sec_bitmap_len, GFP_KERNEL);
-	if (!invalid_bitmap) {
-		pr_err("pblk: could not allocate GC invalid bitmap\n");
+	if (!invalid_bitmap)
 		goto fail_free_ws;
-	}
 
 	emeta_buf = pblk_malloc(lm->emeta_len[0], l_mg->emeta_alloc_type,
 								GFP_KERNEL);
-- 
2.15.1

