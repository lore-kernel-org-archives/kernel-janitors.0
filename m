From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 13:32:21 +0000
Subject: [PATCH 04/11] ocfs2: One check less in ocfs2_statfs()
Message-Id: <559931E5.1020704@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <55992DF0.5030205@users.sourceforge.net>
In-Reply-To: <55992DF0.5030205@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Jul 2015 16:28:50 +0200

Delete a check for the variable "status" by adjustment of two jump targets
according to the Linux coding style convention.
Separate the exception handling statements from the ordinary execution path.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/super.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
index 37e418f..ed16f08 100644
--- a/fs/ocfs2/super.c
+++ b/fs/ocfs2/super.c
@@ -1692,14 +1692,12 @@ static int ocfs2_statfs(struct dentry *dentry, struct kstatfs *buf)
 	if (!inode) {
 		mlog(ML_ERROR, "failed to get bitmap inode\n");
 		status = -EIO;
-		goto bail;
+		goto log_error;
 	}
 
 	status = ocfs2_inode_lock(inode, &bh, 0);
-	if (status < 0) {
-		mlog_errno(status);
-		goto bail;
-	}
+	if (status < 0)
+		goto put_inode;
 
 	bm_lock = (struct ocfs2_dinode *) bh->b_data;
 
@@ -1724,13 +1722,12 @@ static int ocfs2_statfs(struct dentry *dentry, struct kstatfs *buf)
 	brelse(bh);
 
 	ocfs2_inode_unlock(inode, 0);
-	status = 0;
-bail:
 	iput(inode);
-
-	if (status)
-		mlog_errno(status);
-
+	return 0;
+put_inode:
+	iput(inode);
+log_error:
+	mlog_errno(status);
 	return status;
 }
 
-- 
2.4.5

