From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 03 Sep 2019 12:29:00 +0000
Subject: [PATCH] efs: Delete unnecessary checks before brelse()
Message-Id: <8fcea3ac-469f-a84b-e4d2-347f047307f8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 14:24:38 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the tests around the shown calls are not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/efs/inode.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/efs/inode.c b/fs/efs/inode.c
index 89e73a6f0d36..176061d107ed 100644
--- a/fs/efs/inode.c
+++ b/fs/efs/inode.c
@@ -262,7 +262,7 @@ efs_block_t efs_map_block(struct inode *inode, efs_block_t block) {
 			/* should never happen */
 			pr_err("couldn't find direct extent for indirect extent %d (block %u)\n",
 			       cur, block);
-			if (bh) brelse(bh);
+			brelse(bh);
 			return 0;
 		}

@@ -274,8 +274,7 @@ efs_block_t efs_map_block(struct inode *inode, efs_block_t block) {
 			(EFS_BLOCKSIZE / sizeof(efs_extent));

 		if (first || lastblock != iblock) {
-			if (bh) brelse(bh);
-
+			brelse(bh);
 			bh = sb_bread(inode->i_sb, iblock);
 			if (!bh) {
 				pr_err("%s() failed at block %d\n",
@@ -295,17 +294,17 @@ efs_block_t efs_map_block(struct inode *inode, efs_block_t block) {
 		if (ext.cooked.ex_magic != 0) {
 			pr_err("extent %d has bad magic number in block %d\n",
 			       cur, iblock);
-			if (bh) brelse(bh);
+			brelse(bh);
 			return 0;
 		}

 		if ((result = efs_extent_check(&ext, block, sb))) {
-			if (bh) brelse(bh);
+			brelse(bh);
 			in->lastextent = cur;
 			return result;
 		}
 	}
-	if (bh) brelse(bh);
+	brelse(bh);
 	pr_err("%s() failed to map block %u (indir)\n", __func__, block);
 	return 0;
 }
--
2.23.0
