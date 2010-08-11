From: Dan Carpenter <error27@gmail.com>
Date: Wed, 11 Aug 2010 22:38:45 +0000
Subject: [patch] drbd: cleanup: change "<= 0" to "== 0"
Message-Id: <20100811223845.GE645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

dt is unsigned so it's never less than zero.  We are calculating the
elapsed time, and that's never less than zero (unless there is a bug or
we invent time travel).  The comparison here is just to guard against
divide by zero bugs.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/block/drbd/drbd_proc.c b/drivers/block/drbd/drbd_proc.c
index be3374b..4c0c4aa 100644
--- a/drivers/block/drbd/drbd_proc.c
+++ b/drivers/block/drbd/drbd_proc.c
@@ -118,7 +118,7 @@ static void drbd_syncer_progress(struct drbd_conf *mdev, struct seq_file *seq)
 	/* mean speed since syncer started
 	 * we do account for PausedSync periods */
 	dt = (jiffies - mdev->rs_start - mdev->rs_paused) / HZ;
-	if (dt <= 0)
+	if (dt = 0)
 		dt = 1;
 	db = mdev->rs_total - rs_left;
 	dbdt = Bit2KB(db/dt);
