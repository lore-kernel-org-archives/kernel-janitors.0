From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 13:35:10 +0000
Subject: [PATCH 06/11] ocfs2: Two checks less in ocfs2_local_alloc_slide_window()
Message-Id: <5599328E.5010905@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <55992DF0.5030205@users.sourceforge.net>
In-Reply-To: <55992DF0.5030205@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Jul 2015 18:18:23 +0200

* Return directly from the ocfs2_local_alloc_slide_window() function
  if a call of the ocfs2_local_alloc_reserve_for_window() function failed
  at the beginning.

* Rename jump labels according to the Linux coding style convention.

* Drop an unnecessary initialisation for the variable "handle" then.

* Delete a call of the mlog_errno() function at the end.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/localalloc.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/fs/ocfs2/localalloc.c b/fs/ocfs2/localalloc.c
index a614037..16579ed 100644
--- a/fs/ocfs2/localalloc.c
+++ b/fs/ocfs2/localalloc.c
@@ -1248,7 +1248,7 @@ static int ocfs2_local_alloc_slide_window(struct ocfs2_super *osb,
 	int status = 0;
 	struct buffer_head *main_bm_bh = NULL;
 	struct inode *main_bm_inode = NULL;
-	handle_t *handle = NULL;
+	handle_t *handle;
 	struct ocfs2_dinode *alloc;
 	struct ocfs2_dinode *alloc_copy = NULL;
 	struct ocfs2_alloc_context *ac = NULL;
@@ -1263,15 +1263,14 @@ static int ocfs2_local_alloc_slide_window(struct ocfs2_super *osb,
 	if (status < 0) {
 		if (status != -ENOSPC)
 			mlog_errno(status);
-		goto bail;
+		return status;
 	}
 
 	handle = ocfs2_start_trans(osb, OCFS2_WINDOW_MOVE_CREDITS);
 	if (IS_ERR(handle)) {
 		status = PTR_ERR(handle);
-		handle = NULL;
 		mlog_errno(status);
-		goto bail;
+		goto clean_up_main;
 	}
 
 	alloc = (struct ocfs2_dinode *) osb->local_alloc_bh->b_data;
@@ -1285,7 +1284,7 @@ static int ocfs2_local_alloc_slide_window(struct ocfs2_super *osb,
 	if (!alloc_copy) {
 		status = -ENOMEM;
 		mlog_errno(status);
-		goto bail;
+		goto commit;
 	}
 	memcpy(alloc_copy, alloc, osb->local_alloc_bh->b_size);
 
@@ -1295,7 +1294,7 @@ static int ocfs2_local_alloc_slide_window(struct ocfs2_super *osb,
 					 OCFS2_JOURNAL_ACCESS_WRITE);
 	if (status < 0) {
 		mlog_errno(status);
-		goto bail;
+		goto commit;
 	}
 
 	ocfs2_clear_local_alloc(alloc);
@@ -1305,31 +1304,27 @@ static int ocfs2_local_alloc_slide_window(struct ocfs2_super *osb,
 					  main_bm_inode, main_bm_bh);
 	if (status < 0) {
 		mlog_errno(status);
-		goto bail;
+		goto commit;
 	}
 
 	status = ocfs2_local_alloc_new_window(osb, handle, ac);
 	if (status < 0) {
 		if (status != -ENOSPC)
 			mlog_errno(status);
-		goto bail;
+		goto commit;
 	}
 
 	atomic_inc(&osb->alloc_stats.moves);
 
-bail:
-	if (handle)
-		ocfs2_commit_trans(osb, handle);
-
+commit:
+	ocfs2_commit_trans(osb, handle);
+clean_up_main:
 	brelse(main_bm_bh);
 	iput(main_bm_inode);
 	kfree(alloc_copy);
 
 	if (ac)
 		ocfs2_free_alloc_context(ac);
-
-	if (status)
-		mlog_errno(status);
 	return status;
 }
 
-- 
2.4.5

