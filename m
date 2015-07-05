From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 13:37:16 +0000
Subject: [PATCH 08/11] ocfs2: Less checks in ocfs2_load_local_alloc()
Message-Id: <5599330C.7020407@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <55992DF0.5030205@users.sourceforge.net>
In-Reply-To: <55992DF0.5030205@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Jul 2015 22:06:32 +0200

* Skip checks for the variable "status" in a few cases within
  the ocfs2_load_local_alloc() function by adjustment of two jump targets
  according to the Linux coding style convention.

* Drop unnecessary initialisations for the variables "alloc"
  and "inode" then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/localalloc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/ocfs2/localalloc.c b/fs/ocfs2/localalloc.c
index e6d5074..08f812b 100644
--- a/fs/ocfs2/localalloc.c
+++ b/fs/ocfs2/localalloc.c
@@ -284,14 +284,14 @@ bail:
 int ocfs2_load_local_alloc(struct ocfs2_super *osb)
 {
 	int status = 0;
-	struct ocfs2_dinode *alloc = NULL;
+	struct ocfs2_dinode *alloc;
 	struct buffer_head *alloc_bh = NULL;
 	u32 num_used;
-	struct inode *inode = NULL;
+	struct inode *inode;
 	struct ocfs2_local_alloc *la;
 
-	if (osb->local_alloc_bits = 0)
-		goto bail;
+	if (osb->local_alloc_bits)
+		goto trace_bits;
 
 	if (osb->local_alloc_bits >= osb->bitmap_cpg) {
 		mlog(ML_NOTICE, "Requested local alloc window %d is larger "
@@ -308,14 +308,14 @@ int ocfs2_load_local_alloc(struct ocfs2_super *osb)
 	if (!inode) {
 		status = -EINVAL;
 		mlog_errno(status);
-		goto bail;
+		goto trace_bits;
 	}
 
 	status = ocfs2_read_inode_block_full(inode, &alloc_bh,
 					     OCFS2_BH_IGNORE_CACHE);
 	if (status < 0) {
 		mlog_errno(status);
-		goto bail;
+		goto put_inode;
 	}
 
 	alloc = (struct ocfs2_dinode *) alloc_bh->b_data;
@@ -326,6 +326,7 @@ int ocfs2_load_local_alloc(struct ocfs2_super *osb)
 		mlog(ML_ERROR, "Invalid local alloc inode, %llu\n",
 		     (unsigned long long)OCFS2_I(inode)->ip_blkno);
 		status = -EINVAL;
+		mlog_errno(status);
 		goto bail;
 	}
 
@@ -334,6 +335,7 @@ int ocfs2_load_local_alloc(struct ocfs2_super *osb)
 		mlog(ML_ERROR, "Local alloc size is invalid (la_size = %u)\n",
 		     le16_to_cpu(la->la_size));
 		status = -EINVAL;
+		mlog_errno(status);
 		goto bail;
 	}
 
@@ -358,11 +360,10 @@ int ocfs2_load_local_alloc(struct ocfs2_super *osb)
 bail:
 	if (status < 0)
 		brelse(alloc_bh);
+put_inode:
 	iput(inode);
+trace_bits:
 	trace_ocfs2_load_local_alloc(osb->local_alloc_bits);
-
-	if (status)
-		mlog_errno(status);
 	return status;
 }
 
-- 
2.4.5

