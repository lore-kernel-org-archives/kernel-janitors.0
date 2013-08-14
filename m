From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Aug 2013 11:41:36 +0000
Subject: [patch] f2fs: alloc_page() doesn't return an ERR_PTR
Message-Id: <20130814114136.GA8044@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

alloc_page() returns a NULL on failure, it never returns an ERR_PTR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index f5172e2..3e87fe0 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1515,8 +1515,8 @@ int restore_node_summary(struct f2fs_sb_info *sbi,
 
 	/* alloc temporal page for read node */
 	page = alloc_page(GFP_NOFS | __GFP_ZERO);
-	if (IS_ERR(page))
-		return PTR_ERR(page);
+	if (!page)
+		return -ENOMEM;
 	lock_page(page);
 
 	/* scan the node segment */
