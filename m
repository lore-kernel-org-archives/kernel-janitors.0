From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Jul 2015 13:40:33 +0000
Subject: [PATCH 10/11] ocfs2: Less function calls in ocfs2_replay_journal() after error detection
Message-Id: <559933D1.7010102@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5455FC05.4010606@users.sourceforge.net> <alpine.DEB.2.02.1411021150540.2239@localhost6.localdomain6> <55992DF0.5030205@users.sourceforge.net>
In-Reply-To: <55992DF0.5030205@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Jul 2015 12:23:37 +0200

The functions brelse() and iput() were called in one case by the
ocfs2_replay_journal() function during error handling even
if the passed variables contained still a pointer which did not refer
to valid data.

* Return directly if a call of the ocfs2_read_journal_inode() function
  failed at the beginning.

* Rename jump labels according to the Linux coding style convention.

* Delete the variable "got_lock" then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/journal.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/fs/ocfs2/journal.c b/fs/ocfs2/journal.c
index c343e36..7bb50f4 100644
--- a/fs/ocfs2/journal.c
+++ b/fs/ocfs2/journal.c
@@ -1544,7 +1544,6 @@ static int ocfs2_replay_journal(struct ocfs2_super *osb,
 				int slot_num)
 {
 	int status;
-	int got_lock = 0;
 	unsigned int flags;
 	struct inode *inode = NULL;
 	struct ocfs2_dinode *fe;
@@ -1555,7 +1554,7 @@ static int ocfs2_replay_journal(struct ocfs2_super *osb,
 	status = ocfs2_read_journal_inode(osb, slot_num, &bh, &inode);
 	if (status) {
 		mlog_errno(status);
-		goto done;
+		return status;
 	}
 
 	fe = (struct ocfs2_dinode *)bh->b_data;
@@ -1576,7 +1575,7 @@ static int ocfs2_replay_journal(struct ocfs2_super *osb,
 		     osb->slot_recovery_generations[slot_num], slot_reco_gen);
 		osb->slot_recovery_generations[slot_num] = slot_reco_gen;
 		status = -EBUSY;
-		goto done;
+		goto put_inode;
 	}
 
 	/* Continue with recovery as the journal has not yet been recovered */
@@ -1586,9 +1585,8 @@ static int ocfs2_replay_journal(struct ocfs2_super *osb,
 		trace_ocfs2_replay_journal_lock_err(status);
 		if (status != -ERESTARTSYS)
 			mlog(ML_ERROR, "Could not lock journal!\n");
-		goto done;
+		goto put_inode;
 	}
-	got_lock = 1;
 
 	fe = (struct ocfs2_dinode *) bh->b_data;
 
@@ -1599,7 +1597,7 @@ static int ocfs2_replay_journal(struct ocfs2_super *osb,
 		trace_ocfs2_replay_journal_skip(node_num);
 		/* Refresh recovery generation for the slot */
 		osb->slot_recovery_generations[slot_num] = slot_reco_gen;
-		goto done;
+		goto unlock_inode;
 	}
 
 	/* we need to run complete recovery for offline orphan slots */
@@ -1614,14 +1612,14 @@ static int ocfs2_replay_journal(struct ocfs2_super *osb,
 	status = ocfs2_force_read_journal(inode);
 	if (status < 0) {
 		mlog_errno(status);
-		goto done;
+		goto unlock_inode;
 	}
 
 	journal = jbd2_journal_init_inode(inode);
 	if (journal = NULL) {
 		mlog(ML_ERROR, "Linux journal layer error\n");
 		status = -EIO;
-		goto done;
+		goto unlock_inode;
 	}
 
 	status = jbd2_journal_load(journal);
@@ -1630,7 +1628,7 @@ static int ocfs2_replay_journal(struct ocfs2_super *osb,
 		if (!igrab(inode))
 			BUG();
 		jbd2_journal_destroy(journal);
-		goto done;
+		goto unlock_inode;
 	}
 
 	ocfs2_clear_journal_error(osb->sb, journal, slot_num);
@@ -1665,11 +1663,10 @@ static int ocfs2_replay_journal(struct ocfs2_super *osb,
 	printk(KERN_NOTICE "ocfs2: End replay journal (node %d, slot %d) on "\
 	       "device (%u,%u)\n", node_num, slot_num, MAJOR(osb->sb->s_dev),
 	       MINOR(osb->sb->s_dev));
-done:
+unlock_inode:
 	/* drop the lock on this nodes journal */
-	if (got_lock)
-		ocfs2_inode_unlock(inode, 1);
-
+	ocfs2_inode_unlock(inode, 1);
+put_inode:
 	iput(inode);
 	brelse(bh);
 
-- 
2.4.5

