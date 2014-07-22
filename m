From: Artemiy Volkov <artemiyv@acm.org>
Date: Tue, 22 Jul 2014 17:58:34 +0000
Subject: [PATCH 2/5] ext2: balloc.c: Merge string literals on adjacent lines
Message-Id: <1406051917-3823-3-git-send-email-artemiyv@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch joins lines and merges quoted strings in balloc.c, for use of grep-ability.

Signed-off-by: Artemiy Volkov <artemiyv@acm.org>
---
 fs/ext2/balloc.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/fs/ext2/balloc.c b/fs/ext2/balloc.c
index 9f9992b..787a3ff 100644
--- a/fs/ext2/balloc.c
+++ b/fs/ext2/balloc.c
@@ -47,8 +47,7 @@ struct ext2_group_desc * ext2_get_group_desc(struct super_block * sb,
 
 	if (block_group >= sbi->s_groups_count) {
 		ext2_error (sb, "ext2_get_group_desc",
-			    "block_group >= groups_count - "
-			    "block_group = %d, groups_count = %lu",
+			    "block_group >= groups_count - block_group = %d, groups_count = %lu",
 			    block_group, sbi->s_groups_count);
 
 		return NULL;
@@ -58,8 +57,7 @@ struct ext2_group_desc * ext2_get_group_desc(struct super_block * sb,
 	offset = block_group & (EXT2_DESC_PER_BLOCK(sb) - 1);
 	if (!sbi->s_group_desc[group_desc]) {
 		ext2_error (sb, "ext2_get_group_desc",
-			    "Group descriptor not loaded - "
-			    "block_group = %d, group_desc = %lu, desc = %lu",
+			    "Group descriptor not loaded - block_group = %d, group_desc = %lu, desc = %lu",
 			     block_group, group_desc, offset);
 		return NULL;
 	}
@@ -108,8 +106,7 @@ static int ext2_valid_block_bitmap(struct super_block *sb,
 
 err_out:
 	ext2_error(sb, __func__,
-			"Invalid block bitmap - "
-			"block_group = %d, block = %lu",
+			"Invalid block bitmap - block_group = %d, block = %lu",
 			block_group, bitmap_blk);
 	return 0;
 }
@@ -134,8 +131,7 @@ read_block_bitmap(struct super_block *sb, unsigned int block_group)
 	bh = sb_getblk(sb, bitmap_blk);
 	if (unlikely(!bh)) {
 		ext2_error(sb, __func__,
-			    "Cannot read block bitmap - "
-			    "block_group = %d, block_bitmap = %u",
+			    "Cannot read block bitmap - block_group = %d, block_bitmap = %u",
 			    block_group, le32_to_cpu(desc->bg_block_bitmap));
 		return NULL;
 	}
@@ -145,8 +141,7 @@ read_block_bitmap(struct super_block *sb, unsigned int block_group)
 	if (bh_submit_read(bh) < 0) {
 		brelse(bh);
 		ext2_error(sb, __func__,
-			    "Cannot read block bitmap - "
-			    "block_group = %d, block_bitmap = %u",
+			    "Cannot read block bitmap - block_group = %d, block_bitmap = %u",
 			    block_group, le32_to_cpu(desc->bg_block_bitmap));
 		return NULL;
 	}
@@ -212,8 +207,7 @@ restart:
 	while (n) {
 		rsv = rb_entry(n, struct ext2_reserve_window_node, rsv_node);
 		if (verbose)
-			printk("reservation window 0x%p "
-				"start: %lu, end: %lu\n",
+			printk("reservation window 0x%p start: %lu, end: %lu\n",
 				rsv, rsv->rsv_start, rsv->rsv_end);
 		if (rsv->rsv_start && rsv->rsv_start >= rsv->rsv_end) {
 			printk("Bad reservation %p (start >= end)\n",
@@ -492,8 +486,8 @@ void ext2_free_blocks (struct inode * inode, unsigned long block,
 	    block + count < block ||
 	    block + count > le32_to_cpu(es->s_blocks_count)) {
 		ext2_error (sb, "ext2_free_blocks",
-			    "Freeing blocks not in datazone - "
-			    "block = %lu, count = %lu", block, count);
+			    "Freeing blocks not in datazone - block = %lu, count = %lu",
+			    block, count);
 		goto error_return;
 	}
 
@@ -529,8 +523,7 @@ do_more:
 	    in_range (block + count - 1, le32_to_cpu(desc->bg_inode_table),
 		      sbi->s_itb_per_group)) {
 		ext2_error (sb, "ext2_free_blocks",
-			    "Freeing blocks in system zones - "
-			    "Block = %lu, count = %lu",
+			    "Freeing blocks in system zones - Block = %lu, count = %lu",
 			    block, count);
 		goto error_return;
 	}
@@ -1376,8 +1369,7 @@ allocated:
 	    in_range(ret_block + num - 1, le32_to_cpu(gdp->bg_inode_table),
 		      EXT2_SB(sb)->s_itb_per_group)) {
 		ext2_error(sb, "ext2_new_blocks",
-			    "Allocating block in system zone - "
-			    "blocks from "E2FSBLK", length %lu",
+			    "Allocating block in system zone - blocks from "E2FSBLK", length %lu",
 			    ret_block, num);
 		/*
 		 * ext2_try_to_allocate marked the blocks we allocated as in
@@ -1391,9 +1383,9 @@ allocated:
 
 	if (ret_block + num - 1 >= le32_to_cpu(es->s_blocks_count)) {
 		ext2_error(sb, "ext2_new_blocks",
-			    "block("E2FSBLK") >= blocks count(%d) - "
-			    "block_group = %d, es = %p ", ret_block,
-			le32_to_cpu(es->s_blocks_count), group_no, es);
+			    "block("E2FSBLK") >= blocks count(%d) - block_group = %d, es = %p ",
+			    ret_block, le32_to_cpu(es->s_blocks_count),
+			    group_no, es);
 		goto out;
 	}
 
-- 
1.9.1

