From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 06 Aug 2017 15:34:15 +0000
Subject: [PATCH] block-AoE: Delete an error message for a failed memory allocation in aoechr_error()
Message-Id: <52881fa9-34ef-5604-795b-1f151b20f80d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, "Ed L. Cashin" <ed.cashin@acm.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 6 Aug 2017 17:27:18 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/aoe/aoechr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/block/aoe/aoechr.c b/drivers/block/aoe/aoechr.c
index ab41be625a53..8eea2529da20 100644
--- a/drivers/block/aoe/aoechr.c
+++ b/drivers/block/aoe/aoechr.c
@@ -140,10 +140,8 @@ bail:		spin_unlock_irqrestore(&emsgs_lock, flags);
 	}
 
 	mp = kmemdup(msg, n, GFP_ATOMIC);
-	if (mp = NULL) {
-		printk(KERN_ERR "aoe: allocation failure, len=%ld\n", n);
+	if (!mp)
 		goto bail;
-	}
 
 	em->msg = mp;
 	em->flags |= EMFL_VALID;
-- 
2.13.4

