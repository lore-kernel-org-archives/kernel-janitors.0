From: Artemiy Volkov <artemiyv@acm.org>
Date: Tue, 22 Jul 2014 17:58:33 +0000
Subject: [PATCH 1/5] ext2: super.c: Merge string literals on adjacent lines
Message-Id: <1406051917-3823-2-git-send-email-artemiyv@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch joins lines and merges quoted strings in super.c, for use of grep-ability.

Signed-off-by: Artemiy Volkov <artemiyv@acm.org>
---
 fs/ext2/super.c | 60 +++++++++++++++++++++++----------------------------------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index b88edc0..c99f6b4 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -107,8 +107,7 @@ void ext2_update_dynamic_rev(struct super_block *sb)
 		return;
 
 	ext2_msg(sb, KERN_WARNING,
-		     "warning: updating to rev %d because of "
-		     "new feature flag, running e2fsck is recommended",
+		     "warning: updating to rev %d because of new feature flag, running e2fsck is recommended",
 		     EXT2_DYNAMIC_REV);
 
 	es->s_first_ino = cpu_to_le32(EXT2_GOOD_OLD_FIRST_INO);
@@ -531,8 +530,8 @@ static int parse_options(char *options, struct super_block *sb)
 #else
 		case Opt_user_xattr:
 		case Opt_nouser_xattr:
-			ext2_msg(sb, KERN_INFO, "(no)user_xattr options"
-				"not supported");
+			ext2_msg(sb, KERN_INFO,
+				"(no)user_xattr options not supported");
 			break;
 #endif
 #ifdef CONFIG_EXT2_FS_POSIX_ACL
@@ -601,38 +600,33 @@ static int ext2_setup_super (struct super_block * sb,
 
 	if (le32_to_cpu(es->s_rev_level) > EXT2_MAX_SUPP_REV) {
 		ext2_msg(sb, KERN_ERR,
-			"error: revision level too high, "
-			"forcing read-only mode");
+			"error: revision level too high, forcing read-only mode");
 		res = MS_RDONLY;
 	}
 	if (read_only)
 		return res;
 	if (!(sbi->s_mount_state & EXT2_VALID_FS))
 		ext2_msg(sb, KERN_WARNING,
-			"warning: mounting unchecked fs, "
-			"running e2fsck is recommended");
+			"warning: mounting unchecked fs, running e2fsck is recommended");
 	else if ((sbi->s_mount_state & EXT2_ERROR_FS))
 		ext2_msg(sb, KERN_WARNING,
-			"warning: mounting fs with errors, "
-			"running e2fsck is recommended");
+			"warning: mounting fs with errors, running e2fsck is recommended");
 	else if ((__s16) le16_to_cpu(es->s_max_mnt_count) >= 0 &&
 		 le16_to_cpu(es->s_mnt_count) > 		 (unsigned short) (__s16) le16_to_cpu(es->s_max_mnt_count))
 		ext2_msg(sb, KERN_WARNING,
-			"warning: maximal mount count reached, "
-			"running e2fsck is recommended");
+			"warning: maximal mount count reached, running e2fsck is recommended");
 	else if (le32_to_cpu(es->s_checkinterval) &&
 		(le32_to_cpu(es->s_lastcheck) +
 			le32_to_cpu(es->s_checkinterval) <= get_seconds()))
 		ext2_msg(sb, KERN_WARNING,
-			"warning: checktime reached, "
-			"running e2fsck is recommended");
+			"warning: checktime reached, running e2fsck is recommended");
 	if (!le16_to_cpu(es->s_max_mnt_count))
 		es->s_max_mnt_count = cpu_to_le16(EXT2_DFL_MAX_MNT_COUNT);
 	le16_add_cpu(&es->s_mnt_count, 1);
 	if (test_opt (sb, DEBUG))
-		ext2_msg(sb, KERN_INFO, "%s, %s, bs=%lu, fs=%lu, gc=%lu, "
-			"bpg=%lu, ipg=%lu, mo=%04lx]",
+		ext2_msg(sb, KERN_INFO,
+			"%s, %s, bs=%lu, fs=%lu, gc=%lu, bpg=%lu, ipg=%lu, mo=%04lx]",
 			EXT2FS_VERSION, EXT2FS_DATE, sb->s_blocksize,
 			sbi->s_frag_size,
 			sbi->s_groups_count,
@@ -664,8 +658,7 @@ static int ext2_check_descriptors(struct super_block *sb)
 		    le32_to_cpu(gdp->bg_block_bitmap) > last_block)
 		{
 			ext2_error (sb, "ext2_check_descriptors",
-				    "Block bitmap for group %d"
-				    " not in group (block %lu)!",
+				    "Block bitmap for group %d not in group (block %lu)!",
 				    i, (unsigned long) le32_to_cpu(gdp->bg_block_bitmap));
 			return 0;
 		}
@@ -673,8 +666,7 @@ static int ext2_check_descriptors(struct super_block *sb)
 		    le32_to_cpu(gdp->bg_inode_bitmap) > last_block)
 		{
 			ext2_error (sb, "ext2_check_descriptors",
-				    "Inode bitmap for group %d"
-				    " not in group (block %lu)!",
+				    "Inode bitmap for group %d not in group (block %lu)!",
 				    i, (unsigned long) le32_to_cpu(gdp->bg_inode_bitmap));
 			return 0;
 		}
