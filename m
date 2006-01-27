From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:32:52 +0000
Subject: [KJ] [Patch 7/12] BUG_ON() Conversion in fs/ocfs2/
Message-Id: <1138354372.7391.56.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35132880257875998=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35132880257875998==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/ocfs2/extent_map.c.orig	2006-01-27 01:44:03.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/ocfs2/extent_map.c	2006-01-27 01:44:55.000000000 +0100
@@ -262,8 +262,7 @@ static int ocfs2_extent_map_find_leaf(st
 		el = &eb->h_list;
 	}
 
-	if (el->l_tree_depth)
-		BUG();
+	BUG_ON(el->l_tree_depth);
 
 	for (i = 0; i < le16_to_cpu(el->l_next_free_rec); i++) {
 		rec = &el->l_recs[i];
@@ -364,8 +363,8 @@ static int ocfs2_extent_map_lookup_read(
 		return ret;
 	}
 
-	if (ent->e_tree_depth)
-		BUG();  /* FIXME: Make sure this isn't a corruption */
+	/* FIXME: Make sure this isn't a corruption */
+	BUG_ON(ent->e_tree_depth);
 
 	*ret_ent = ent;
 
@@ -423,8 +422,7 @@ static int ocfs2_extent_map_try_insert(s
 					  le32_to_cpu(rec->e_clusters), NULL,
 					  NULL);
 
-	if (!old_ent)
-		BUG();
+	BUG_ON(!old_ent);
 
 	ret = -EEXIST;
 	if (old_ent->e_tree_depth < tree_depth)
--- linux-2.6.16-rc1-git4/fs/ocfs2/journal.c.orig	2006-01-27 01:45:45.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/ocfs2/journal.c	2006-01-27 01:46:37.000000000 +0100
@@ -147,8 +147,7 @@ struct ocfs2_journal_handle *ocfs2_start
 
 	mlog_entry("(max_buffs = %d)\n", max_buffs);
 
-	if (!osb || !osb->journal->j_journal)
-		BUG();
+	BUG_ON(!osb || !osb->journal->j_journal);
 
 	if (ocfs2_is_hard_readonly(osb)) {
 		ret = -EROFS;
@@ -672,8 +671,7 @@ void ocfs2_journal_shutdown(struct ocfs2
 
 	mlog_entry_void();
 
-	if (!osb)
-		BUG();
+	BUG_ON(!osb);
 
 	journal = osb->journal;
 	if (!journal)
@@ -805,8 +803,7 @@ int ocfs2_journal_wipe(struct ocfs2_jour
 
 	mlog_entry_void();
 
-	if (!journal)
-		BUG();
+	BUG_ON(!journal);
 
 	status = journal_wipe(journal->j_journal, full);
 	if (status < 0) {
@@ -1271,8 +1268,7 @@ static int ocfs2_recover_node(struct ocf
 
 	/* Should not ever be called to recover ourselves -- in that
 	 * case we should've called ocfs2_journal_load instead. */
-	if (osb->node_num == node_num)
-		BUG();
+	BUG_ON(osb->node_num == node_num);
 
 	slot_num = ocfs2_node_num_to_slot(si, node_num);
 	if (slot_num == OCFS2_INVALID_SLOT) {
--- linux-2.6.16-rc1-git4/fs/ocfs2/super.c.orig	2006-01-27 01:47:17.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/ocfs2/super.c	2006-01-27 01:47:28.000000000 +0100
@@ -1254,8 +1254,7 @@ static int ocfs2_initialize_super(struct
 	osb->sb = sb;
 	/* Save off for ocfs2_rw_direct */
 	osb->s_sectsize_bits = blksize_bits(sector_size);
-	if (!osb->s_sectsize_bits)
-		BUG();
+	BUG_ON(!osb->s_sectsize_bits);
 
 	osb->net_response_ids = 0;
 	spin_lock_init(&osb->net_response_lock);
--- linux-2.6.16-rc1-git4/fs/ocfs2/sysfile.c.orig	2006-01-27 01:47:50.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/ocfs2/sysfile.c	2006-01-27 01:48:13.000000000 +0100
@@ -77,8 +77,7 @@ struct inode *ocfs2_get_system_file_inod
 	if (arr && ((inode = *arr) != NULL)) {
 		/* get a ref in addition to the array ref */
 		inode = igrab(inode);
-		if (!inode)
-			BUG();
+		BUG_ON(!inode);
 
 		return inode;
 	}
@@ -89,8 +88,7 @@ struct inode *ocfs2_get_system_file_inod
 	/* add one more if putting into array for first time */
 	if (arr && inode) {
 		*arr = igrab(inode);
-		if (!*arr)
-			BUG();
+		BUG_ON(!*arr);
 	}
 	return inode;
 }



--===============35132880257875998==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35132880257875998==--
