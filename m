From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 13 May 2012 14:41:04 +0000
Subject: [patch] ext4: potential NULL dereference on error
Message-Id: <20120513144104.GA21998@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

The ext4_get_group_desc() function returns NULL on error, and
ext4_free_inodes_count() function dereferences it without checking.
There is a check on the next line, but it's too late.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker fix.

diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
index a044a9b..1526f33 100644
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@ -389,7 +389,7 @@ static int find_group_orlov(struct super_block *sb, struct inode *parent,
 	struct ext4_sb_info *sbi = EXT4_SB(sb);
 	ext4_group_t real_ngroups = ext4_get_groups_count(sb);
 	int inodes_per_group = EXT4_INODES_PER_GROUP(sb);
-	unsigned int freei, avefreei, grp_free;
+	unsigned int freei, avefreei;
 	ext4_fsblk_t freeb, avefreec;
 	unsigned int ndirs;
 	int max_dirs, min_inodes;
@@ -399,6 +399,7 @@ static int find_group_orlov(struct super_block *sb, struct inode *parent,
 	struct orlov_stats stats;
 	int flex_size = ext4_flex_bg_size(sbi);
 	struct dx_hash_info hinfo;
+	unsigned int grp_free = 0;
 
 	ngroups = real_ngroups;
 	if (flex_size > 1) {
@@ -508,7 +509,8 @@ fallback_retry:
 	for (i = 0; i < ngroups; i++) {
 		grp = (parent_group + i) % ngroups;
 		desc = ext4_get_group_desc(sb, grp, NULL);
-		grp_free = ext4_free_inodes_count(sb, desc);
+		if (desc)
+			grp_free = ext4_free_inodes_count(sb, desc);
 		if (desc && grp_free && grp_free >= avefreei) {
 			*group = grp;
 			return 0;
