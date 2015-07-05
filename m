From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 13:36:19 +0000
Subject: [PATCH 07/11] ocfs2: Less function calls in ocfs2_shutdown_local_alloc() after error detection
Message-Id: <559932D3.30403@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <55992DF0.5030205@users.sourceforge.net>
In-Reply-To: <55992DF0.5030205@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Jul 2015 21:02:05 +0200

The functions kfree() and iput() were called in a few cases by the
ocfs2_shutdown_local_alloc() function during error handling even
if the passed variables contained still a null pointer.

* Return directly if the local allocation feature is unused or if a call
  for the ocfs2_get_system_file_inode() function failed.

* Adjust jump targets.

* Drop unnecessary initialisations for the variables "alloc", "alloc_copy",
  "bh", "local_alloc_inode" and "main_bm_inode" then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/localalloc.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/fs/ocfs2/localalloc.c b/fs/ocfs2/localalloc.c
index 16579ed..e6d5074 100644
--- a/fs/ocfs2/localalloc.c
+++ b/fs/ocfs2/localalloc.c
@@ -377,18 +377,18 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super *osb)
 {
 	int status;
 	handle_t *handle;
-	struct inode *local_alloc_inode = NULL;
-	struct buffer_head *bh = NULL;
+	struct inode *local_alloc_inode;
+	struct buffer_head *bh;
 	struct buffer_head *main_bm_bh = NULL;
-	struct inode *main_bm_inode = NULL;
-	struct ocfs2_dinode *alloc_copy = NULL;
-	struct ocfs2_dinode *alloc = NULL;
+	struct inode *main_bm_inode;
+	struct ocfs2_dinode *alloc_copy;
+	struct ocfs2_dinode *alloc;
 
 	cancel_delayed_work(&osb->la_enable_wq);
 	flush_workqueue(ocfs2_wq);
 
 	if (osb->local_alloc_state = OCFS2_LA_UNUSED)
-		goto out;
+		return;
 
 	local_alloc_inode  		ocfs2_get_system_file_inode(osb,
@@ -397,7 +397,7 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super *osb)
 	if (!local_alloc_inode) {
 		status = -ENOENT;
 		mlog_errno(status);
-		goto out;
+		return;
 	}
 
 	osb->local_alloc_state = OCFS2_LA_DISABLED;
@@ -410,7 +410,7 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super *osb)
 	if (!main_bm_inode) {
 		status = -EINVAL;
 		mlog_errno(status);
-		goto out;
+		goto put_local_alloc_inode;
 	}
 
 	mutex_lock(&main_bm_inode->i_mutex);
@@ -443,7 +443,7 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super *osb)
 					 bh, OCFS2_JOURNAL_ACCESS_WRITE);
 	if (status < 0) {
 		mlog_errno(status);
-		goto out_commit;
+		goto free_copy;
 	}
 
 	ocfs2_clear_local_alloc(alloc);
@@ -458,21 +458,18 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super *osb)
 	if (status < 0)
 		mlog_errno(status);
 
+free_copy:
+	kfree(alloc_copy);
 out_commit:
 	ocfs2_commit_trans(osb, handle);
-
 out_unlock:
 	brelse(main_bm_bh);
-
 	ocfs2_inode_unlock(main_bm_inode, 1);
-
 out_mutex:
 	mutex_unlock(&main_bm_inode->i_mutex);
 	iput(main_bm_inode);
-
-out:
+put_local_alloc_inode:
 	iput(local_alloc_inode);
-	kfree(alloc_copy);
 }
 
 /*
-- 
2.4.5

