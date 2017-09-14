From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Sep 2017 14:55:06 +0000
Subject: [PATCH] ocfs2: remove some redundant assignments
Message-Id: <20170914145506.10126-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The initialization of free_space is redundant as free_space is
updated later on and the initialized value is hence never used.

The pointer new_list is set but never used so it can be completely
removed.

Cleans up clang scan-build warnings.
"Value stored to 'free_space' during its initialization is never read"
"Value stored to 'new_list' is never read"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ocfs2/dir.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
index febe6312ceff..fe7e8653f4a9 100644
--- a/fs/ocfs2/dir.c
+++ b/fs/ocfs2/dir.c
@@ -3371,7 +3371,7 @@ static int ocfs2_find_dir_space_id(struct inode *dir, struct buffer_head *di_bh,
 	struct ocfs2_dir_entry *de, *last_de = NULL;
 	char *de_buf, *limit;
 	unsigned long offset = 0;
-	unsigned int rec_len, new_rec_len, free_space = dir->i_sb->s_blocksize;
+	unsigned int rec_len, new_rec_len, free_space;
 
 	/*
 	 * This calculates how many free bytes we'd have in block zero, should
@@ -3662,7 +3662,7 @@ static void ocfs2_dx_dir_transfer_leaf(struct inode *dir, u32 split_hash,
 	int i, j, num_used;
 	u32 major_hash;
 	struct ocfs2_dx_leaf *orig_dx_leaf, *new_dx_leaf;
-	struct ocfs2_dx_entry_list *orig_list, *new_list, *tmp_list;
+	struct ocfs2_dx_entry_list *orig_list, *tmp_list;
 	struct ocfs2_dx_entry *dx_entry;
 
 	tmp_list = &tmp_dx_leaf->dl_list;
@@ -3671,7 +3671,6 @@ static void ocfs2_dx_dir_transfer_leaf(struct inode *dir, u32 split_hash,
 		orig_dx_leaf = (struct ocfs2_dx_leaf *) orig_dx_leaves[i]->b_data;
 		orig_list = &orig_dx_leaf->dl_list;
 		new_dx_leaf = (struct ocfs2_dx_leaf *) new_dx_leaves[i]->b_data;
-		new_list = &new_dx_leaf->dl_list;
 
 		num_used = le16_to_cpu(orig_list->de_num_used);
 
-- 
2.14.1

