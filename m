From: Dan Carpenter <error27@gmail.com>
Date: Fri, 27 May 2011 06:27:16 +0000
Subject: [patch] xen/blkback: potential null dereference in error handling
Message-Id: <20110527062701.GK14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Jan Beulich <jbeulich@novell.com>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

blkbk->pending_pages can be NULL here so I added a check for it.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Perhaps this is not the a very optimized solution, but it's error
handling code so it's not performance critical.

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index c73910c..1c7a59d 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -810,7 +810,7 @@ static int __init xen_blkif_init(void)
 	kfree(blkbk->pending_reqs);
 	kfree(blkbk->pending_grant_handles);
 	for (i = 0; i < mmap_pages; i++) {
-		if (blkbk->pending_pages[i])
+		if (blkbk->pending_pages && blkbk->pending_pages[i])
 			__free_page(blkbk->pending_pages[i]);
 	}
 	kfree(blkbk->pending_pages);