@@ -683,8 +675,7 @@ static int ext2_check_descriptors(struct super_block *sb)
 		    last_block)
 		{
 			ext2_error (sb, "ext2_check_descriptors",
-				    "Inode table for group %d"
-				    " not in group (block %lu)!",
+				    "Inode table for group %d not in group (block %lu)!",
 				    i, (unsigned long) le32_to_cpu(gdp->bg_inode_table));
 			return 0;
 		}
@@ -876,8 +867,7 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 	     EXT2_HAS_RO_COMPAT_FEATURE(sb, ~0U) ||
 	     EXT2_HAS_INCOMPAT_FEATURE(sb, ~0U)))
 		ext2_msg(sb, KERN_WARNING,
-			"warning: feature flags set on rev 0 fs, "
-			"running e2fsck is recommended");
+			"warning: feature flags set on rev 0 fs, running e2fsck is recommended");
 	/*
 	 * Check feature flags regardless of the revision level, since we
 	 * previously didn't change the revision level when setting the flags,
@@ -885,15 +875,15 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 	 */
 	features = EXT2_HAS_INCOMPAT_FEATURE(sb, ~EXT2_FEATURE_INCOMPAT_SUPP);
 	if (features) {
-		ext2_msg(sb, KERN_ERR,	"error: couldn't mount because of "
-		       "unsupported optional features (%x)",
+		ext2_msg(sb, KERN_ERR,
+			"error: couldn't mount because of unsupported optional features (%x)",
 			le32_to_cpu(features));
 		goto failed_mount;
 	}
 	if (!(sb->s_flags & MS_RDONLY) &&
 	    (features = EXT2_HAS_RO_COMPAT_FEATURE(sb, ~EXT2_FEATURE_RO_COMPAT_SUPP))){
-		ext2_msg(sb, KERN_ERR, "error: couldn't mount RDWR because of "
-		       "unsupported optional features (%x)",
+		ext2_msg(sb, KERN_ERR,
+			"error: couldn't mount RDWR because of unsupported optional features (%x)",
 		       le32_to_cpu(features));
 		goto failed_mount;
 	}
@@ -921,8 +911,8 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 		offset = (sb_block*BLOCK_SIZE) % blocksize;
 		bh = sb_bread(sb, logic_sb_block);
 		if(!bh) {
-			ext2_msg(sb, KERN_ERR, "error: couldn't read"
-				"superblock on 2nd try");
+			ext2_msg(sb, KERN_ERR,
+				"error: couldn't read superblock on 2nd try");
 			goto failed_sbi;
 		}
 		es = (struct ext2_super_block *) (((char *)bh->b_data) + offset);
@@ -989,8 +979,7 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 
 	if (sb->s_blocksize != sbi->s_frag_size) {
 		ext2_msg(sb, KERN_ERR,
-			"error: fragsize %lu != blocksize %lu"
-			"(not supported yet)",
+			"error: fragsize %lu != blocksize %lu (not supported yet)",
 			sbi->s_frag_size, sb->s_blocksize);
 		goto failed_mount;
 	}
@@ -1286,8 +1275,8 @@ static int ext2_remount (struct super_block * sb, int * flags, char * data)
 
 	es = sbi->s_es;
 	if ((sbi->s_mount_opt ^ old_mount_opt) & EXT2_MOUNT_XIP) {
-		ext2_msg(sb, KERN_WARNING, "warning: refusing change of "
-			 "xip flag with busy inodes while remounting");
+		ext2_msg(sb, KERN_WARNING,
+			"warning: refusing change of xip flag with busy inodes while remounting");
 		sbi->s_mount_opt &= ~EXT2_MOUNT_XIP;
 		sbi->s_mount_opt |= old_mount_opt & EXT2_MOUNT_XIP;
 	}
@@ -1322,8 +1311,7 @@ static int ext2_remount (struct super_block * sb, int * flags, char * data)
 					       ~EXT2_FEATURE_RO_COMPAT_SUPP);
 		if (ret) {
 			ext2_msg(sb, KERN_WARNING,
-				"warning: couldn't remount RDWR because of "
-				"unsupported optional features (%x).",
+				"warning: couldn't remount RDWR because of unsupported optional features (%x).",
 				le32_to_cpu(ret));
 			err = -EROFS;
 			goto restore_opts;
-- 
1.9.1

