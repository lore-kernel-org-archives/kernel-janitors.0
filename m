From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 13:38:39 +0000
Subject: [PATCH 09/11] ocfs2: One function call less in ocfs2_trylock_journal() after error detection
Message-Id: <5599335F.6020309@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <55992DF0.5030205@users.sourceforge.net>
In-Reply-To: <55992DF0.5030205@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Jul 2015 22:34:43 +0200

The iput() function was called in one case by the
ocfs2_trylock_journal() function during error handling even
if the passed variable "inode" contained still a null pointer.

* Return directly if a call of the ocfs2_get_system_file_inode() function
  failed at the beginning.

* Rename a jump label according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/journal.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/fs/ocfs2/journal.c b/fs/ocfs2/journal.c
index c644997..c343e36 100644
--- a/fs/ocfs2/journal.c
+++ b/fs/ocfs2/journal.c
@@ -1749,21 +1749,18 @@ static int ocfs2_trylock_journal(struct ocfs2_super *osb,
 				 int slot_num)
 {
 	int status, flags;
-	struct inode *inode = NULL;
+	struct inode *inode;
 
 	inode = ocfs2_get_system_file_inode(osb, JOURNAL_SYSTEM_INODE,
 					    slot_num);
 	if (inode = NULL) {
 		mlog(ML_ERROR, "access error\n");
-		status = -EACCES;
-		goto bail;
+		return -EACCES;
 	}
 	if (is_bad_inode(inode)) {
 		mlog(ML_ERROR, "access error (bad inode)\n");
-		iput(inode);
-		inode = NULL;
 		status = -EACCES;
-		goto bail;
+		goto put_inode;
 	}
 	SET_INODE_JOURNAL(inode);
 
@@ -1772,11 +1769,11 @@ static int ocfs2_trylock_journal(struct ocfs2_super *osb,
 	if (status < 0) {
 		if (status != -EAGAIN)
 			mlog_errno(status);
-		goto bail;
+		goto put_inode;
 	}
 
 	ocfs2_inode_unlock(inode, 1);
-bail:
+put_inode:
 	iput(inode);
 	return status;
 }
-- 
2.4.5

