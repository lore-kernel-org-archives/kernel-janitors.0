From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 13:42:40 +0000
Subject: [PATCH 11/11] ocfs2: One function call less in ocfs2_journal_shutdown() from input checks
Message-Id: <55993450.9090102@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <55992DF0.5030205@users.sourceforge.net>
In-Reply-To: <55992DF0.5030205@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Jul 2015 14:54:33 +0200

The iput() function was called in one case by the ocfs2_journal_shutdown()
function during input parameter validation even if the passed
variable contained still a null pointer.

* Return directly if received values indicate that at the beginning.

* Delete the unnecessary jump label "done".

* Drop unnecessary initialisations for the variables "inode",
  "journal" and "num_running_trans" then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/journal.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/fs/ocfs2/journal.c b/fs/ocfs2/journal.c
index 7bb50f4..f13e6fdb 100644
--- a/fs/ocfs2/journal.c
+++ b/fs/ocfs2/journal.c
@@ -951,22 +951,20 @@ static int ocfs2_journal_toggle_dirty(struct ocfs2_super *osb,
  */
 void ocfs2_journal_shutdown(struct ocfs2_super *osb)
 {
-	struct ocfs2_journal *journal = NULL;
+	struct ocfs2_journal *journal;
 	int status = 0;
-	struct inode *inode = NULL;
-	int num_running_trans = 0;
+	struct inode *inode;
+	int num_running_trans;
 
 	BUG_ON(!osb);
 
 	journal = osb->journal;
 	if (!journal)
-		goto done;
-
-	inode = journal->j_inode;
-
+		return;
 	if (journal->j_state != OCFS2_JOURNAL_LOADED)
-		goto done;
+		return;
 
+	inode = journal->j_inode;
 	/* need to inc inode use count - jbd2_journal_destroy will iput. */
 	if (!igrab(inode))
 		BUG();
@@ -1025,7 +1023,6 @@ void ocfs2_journal_shutdown(struct ocfs2_super *osb)
 	journal->j_state = OCFS2_JOURNAL_FREE;
 
 //	up_write(&journal->j_trans_barrier);
-done:
 	iput(inode);
 }
 
-- 
2.4.5

