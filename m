From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Jun 2018 15:14:56 +0000
Subject: [PATCH][next] lightnvm: pblk: fix resource leak of invalid_bitmap
Message-Id: <20180605151456.20359-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matias Bjorling <mb@lightnvm.io>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the error exit path when the emeta could not be
interpreted is via fail_free_ws and this fails to free
invalid_bitmap.  Fix this by adding another exit label and
exiting via this to kfree invalid_bitmap.

Detected by CoverityScan, CID#1469659 ("Resource leak")

Fixes: 48b8d20895f8 ("lightnvm: pblk: garbage collect lines with failed writes")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/lightnvm/pblk-gc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/lightnvm/pblk-gc.c b/drivers/lightnvm/pblk-gc.c
index df88f1bdd921..31a0a1b3868b 100644
--- a/drivers/lightnvm/pblk-gc.c
+++ b/drivers/lightnvm/pblk-gc.c
@@ -203,7 +203,7 @@ static void pblk_gc_line_prepare_ws(struct work_struct *work)
 		if (!lba_list) {
 			pr_err("pblk: could not interpret emeta (line %d)\n",
 					line->id);
-			goto fail_free_ws;
+			goto fail_free_invalid_bitmap;
 		}
 	}
 
@@ -280,6 +280,7 @@ static void pblk_gc_line_prepare_ws(struct work_struct *work)
 	kfree(gc_rq);
 fail_free_lba_list:
 	pblk_mfree(lba_list, l_mg->emeta_alloc_type);
+fail_free_invalid_bitmap:
 	kfree(invalid_bitmap);
 fail_free_ws:
 	kfree(line_ws);
-- 
2.17.0

