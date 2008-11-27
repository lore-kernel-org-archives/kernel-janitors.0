From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 27 Nov 2008 22:12:55 +0000
Subject: [PATCH] udf: fix sparse warnings
Message-Id: <493049b5.170e660a.26c3.ffff8fd8@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org

Fix this sparse warnings:

  fs/udf/balloc.c:843:3: warning: returning void-valued expression
  fs/udf/balloc.c:847:3: warning: returning void-valued expression
  fs/udf/balloc.c:851:3: warning: returning void-valued expression
  fs/udf/balloc.c:855:3: warning: returning void-valued expression

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 fs/udf/balloc.c |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/udf/balloc.c b/fs/udf/balloc.c
index c0e87db..7328291 100644
--- a/fs/udf/balloc.c
+++ b/fs/udf/balloc.c
@@ -840,21 +840,21 @@ void udf_free_blocks(struct super_block *sb, struct inode *inode,
 	struct udf_part_map *map = &UDF_SB(sb)->s_partmaps[partition];
 
 	if (map->s_partition_flags & UDF_PART_FLAG_UNALLOC_BITMAP) {
-		return udf_bitmap_free_blocks(sb, inode,
-					      map->s_uspace.s_bitmap,
-					      bloc, offset, count);
+		udf_bitmap_free_blocks(sb, inode, map->s_uspace.s_bitmap,
+				       bloc, offset, count);
+		return;
 	} else if (map->s_partition_flags & UDF_PART_FLAG_UNALLOC_TABLE) {
-		return udf_table_free_blocks(sb, inode,
-					     map->s_uspace.s_table,
-					     bloc, offset, count);
+		udf_table_free_blocks(sb, inode, map->s_uspace.s_table,
+				      bloc, offset, count);
+		return;
 	} else if (map->s_partition_flags & UDF_PART_FLAG_FREED_BITMAP) {
-		return udf_bitmap_free_blocks(sb, inode,
-					      map->s_fspace.s_bitmap,
-					      bloc, offset, count);
+		udf_bitmap_free_blocks(sb, inode, map->s_fspace.s_bitmap,
+				       bloc, offset, count);
+		return;
 	} else if (map->s_partition_flags & UDF_PART_FLAG_FREED_TABLE) {
-		return udf_table_free_blocks(sb, inode,
-					     map->s_fspace.s_table,
-					     bloc, offset, count);
+		udf_table_free_blocks(sb, inode, map->s_fspace.s_table,
+				      bloc, offset, count);
+		return;
 	} else {
 		return;
 	}
-- 
1.5.6.3

