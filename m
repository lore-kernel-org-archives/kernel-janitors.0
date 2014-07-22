From: Artemiy Volkov <artemiyv@acm.org>
Date: Tue, 22 Jul 2014 17:58:36 +0000
Subject: [PATCH 4/5] ext2: ialloc.c: Merge string literals on adjacent lines
Message-Id: <1406051917-3823-5-git-send-email-artemiyv@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch joins lines and merges quoted strings in ialloc.c, for use of grep-ability.

Signed-off-by: Artemiy Volkov <artemiyv@acm.org>
---
 fs/ext2/ialloc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/ext2/ialloc.c b/fs/ext2/ialloc.c
index 7d66fb0..94ebf89 100644
--- a/fs/ext2/ialloc.c
+++ b/fs/ext2/ialloc.c
@@ -55,8 +55,7 @@ read_inode_bitmap(struct super_block * sb, unsigned long block_group)
 	bh = sb_bread(sb, le32_to_cpu(desc->bg_inode_bitmap));
 	if (!bh)
 		ext2_error(sb, "read_inode_bitmap",
-			    "Cannot read inode bitmap - "
-			    "block_group = %lu, inode_bitmap = %u",
+			    "Cannot read inode bitmap - block_group = %lu, inode_bitmap = %u",
 			    block_group, le32_to_cpu(desc->bg_inode_bitmap));
 error_out:
 	return bh;
@@ -518,9 +517,8 @@ got:
 	ino += group * EXT2_INODES_PER_GROUP(sb) + 1;
 	if (ino < EXT2_FIRST_INO(sb) || ino > le32_to_cpu(es->s_inodes_count)) {
 		ext2_error (sb, "ext2_new_inode",
-			    "reserved inode or inode > inodes count - "
-			    "block_group = %d,inode=%lu", group,
-			    (unsigned long) ino);
+			    "reserved inode or inode > inodes count - block_group = %d,inode=%lu",
+			    group, (unsigned long) ino);
 		err = -EIO;
 		goto fail;
 	}
-- 
1.9.1

