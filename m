From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Aug 2013 05:54:56 +0000
Subject: [patch v2] f2fs: alloc_page() doesn't return an ERR_PTR
Message-Id: <20130815055456.GD23580@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376486676.2354.5.camel@kjgkr>
In-Reply-To: <1376486676.2354.5.camel@kjgkr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

alloc_page() returns a NULL on failure, it never returns an ERR_PTR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: fix the calls in recovery.c as well.

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
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 639eb34..889b4bd 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -129,8 +129,8 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head)
 
 	/* read node page */
 	page = alloc_page(GFP_F2FS_ZERO);
-	if (IS_ERR(page))
-		return PTR_ERR(page);
+	if (!page)
+		return -ENOMEM;
 	lock_page(page);
 
 	while (1) {
@@ -367,7 +367,7 @@ static int recover_data(struct f2fs_sb_info *sbi,
 
 	/* read node page */
 	page = alloc_page(GFP_NOFS | __GFP_ZERO);
-	if (IS_ERR(page))
+	if (!page)
 		return -ENOMEM;
 
 	lock_page(page);

