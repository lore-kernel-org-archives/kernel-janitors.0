From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 10:46:53 +0000
Subject: [PATCH] freevxfs: Delete an error message for a failed memory allocation in vxfs_fill_super()
Message-Id: <56e657d1-1df2-53a5-0ea8-c3e8b158b3e1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>, =?UTF-8?Q?Krzysztof_B=c5=82aszkowski?= <kb@sysmikro.com.pl>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 12:40:30 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/freevxfs/vxfs_super.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/freevxfs/vxfs_super.c b/fs/freevxfs/vxfs_super.c
index 455ce5b77e9b..9be45aab21f5 100644
--- a/fs/freevxfs/vxfs_super.c
+++ b/fs/freevxfs/vxfs_super.c
@@ -223,10 +223,8 @@ static int vxfs_fill_super(struct super_block *sbp, void *dp, int silent)
 	sbp->s_flags |= MS_RDONLY;
 
 	infp = kzalloc(sizeof(*infp), GFP_KERNEL);
-	if (!infp) {
-		printk(KERN_WARNING "vxfs: unable to allocate incore superblock\n");
+	if (!infp)
 		return -ENOMEM;
-	}
 
 	bsize = sb_min_blocksize(sbp, BLOCK_SIZE);
 	if (!bsize) {
-- 
2.14.0

