From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Aug 2017 15:36:53 +0000
Subject: [PATCH 1/3] fs-udf: Delete an error message for a failed memory allocation in two functions
Message-Id: <c06a4161-6f8f-fde9-61b7-d5117a07bd6e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6eedcf1a-57f0-2ba4-d1b8-47a8da945d87@users.sourceforge.net>
In-Reply-To: <6eedcf1a-57f0-2ba4-d1b8-47a8da945d87@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Aug 2017 16:14:19 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/udf/inode.c | 7 +------
 fs/udf/super.c | 2 --
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/udf/inode.c b/fs/udf/inode.c
index 18fdb9d90812..7b50afc6e0c3 100644
--- a/fs/udf/inode.c
+++ b/fs/udf/inode.c
@@ -1572,13 +1572,8 @@ static int udf_alloc_i_data(struct inode *inode, size_t size)
 {
 	struct udf_inode_info *iinfo = UDF_I(inode);
 	iinfo->i_ext.i_data = kmalloc(size, GFP_KERNEL);
-
-	if (!iinfo->i_ext.i_data) {
-		udf_err(inode->i_sb, "(ino %ld) no free memory\n",
-			inode->i_ino);
+	if (!iinfo->i_ext.i_data)
 		return -ENOMEM;
-	}
-
 	return 0;
 }
 
diff --git a/fs/udf/super.c b/fs/udf/super.c
index 462ac2e9258c..ca4b4274b524 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -271,6 +271,4 @@ static int udf_sb_alloc_partition_maps(struct super_block *sb, u32 count)
 	if (!sbi->s_partmaps) {
-		udf_err(sb, "Unable to allocate space for %d partition maps\n",
-			count);
 		sbi->s_partitions = 0;
 		return -ENOMEM;
 	}
-- 
2.14.0

