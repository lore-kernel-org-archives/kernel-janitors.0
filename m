From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Nov 2018 16:30:43 +0000
Subject: [PATCH] ext4: clean up indentation issues, remove extraneous tabs
Message-Id: <20181123163043.14178-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several lines that are indented too far, clean these
up by removing the tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ext4/migrate.c | 12 ++++++------
 fs/ext4/super.c   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/ext4/migrate.c b/fs/ext4/migrate.c
index 61a9d1927817..5ae61cd8c5c9 100644
--- a/fs/ext4/migrate.c
+++ b/fs/ext4/migrate.c
@@ -535,22 +535,22 @@ int ext4_ext_migrate(struct inode *inode)
 	if (i_data[EXT4_IND_BLOCK]) {
 		retval = update_ind_extent_range(handle, tmp_inode,
 				le32_to_cpu(i_data[EXT4_IND_BLOCK]), &lb);
-			if (retval)
-				goto err_out;
+		if (retval)
+			goto err_out;
 	} else
 		lb.curr_block += max_entries;
 	if (i_data[EXT4_DIND_BLOCK]) {
 		retval = update_dind_extent_range(handle, tmp_inode,
 				le32_to_cpu(i_data[EXT4_DIND_BLOCK]), &lb);
-			if (retval)
-				goto err_out;
+		if (retval)
+			goto err_out;
 	} else
 		lb.curr_block += max_entries * max_entries;
 	if (i_data[EXT4_TIND_BLOCK]) {
 		retval = update_tind_extent_range(handle, tmp_inode,
 				le32_to_cpu(i_data[EXT4_TIND_BLOCK]), &lb);
-			if (retval)
-				goto err_out;
+		if (retval)
+			goto err_out;
 	}
 	/*
 	 * Build the last extent
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 5603a4a1a864..15fc71398747 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1940,7 +1940,7 @@ static int handle_mount_opt(struct super_block *sb, char *opt, int token,
 #ifdef CONFIG_FS_DAX
 		ext4_msg(sb, KERN_WARNING,
 		"DAX enabled. Warning: EXPERIMENTAL, use at your own risk");
-			sbi->s_mount_opt |= m->mount_opt;
+		sbi->s_mount_opt |= m->mount_opt;
 #else
 		ext4_msg(sb, KERN_INFO, "dax option not supported");
 		return -1;
-- 
2.19.1
