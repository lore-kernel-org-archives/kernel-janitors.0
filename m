From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 13:28:10 +0000
Subject: [PATCH 02/11] ocfs2: Delete unnecessary checks before the function call "iput"
Message-Id: <559930EA.3010906@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <55992DF0.5030205@users.sourceforge.net>
In-Reply-To: <55992DF0.5030205@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Jul 2015 13:40:07 +0200

The iput() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/alloc.c      |  3 +--
 fs/ocfs2/ioctl.c      |  4 +---
 fs/ocfs2/journal.c    | 11 +++--------
 fs/ocfs2/localalloc.c | 13 +++----------
 fs/ocfs2/namei.c      |  4 +---
 fs/ocfs2/slot_map.c   |  3 +--
 fs/ocfs2/super.c      |  3 +--
 7 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
index 0afb4cb..f36dcaa 100644
--- a/fs/ocfs2/alloc.c
+++ b/fs/ocfs2/alloc.c
@@ -6197,8 +6197,7 @@ int ocfs2_begin_truncate_log_recovery(struct ocfs2_super *osb,
 	}
 
 bail:
-	if (tl_inode)
-		iput(tl_inode);
+	iput(tl_inode);
 	brelse(tl_bh);
 
 	if (status < 0 && (*tl_copy)) {
diff --git a/fs/ocfs2/ioctl.c b/fs/ocfs2/ioctl.c
index 53e6c40..a7dae26 100644
--- a/fs/ocfs2/ioctl.c
+++ b/fs/ocfs2/ioctl.c
@@ -606,9 +606,7 @@ bail:
 	if (gb_inode)
 		mutex_unlock(&gb_inode->i_mutex);
 
-	if (gb_inode)
-		iput(gb_inode);
-
+	iput(gb_inode);
 	brelse(bh);
 
 	return status;
diff --git a/fs/ocfs2/journal.c b/fs/ocfs2/journal.c
index 8f853ea..c644997 100644
--- a/fs/ocfs2/journal.c
+++ b/fs/ocfs2/journal.c
@@ -1026,8 +1026,7 @@ void ocfs2_journal_shutdown(struct ocfs2_super *osb)
 
 //	up_write(&journal->j_trans_barrier);
 done:
-	if (inode)
-		iput(inode);
+	iput(inode);
 }
 
 static void ocfs2_clear_journal_error(struct super_block *sb,
@@ -1671,9 +1670,7 @@ done:
 	if (got_lock)
 		ocfs2_inode_unlock(inode, 1);
 
-	if (inode)
-		iput(inode);
-
+	iput(inode);
 	brelse(bh);
 
 	return status;
@@ -1780,9 +1777,7 @@ static int ocfs2_trylock_journal(struct ocfs2_super *osb,
 
 	ocfs2_inode_unlock(inode, 1);
 bail:
-	if (inode)
-		iput(inode);
-
+	iput(inode);
 	return status;
 }
 
diff --git a/fs/ocfs2/localalloc.c b/fs/ocfs2/localalloc.c
index 0a4457f..a614037 100644
--- a/fs/ocfs2/localalloc.c
+++ b/fs/ocfs2/localalloc.c
@@ -358,9 +358,7 @@ int ocfs2_load_local_alloc(struct ocfs2_super *osb)
 bail:
 	if (status < 0)
 		brelse(alloc_bh);
-	if (inode)
-		iput(inode);
-
+	iput(inode);
 	trace_ocfs2_load_local_alloc(osb->local_alloc_bits);
 
 	if (status)
@@ -473,9 +471,7 @@ out_mutex:
 	iput(main_bm_inode);
 
 out:
-	if (local_alloc_inode)
-		iput(local_alloc_inode);
-
+	iput(local_alloc_inode);
 	kfree(alloc_copy);
 }
 
@@ -1326,10 +1322,7 @@ bail:
 		ocfs2_commit_trans(osb, handle);
 
 	brelse(main_bm_bh);
-
-	if (main_bm_inode)
-		iput(main_bm_inode);
-
+	iput(main_bm_inode);
 	kfree(alloc_copy);
 
 	if (ac)
diff --git a/fs/ocfs2/namei.c b/fs/ocfs2/namei.c
index af9c4c8..a04d70b 100644
--- a/fs/ocfs2/namei.c
+++ b/fs/ocfs2/namei.c
@@ -1655,9 +1655,7 @@ bail:
 	if (new_inode)
 		sync_mapping_buffers(old_inode->i_mapping);
 
-	if (new_inode)
-		iput(new_inode);
-
+	iput(new_inode);
 	ocfs2_free_dir_lookup_result(&target_lookup_res);
 	ocfs2_free_dir_lookup_result(&old_entry_lookup);
 	ocfs2_free_dir_lookup_result(&old_inode_dot_dot_res);
diff --git a/fs/ocfs2/slot_map.c b/fs/ocfs2/slot_map.c
index e78a203..47bba1b 100644
--- a/fs/ocfs2/slot_map.c
+++ b/fs/ocfs2/slot_map.c
@@ -322,8 +322,7 @@ static void __ocfs2_free_slot_info(struct ocfs2_slot_info *si)
 	if (si = NULL)
 		return;
 
-	if (si->si_inode)
-		iput(si->si_inode);
+	iput(si->si_inode);
 	if (si->si_bh) {
 		for (i = 0; i < si->si_blocks; i++) {
 			if (si->si_bh[i]) {
diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
index 2fc02f7..37e418f 100644
--- a/fs/ocfs2/super.c
+++ b/fs/ocfs2/super.c
@@ -1726,8 +1726,7 @@ static int ocfs2_statfs(struct dentry *dentry, struct kstatfs *buf)
 	ocfs2_inode_unlock(inode, 0);
 	status = 0;
 bail:
-	if (inode)
-		iput(inode);
+	iput(inode);
 
 	if (status)
 		mlog_errno(status);
-- 
2.4.5

