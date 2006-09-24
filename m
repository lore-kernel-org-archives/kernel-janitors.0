From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 24 Sep 2006 22:46:44 +0000
Subject: [KJ] [Patch] BUG_ON conversion for fs/reiserfs
Message-Id: <1159138005.9062.1.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

this patch converts several if () BUG(); construct to BUG_ON();
which occupies less space, uses unlikely and is safer when
BUG() is disabled. S_ISREG() has no side effects, so the
conversion is safe.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.18-git3/fs/reiserfs/file.c.orig	2006-09-24 23:09:51.000000000 +0200
+++ linux-2.6.18-git3/fs/reiserfs/file.c	2006-09-24 23:10:10.000000000 +0200
@@ -37,8 +37,7 @@ static int reiserfs_file_release(struct 
 	int err;
 	int jbegin_failure = 0;
 
-	if (!S_ISREG(inode->i_mode))
-		BUG();
+	BUG_ON(!S_ISREG(inode->i_mode));
 
 	/* fast out for when nothing needs to be done */
 	if ((atomic_read(&inode->i_count) > 1 ||
@@ -124,8 +123,7 @@ static int reiserfs_sync_file(struct fil
 	int n_err;
 	int barrier_done;
 
-	if (!S_ISREG(p_s_inode->i_mode))
-		BUG();
+	BUG_ON(!S_ISREG(p_s_inode->i_mode));
 	n_err = sync_mapping_buffers(p_s_inode->i_mapping);
 	reiserfs_write_lock(p_s_inode->i_sb);
 	barrier_done = reiserfs_commit_for_inode(p_s_inode);
--- linux-2.6.18-git3/fs/reiserfs/item_ops.c.orig	2006-09-24 23:10:21.000000000 +0200
+++ linux-2.6.18-git3/fs/reiserfs/item_ops.c	2006-09-24 23:10:47.000000000 +0200
@@ -75,8 +75,7 @@ static int sd_create_vi(struct virtual_n
 static int sd_check_left(struct virtual_item *vi, int free,
 			 int start_skip, int end_skip)
 {
-	if (start_skip || end_skip)
-		BUG();
+	BUG_ON(start_skip || end_skip);
 	return -1;
 }
 
@@ -87,8 +86,7 @@ static int sd_check_right(struct virtual
 
 static int sd_part_size(struct virtual_item *vi, int first, int count)
 {
-	if (count)
-		BUG();
+	BUG_ON(count);
 	return 0;
 }
 
@@ -476,8 +474,7 @@ static int direntry_create_vi(struct vir
 
 	vi->vi_index = TYPE_DIRENTRY;
 
-	if (!(vi->vi_ih) || !vi->vi_item)
-		BUG();
+	BUG_ON(!(vi->vi_ih) || !vi->vi_item);
 
 	dir_u->flags = 0;
 	if (le_ih_k_offset(vi->vi_ih) = DOT_OFFSET)
@@ -575,8 +572,7 @@ static int direntry_check_right(struct v
 		free -= dir_u->entry_sizes[i];
 		entries++;
 	}
-	if (entries = dir_u->entry_count)
-		BUG();
+	BUG_ON(entries = dir_u->entry_count);
 
 	/* "." and ".." can not be separated from each other */
 	if ((dir_u->flags & DIRENTRY_VI_FIRST_DIRENTRY_ITEM)
--- linux-2.6.18-git3/fs/reiserfs/journal.c.orig	2006-09-24 23:10:57.000000000 +0200
+++ linux-2.6.18-git3/fs/reiserfs/journal.c	2006-09-24 23:14:08.000000000 +0200
@@ -718,8 +718,7 @@ static int add_to_chunk(struct buffer_ch
 			spinlock_t * lock, void (fn) (struct buffer_chunk *))
 {
 	int ret = 0;
-	if (chunk->nr >= CHUNK_SIZE)
-		BUG();
+	BUG_ON(chunk->nr >= CHUNK_SIZE);
 	chunk->bh[chunk->nr++] = bh;
 	if (chunk->nr >= CHUNK_SIZE) {
 		ret = 1;
@@ -788,8 +787,7 @@ static inline int __add_jh(struct reiser
 		/* buffer must be locked for __add_jh, should be able to have
 		 * two adds at the same time
 		 */
-		if (bh->b_private)
-			BUG();
+		BUG_ON(bh->b_private);
 		jh->bh = bh;
 		bh->b_private = jh;
 	}
@@ -2927,8 +2925,7 @@ static int do_journal_begin_r(struct rei
 	int retval;
 
 	reiserfs_check_lock_depth(p_s_sb, "journal_begin");
-	if (nblocks > journal->j_trans_max)
-		BUG();
+	BUG_ON(nblocks > journal->j_trans_max);
 
 	PROC_INFO_INC(p_s_sb, journal.journal_being);
 	/* set here for journal_join */
@@ -3044,9 +3041,8 @@ struct reiserfs_transaction_handle *reis
 	if (reiserfs_transaction_running(s)) {
 		th = current->journal_info;
 		th->t_refcount++;
-		if (th->t_refcount < 2) {
-			BUG();
-		}
+		BUG_ON(th->t_refcount < 2);
+		
 		return th;
 	}
 	th = kmalloc(sizeof(struct reiserfs_transaction_handle), GFP_NOFS);
@@ -3086,9 +3082,7 @@ static int journal_join(struct reiserfs_
 	 ** pointer
 	 */
 	th->t_handle_save = cur_th;
-	if (cur_th && cur_th->t_refcount > 1) {
-		BUG();
-	}
+	BUG_ON(cur_th && cur_th->t_refcount > 1);
 	return do_journal_begin_r(th, p_s_sb, nblocks, JBEGIN_JOIN);
 }
 
@@ -3101,9 +3095,7 @@ int journal_join_abort(struct reiserfs_t
 	 ** pointer
 	 */
 	th->t_handle_save = cur_th;
-	if (cur_th && cur_th->t_refcount > 1) {
-		BUG();
-	}
+	BUG_ON(cur_th && cur_th->t_refcount > 1);
 	return do_journal_begin_r(th, p_s_sb, nblocks, JBEGIN_ABORT);
 }
 
@@ -3138,8 +3130,7 @@ int journal_begin(struct reiserfs_transa
 		current->journal_info = th;
 	}
 	ret = do_journal_begin_r(th, p_s_sb, nblocks, JBEGIN_REG);
-	if (current->journal_info != th)
-		BUG();
+	BUG_ON(current->journal_info != th);
 
 	/* I guess this boils down to being the reciprocal of clm-2100 above.
 	 * If do_journal_begin_r fails, we need to put it back, since journal_end
@@ -3284,8 +3275,7 @@ int journal_end(struct reiserfs_transact
 		/* we aren't allowed to close a nested transaction on a different
 		 ** filesystem from the one in the task struct
 		 */
-		if (cur_th->t_super != th->t_super)
-			BUG();
+		BUG_ON(cur_th->t_super != th->t_super);
 
 		if (th != cur_th) {
 			memcpy(current->journal_info, th, sizeof(*th));
@@ -3404,9 +3394,7 @@ int journal_end_sync(struct reiserfs_tra
 
 	BUG_ON(!th->t_trans_id);
 	/* you can sync while nested, very, very bad */
-	if (th->t_refcount > 1) {
-		BUG();
-	}
+	BUG_ON(th->t_refcount > 1);
 	if (journal->j_len = 0) {
 		reiserfs_prepare_for_journal(p_s_sb, SB_BUFFER_WITH_SB(p_s_sb),
 					     1);
@@ -3526,9 +3514,8 @@ static int check_journal_end(struct reis
 	 ** will be dealt with by next transaction that actually writes something, but should be taken
 	 ** care of in this trans
 	 */
-	if (journal->j_len = 0) {
-		BUG();
-	}
+	BUG_ON(journal->j_len = 0);
+
 	/* if wcount > 0, and we are called to with flush or commit_now,
 	 ** we wait on j_join_wait.  We will wake up when the last writer has
 	 ** finished the transaction, and started it on its way to the disk.
@@ -3562,9 +3549,8 @@ static int check_journal_end(struct reis
 					unlock_journal(p_s_sb);
 				}
 			}
-			if (journal->j_trans_id = trans_id) {
-				BUG();
-			}
+			BUG_ON(journal->j_trans_id = trans_id);
+			
 			if (commit_now
 			    && journal_list_still_alive(p_s_sb, trans_id)
 			    && wait_on_commit) {
@@ -4042,9 +4028,7 @@ static int do_journal_end(struct reiserf
 	set_commit_trans_len(commit, journal->j_len);
 
 	/* special check in case all buffers in the journal were marked for not logging */
-	if (journal->j_len = 0) {
-		BUG();
-	}
+	BUG_ON(journal->j_len = 0);
 
 	/* we're about to dirty all the log blocks, mark the description block
 	 * dirty now too.  Don't mark the commit block dirty until all the
@@ -4141,8 +4125,7 @@ static int do_journal_end(struct reiserf
 				      journal, jl, &jl->j_tail_bh_list);
 		lock_kernel();
 	}
-	if (!list_empty(&jl->j_tail_bh_list))
-		BUG();
+	BUG_ON(!list_empty(&jl->j_tail_bh_list));
 	up(&jl->j_commit_lock);
 
 	/* honor the flush wishes from the caller, simple commits can
--- linux-2.6.18-git3/fs/reiserfs/namei.c.orig	2006-09-24 23:14:17.000000000 +0200
+++ linux-2.6.18-git3/fs/reiserfs/namei.c	2006-09-24 23:15:20.000000000 +0200
@@ -67,8 +67,7 @@ inline void set_de_name_and_namelen(stru
 {
 	struct reiserfs_de_head *deh = de->de_deh + de->de_entry_num;
 
-	if (de->de_entry_num >= ih_entry_count(de->de_ih))
-		BUG();
+	BUG_ON(de->de_entry_num >= ih_entry_count(de->de_ih));
 
 	de->de_entrylen = entry_length(de->de_bh, de->de_ih, de->de_entry_num);
 	de->de_namelen = de->de_entrylen - (de_with_sd(deh) ? SD_SIZE : 0);
@@ -80,8 +79,7 @@ inline void set_de_name_and_namelen(stru
 // what entry points to
 static inline void set_de_object_key(struct reiserfs_dir_entry *de)
 {
-	if (de->de_entry_num >= ih_entry_count(de->de_ih))
-		BUG();
+	BUG_ON(de->de_entry_num >= ih_entry_count(de->de_ih));
 	de->de_dir_id = deh_dir_id(&(de->de_deh[de->de_entry_num]));
 	de->de_objectid = deh_objectid(&(de->de_deh[de->de_entry_num]));
 }
@@ -90,8 +88,7 @@ static inline void store_de_entry_key(st
 {
 	struct reiserfs_de_head *deh = de->de_deh + de->de_entry_num;
 
-	if (de->de_entry_num >= ih_entry_count(de->de_ih))
-		BUG();
+	BUG_ON(de->de_entry_num >= ih_entry_count(de->de_ih));
 
 	/* store key of the found entry */
 	de->de_entry_key.version = KEY_FORMAT_3_5;
--- linux-2.6.18-git3/fs/reiserfs/stree.c.orig	2006-09-24 23:15:29.000000000 +0200
+++ linux-2.6.18-git3/fs/reiserfs/stree.c	2006-09-24 23:15:38.000000000 +0200
@@ -1476,9 +1476,7 @@ static int maybe_indirect_to_direct(stru
 	int n_block_size = p_s_sb->s_blocksize;
 	int cut_bytes;
 	BUG_ON(!th->t_trans_id);
-
-	if (n_new_file_size != p_s_inode->i_size)
-		BUG();
+	BUG_ON(n_new_file_size != p_s_inode->i_size);
 
 	/* the page being sent in could be NULL if there was an i/o error
 	 ** reading in the last block.  The user will hit problems trying to


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
