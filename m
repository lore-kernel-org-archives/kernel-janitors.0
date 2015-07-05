From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 13:30:24 +0000
Subject: [PATCH 03/11] ocfs2: Less checks in ocfs2_rename() after error detection
Message-Id: <55993170.6060306@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <55992DF0.5030205@users.sourceforge.net>
In-Reply-To: <55992DF0.5030205@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Jul 2015 15:30:18 +0200

Skip checks for a few variables in three error handling cases within
the ocfs2_rename() function by adjustment of a few jump targets
according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/namei.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/ocfs2/namei.c b/fs/ocfs2/namei.c
index a04d70b..04a61cb 100644
--- a/fs/ocfs2/namei.c
+++ b/fs/ocfs2/namei.c
@@ -1255,7 +1255,7 @@ static int ocfs2_rename(struct inode *old_dir,
 		status = ocfs2_rename_lock(osb);
 		if (status < 0) {
 			mlog_errno(status);
-			goto bail;
+			goto basic_clean_up;
 		}
 		rename_lock = 1;
 
@@ -1265,13 +1265,13 @@ static int ocfs2_rename(struct inode *old_dir,
 				old_inode->i_ino);
 		if (status < 0) {
 			mlog_errno(status);
-			goto bail;
+			goto rename_unlock;
 		} else if (status = 1) {
 			status = -EPERM;
 			trace_ocfs2_rename_not_permitted(
 					(unsigned long long)old_inode->i_ino,
 					(unsigned long long)new_dir->i_ino);
-			goto bail;
+			goto rename_unlock;
 		}
 	}
 
@@ -1630,9 +1630,10 @@ static int ocfs2_rename(struct inode *old_dir,
 	ocfs2_dentry_move(old_dentry, new_dentry, old_dir, new_dir);
 	status = 0;
 bail:
-	if (rename_lock)
+	if (rename_lock) {
+rename_unlock:
 		ocfs2_rename_unlock(osb);
-
+	}
 	if (handle)
 		ocfs2_commit_trans(osb, handle);
 
@@ -1651,7 +1652,7 @@ bail:
 		mutex_unlock(&orphan_dir->i_mutex);
 		iput(orphan_dir);
 	}
-
+basic_clean_up:
 	if (new_inode)
 		sync_mapping_buffers(old_inode->i_mapping);
 
-- 
2.4.5

