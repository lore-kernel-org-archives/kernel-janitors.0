From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:45:04 +0000
Subject: [PATCH] vmalloc: Remove redundant unlikely()
Message-Id: <1291905904-32716-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 mm/vmalloc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index eb5cc7d..31dcb64 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -748,7 +748,7 @@ static struct vmap_block *new_vmap_block(gfp_t gfp_mask)
 	va = alloc_vmap_area(VMAP_BLOCK_SIZE, VMAP_BLOCK_SIZE,
 					VMALLOC_START, VMALLOC_END,
 					node, gfp_mask);
-	if (unlikely(IS_ERR(va))) {
+	if (IS_ERR(va)) {
 		kfree(vb);
 		return ERR_CAST(va);
 	}
-- 
1.7.0.4

