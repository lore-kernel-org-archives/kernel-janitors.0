From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 13:33:55 +0000
Subject: [PATCH 05/11] ocfs2: Less error log repetition in ocfs2_begin_truncate_log_recovery()
Message-Id: <55993243.8080006@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <55992DF0.5030205@users.sourceforge.net>
In-Reply-To: <55992DF0.5030205@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Jul 2015 17:23:08 +0200

Delete three direct calls of the mlog_errno() function
within ocfs2_begin_truncate_log_recovery().
A single logging call can be sufficient.

Drop initialisation for the variables "tl_inode" and "tl_bh" then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/alloc.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
index f36dcaa..59e639e 100644
--- a/fs/ocfs2/alloc.c
+++ b/fs/ocfs2/alloc.c
@@ -6147,8 +6147,8 @@ int ocfs2_begin_truncate_log_recovery(struct ocfs2_super *osb,
 				      struct ocfs2_dinode **tl_copy)
 {
 	int status;
-	struct inode *tl_inode = NULL;
-	struct buffer_head *tl_bh = NULL;
+	struct inode *tl_inode;
+	struct buffer_head *tl_bh;
 	struct ocfs2_dinode *di;
 	struct ocfs2_truncate_log *tl;
 
@@ -6157,10 +6157,8 @@ int ocfs2_begin_truncate_log_recovery(struct ocfs2_super *osb,
 	trace_ocfs2_begin_truncate_log_recovery(slot_num);
 
 	status = ocfs2_get_truncate_log_info(osb, slot_num, &tl_inode, &tl_bh);
-	if (status < 0) {
-		mlog_errno(status);
-		goto bail;
-	}
+	if (status < 0)
+		goto log_error;
 
 	di = (struct ocfs2_dinode *) tl_bh->b_data;
 
@@ -6176,7 +6174,6 @@ int ocfs2_begin_truncate_log_recovery(struct ocfs2_super *osb,
 		*tl_copy = kmalloc(tl_bh->b_size, GFP_KERNEL);
 		if (!(*tl_copy)) {
 			status = -ENOMEM;
-			mlog_errno(status);
 			goto bail;
 		}
 
@@ -6191,7 +6188,6 @@ int ocfs2_begin_truncate_log_recovery(struct ocfs2_super *osb,
 		ocfs2_compute_meta_ecc(osb->sb, tl_bh->b_data, &di->i_check);
 		status = ocfs2_write_block(osb, tl_bh, INODE_CACHE(tl_inode));
 		if (status < 0) {
-			mlog_errno(status);
 			goto bail;
 		}
 	}
@@ -6200,9 +6196,12 @@ bail:
 	iput(tl_inode);
 	brelse(tl_bh);
 
-	if (status < 0 && (*tl_copy)) {
-		kfree(*tl_copy);
-		*tl_copy = NULL;
+	if (status < 0) {
+		if (*tl_copy) {
+			kfree(*tl_copy);
+			*tl_copy = NULL;
+		}
+log_error:
 		mlog_errno(status);
 	}
 
-- 
2.4.5

