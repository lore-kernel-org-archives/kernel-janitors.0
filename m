From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 03 Sep 2019 18:56:05 +0000
Subject: [PATCH] fs/sysv: Delete unnecessary checks before brelse()
Message-Id: <e5739a6d-cecd-5e76-df30-d74554681fd1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 20:52:07 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the tests around the shown calls are not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/sysv/balloc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/sysv/balloc.c b/fs/sysv/balloc.c
index 0e69dbdf7277..dd7fdc728ba7 100644
--- a/fs/sysv/balloc.c
+++ b/fs/sysv/balloc.c
@@ -195,8 +195,7 @@ unsigned long sysv_count_free_blocks(struct super_block * sb)
 			break;

 		block = fs32_to_cpu(sbi, zone);
-		if (bh)
-			brelse(bh);
+		brelse(bh);

 		if (block < sbi->s_firstdatazone || block >= sbi->s_nzones)
 			goto Einval;
@@ -207,8 +206,7 @@ unsigned long sysv_count_free_blocks(struct super_block * sb)
 		n = fs16_to_cpu(sbi, *(__fs16*)bh->b_data);
 		blocks = get_chunk(sb, bh);
 	}
-	if (bh)
-		brelse(bh);
+	brelse(bh);
 	if (count != sb_count)
 		goto Ecount;
 done:
@@ -224,8 +222,7 @@ unsigned long sysv_count_free_blocks(struct super_block * sb)
 	goto trust_sb;
 E2big:
 	printk("sysv_count_free_blocks: >flc_size entries in free-list block\n");
-	if (bh)
-		brelse(bh);
+	brelse(bh);
 trust_sb:
 	count = sb_count;
 	goto done;
--
2.23.0
