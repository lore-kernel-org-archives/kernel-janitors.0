From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 14:23:31 +0000
Subject: [PATCH] metag-TCM: Delete an error message for a failed memory allocation in tcm_add_region()
Message-Id: <39aa4ad5-ba12-ee30-1ca9-8699acde521b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-metag@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 16:16:32 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/metag/kernel/tcm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/metag/kernel/tcm.c b/arch/metag/kernel/tcm.c
index 5d102b31ce84..6c9985591cf1 100644
--- a/arch/metag/kernel/tcm.c
+++ b/arch/metag/kernel/tcm.c
@@ -115,10 +115,8 @@ int __init tcm_add_region(struct tcm_region *reg)
 	struct tcm_pool *pool;
 
 	pool = kmalloc(sizeof(*pool), GFP_KERNEL);
-	if (!pool) {
-		pr_err("Failed to alloc memory for TCM pool!\n");
+	if (!pool)
 		return -ENOMEM;
-	}
 
 	pool->tag = reg->tag;
 	pool->start = reg->res.start;
-- 
2.12.3

