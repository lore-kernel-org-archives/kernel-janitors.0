From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Aug 2017 15:38:55 +0000
Subject: [PATCH 3/3] fs-udf: Adjust two checks for null pointers
Message-Id: <1e627b28-e9e6-44a1-e43c-4c32b106e11e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6eedcf1a-57f0-2ba4-d1b8-47a8da945d87@users.sourceforge.net>
In-Reply-To: <6eedcf1a-57f0-2ba4-d1b8-47a8da945d87@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Aug 2017 17:03:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/udf/super.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/udf/super.c b/fs/udf/super.c
index 0dc7c2d9f0fa..93c59630512b 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -321,7 +321,8 @@ static void udf_sb_free_partitions(struct super_block *sb)
 {
 	struct udf_sb_info *sbi = UDF_SB(sb);
 	int i;
-	if (sbi->s_partmaps = NULL)
+
+	if (!sbi->s_partmaps)
 		return;
 	for (i = 0; i < sbi->s_partitions; i++)
 		udf_free_partition(&sbi->s_partmaps[i]);
@@ -1068,7 +1069,7 @@ static struct udf_bitmap *udf_sb_alloc_bitmap(struct super_block *sb, u32 index)
 	else
 		bitmap = vzalloc(size); /* TODO: get rid of vzalloc */
 
-	if (bitmap = NULL)
+	if (!bitmap)
 		return NULL;
 
 	bitmap->s_nr_groups = nr_groups;
-- 
2.14.0

