From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 17:56:51 +0000
Subject: [KJ] [PATCH 1/20] char/lp: remove interruptible_sleep_on_timeout()
Message-Id: <20050202175651.GB2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82464504877102329=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82464504877102329==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Replace deprecated interruptible_sleep_on_timeout() function calls
with direct wait-queue usage. There may be an existing problem with this driver,
as I am not finding any wake_up_interruptible() callers for the waitq. 
Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc2-kj-v/drivers/char/lp.c	2005-01-24 09:34:06.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/char/lp.c	2005-02-02 09:55:30.000000000 -0800
@@ -127,6 +127,7 @@
 #include <linux/poll.h>
 #include <linux/console.h>
 #include <linux/device.h>
+#include <linux/wait.h>
 
 #include <linux/parport.h>
 #undef LP_STATS
@@ -218,6 +219,7 @@ static int lp_reset(int minor)
 
 static void lp_error (int minor)
 {
+	DEFINE_WAIT(wait);
 	int polling;
 
 	if (LP_F(minor) & LP_ABORT)
@@ -225,8 +227,9 @@ static void lp_error (int minor)
 
 	polling = lp_table[minor].dev->port->irq == PARPORT_IRQ_NONE;
 	if (polling) lp_release_parport (&lp_table[minor]);
-	interruptible_sleep_on_timeout (&lp_table[minor].waitq,
-					LP_TIMEOUT_POLLED);
+	prepare_to_wait(&lp_table[minor].waitq, &wait, TASK_INTERRUPTIBLE);
+	schedule_timeout(LP_TIMEOUT_POLLED);
+	finish_wait(&lp_table[minor].waitq, &wait);
 	if (polling) lp_claim_parport_or_block (&lp_table[minor]);
 	else parport_yield_blocking (lp_table[minor].dev);
 }
@@ -410,6 +413,7 @@ static ssize_t lp_write(struct file * fi
 static ssize_t lp_read(struct file * file, char __user * buf,
 		       size_t count, loff_t *ppos)
 {
+	DEFINE_WAIT(wait);
 	unsigned int minor=iminor(file->f_dentry->d_inode);
 	struct parport *port = lp_table[minor].dev->port;
 	ssize_t retval = 0;
@@ -458,9 +462,11 @@ static ssize_t lp_read(struct file * fil
 				retval = -EIO;
 				goto out;
 			}
-		} else
-			interruptible_sleep_on_timeout (&lp_table[minor].waitq,
-							LP_TIMEOUT_POLLED);
+		} else {
+			prepare_to_wait(&lp_table[minor].waitq, &wait, TASK_INTERRUPTIBLE);
+			schedule_timeout(LP_TIMEOUT_POLLED);
+			finish_wait(&lp_table[minor].waitq, &wait);
+		}
 
 		if (signal_pending (current)) {
 			retval = -ERESTARTSYS;

--===============82464504877102329==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82464504877102329==--
