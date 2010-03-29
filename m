From: Julia Lawall <julia@diku.dk>
Date: Mon, 29 Mar 2010 15:34:46 +0000
Subject: [PATCH 5/12] drivers/macintosh: Add missing unlock
Message-Id: <Pine.LNX.4.64.1003291734290.21896@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In some error handling cases the lock is not unlocked.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression E1;
identifier f;
@@

f (...) { <+...
* spin_lock_irqsave (E1,...);
... when != E1
* return ...;
...+> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/macintosh/macio-adb.c |    1 +
 drivers/macintosh/smu.c       |    4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/macio-adb.c b/drivers/macintosh/macio-adb.c
index 79119f5..bd6da7a 100644
--- a/drivers/macintosh/macio-adb.c
+++ b/drivers/macintosh/macio-adb.c
@@ -155,6 +155,7 @@ static int macio_adb_reset_bus(void)
 	while ((in_8(&adb->ctrl.r) & ADB_RST) != 0) {
 		if (--timeout = 0) {
 			out_8(&adb->ctrl.r, in_8(&adb->ctrl.r) & ~ADB_RST);
+			spin_unlock_irqrestore(&macio_lock, flags);
 			return -1;
 		}
 	}
diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index f96feeb..28f75cf 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -1182,8 +1182,10 @@ static ssize_t smu_read_command(struct file *file, struct smu_private *pp,
 		return -EOVERFLOW;
 	spin_lock_irqsave(&pp->lock, flags);
 	if (pp->cmd.status = 1) {
-		if (file->f_flags & O_NONBLOCK)
+		if (file->f_flags & O_NONBLOCK) {
+			spin_unlock_irqrestore(&pp->lock, flags);
 			return -EAGAIN;
+		}
 		add_wait_queue(&pp->wait, &wait);
 		for (;;) {
 			set_current_state(TASK_INTERRUPTIBLE);
