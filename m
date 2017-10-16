From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 15:07:29 +0000
Subject: [PATCH 4/4] char/snsc: Delete unnecessary braces in five functions
Message-Id: <f9000a51-3629-bb5e-efd2-048200543793@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbedda27-97e7-7b11-b888-39e09f7deaa1@users.sourceforge.net>
In-Reply-To: <cbedda27-97e7-7b11-b888-39e09f7deaa1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 16:48:24 +0200

Do not use curly brackets at some source code places
where a single statement should be sufficient.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/snsc.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/char/snsc.c b/drivers/char/snsc.c
index bec3bd966b1f..aea0ee083511 100644
--- a/drivers/char/snsc.c
+++ b/drivers/char/snsc.c
@@ -47,9 +47,9 @@ scdrv_interrupt(int irq, void *subch_data)
 	status = ia64_sn_irtr_intr(sd->sd_nasid, sd->sd_subch);
 
 	if (status > 0) {
-		if (status & SAL_IROUTER_INTR_RECV) {
+		if (status & SAL_IROUTER_INTR_RECV)
 			wake_up(&sd->sd_rq);
-		}
+
 		if (status & SAL_IROUTER_INTR_XMIT) {
 			ia64_sn_irtr_intr_disable
 			    (sd->sd_nasid, sd->sd_subch,
@@ -165,14 +165,13 @@ scdrv_read(struct file *file, char __user *buf, size_t count, loff_t *f_pos)
 		/* somebody else has it now;
 		 * if we're non-blocking, then exit...
 		 */
-		if (file->f_flags & O_NONBLOCK) {
+		if (file->f_flags & O_NONBLOCK)
 			return -EAGAIN;
-		}
+
 		/* ...or if we want to block, then do so here */
-		if (down_interruptible(&sd->sd_rbs)) {
+		if (down_interruptible(&sd->sd_rbs))
 			/* something went wrong with wait */
 			return -ERESTARTSYS;
-		}
 	}
 
 	/* anything to read? */
@@ -257,14 +256,13 @@ scdrv_write(struct file *file, const char __user *buf,
 		/* somebody else has it now;
 		 * if we're non-blocking, then exit...
 		 */
-		if (file->f_flags & O_NONBLOCK) {
+		if (file->f_flags & O_NONBLOCK)
 			return -EAGAIN;
-		}
+
 		/* ...or if we want to block, then do so here */
-		if (down_interruptible(&sd->sd_wbs)) {
+		if (down_interruptible(&sd->sd_wbs))
 			/* something went wrong with wait */
 			return -ERESTARTSYS;
-		}
 	}
 
 	count = min((int) count, CHUNKSIZE);
@@ -336,12 +334,11 @@ scdrv_poll(struct file *file, struct poll_table_struct *wait)
 	spin_unlock_irqrestore(&sd->sd_rlock, flags);
 
 	if (status > 0) {
-		if (status & SAL_IROUTER_INTR_RECV) {
+		if (status & SAL_IROUTER_INTR_RECV)
 			mask |= POLLIN | POLLRDNORM;
-		}
-		if (status & SAL_IROUTER_INTR_XMIT) {
+
+		if (status & SAL_IROUTER_INTR_XMIT)
 			mask |= POLLOUT | POLLWRNORM;
-		}
 	}
 
 	return mask;
@@ -450,9 +447,8 @@ scdrv_init(void)
                         /* on the console nasid, prepare to receive
                          * system controller environmental events
                          */
-                        if(scd->scd_nasid = event_nasid) {
+			if (scd->scd_nasid = event_nasid)
                                 scdrv_event_init(scd);
-                        }
 	}
 	return 0;
 }
-- 
2.14.2

