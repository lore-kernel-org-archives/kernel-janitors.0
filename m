From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 16:15:57 +0000
Subject: [PATCH 2/2] fs-qnx6: Less checks in qnx6_mmi_fill_super() after error detection
Message-Id: <44582469-f671-267a-0a60-cbe50fd16b51@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55b824fd-3f8a-4ca6-583f-27f584cd237a@users.sourceforge.net>
In-Reply-To: <55b824fd-3f8a-4ca6-583f-27f584cd237a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabian Frederick <fabf@skynet.be>, Kai Bankett <chaosman@ontika.net>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 18:00:24 +0200

Two pointer checks could be repeated by the qnx6_mmi_fill_super() function
during error handling even if the relevant properties can be determined
for the involved variables before by source code analysis.

* Adjust jump targets so that extra checks can be omitted at the end.

* Delete an initialisation for the variables "bh2" and "qsb"
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/qnx6/super_mmi.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/fs/qnx6/super_mmi.c b/fs/qnx6/super_mmi.c
index fdcfc99e2db6..eb98479f9ec1 100644
--- a/fs/qnx6/super_mmi.c
+++ b/fs/qnx6/super_mmi.c
@@ -34,9 +34,9 @@ static void qnx6_mmi_copy_sb(struct qnx6_super_block *qsb,
 
 struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 {
-	struct buffer_head *bh1, *bh2 = NULL;
+	struct buffer_head *bh1, *bh2;
 	struct qnx6_mmi_super_block *sb1, *sb2;
-	struct qnx6_super_block *qsb = NULL;
+	struct qnx6_super_block *qsb;
 	struct qnx6_sb_info *sbi;
 	__u64 offset;
 
@@ -52,7 +52,7 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 	if (fs32_to_cpu(sbi, sb1->sb_magic) != QNX6_SUPER_MAGIC) {
 		if (!silent) {
 			pr_err("wrong signature (magic) in superblock #1.\n");
-			goto out;
+			goto brelse_first;
 		}
 	}
 
@@ -60,7 +60,7 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 	if (fs32_to_cpu(sbi, sb1->sb_checksum) ! 				crc32_be(0, (char *)(bh1->b_data + 8), 504)) {
 		pr_err("superblock #1 checksum error\n");
-		goto out;
+		goto brelse_first;
 	}
 
 	/* calculate second superblock blocknumber */
@@ -70,38 +70,38 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 	/* set new blocksize */
 	if (!sb_set_blocksize(s, fs32_to_cpu(sbi, sb1->sb_blocksize))) {
 		pr_err("unable to set blocksize\n");
-		goto out;
+		goto brelse_first;
 	}
 	/* blocksize invalidates bh - pull it back in */
 	brelse(bh1);
 	bh1 = sb_bread(s, 0);
 	if (!bh1)
-		goto out;
+		goto exit;
 	sb1 = (struct qnx6_mmi_super_block *)bh1->b_data;
 
 	/* read second superblock */
 	bh2 = sb_bread(s, offset);
 	if (!bh2) {
 		pr_err("unable to read the second superblock\n");
-		goto out;
+		goto brelse_first;
 	}
 	sb2 = (struct qnx6_mmi_super_block *)bh2->b_data;
 	if (fs32_to_cpu(sbi, sb2->sb_magic) != QNX6_SUPER_MAGIC) {
 		if (!silent)
 			pr_err("wrong signature (magic) in superblock #2.\n");
-		goto out;
+		goto brelse_second;
 	}
 
 	/* checksum check - start at byte 8 and end at byte 512 */
 	if (fs32_to_cpu(sbi, sb2->sb_checksum)
 			!= crc32_be(0, (char *)(bh2->b_data + 8), 504)) {
 		pr_err("superblock #1 checksum error\n");
-		goto out;
+		goto brelse_second;
 	}
 
 	qsb = kmalloc(sizeof(*qsb), GFP_KERNEL);
 	if (!qsb)
-		goto out;
+		goto brelse_second;
 
 	if (fs64_to_cpu(sbi, sb1->sb_serial) >
 					fs64_to_cpu(sbi, sb2->sb_serial)) {
@@ -136,11 +136,10 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 
 	/* success */
 	return sbi->sb;
-
-out:
-	if (bh1 != NULL)
-		brelse(bh1);
-	if (bh2 != NULL)
-		brelse(bh2);
+brelse_second:
+	brelse(bh2);
+brelse_first:
+	brelse(bh1);
+exit:
 	return NULL;
 }
-- 
2.14.0

