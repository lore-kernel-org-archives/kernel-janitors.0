From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 01 Sep 2004 22:22:24 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc1-bk7] dtlk: replace
Message-Id: <20040901222224.GD2516@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38208766981022624=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38208766981022624==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is one of 10 patches which have either not been pushed to mainline
(2.6.9-rc1-bk7) or have not been included in any of the recent kjt's.

Applys-to: 2.6.9-rc1-bk7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc1-bk7-vanilla/drivers/char/dtlk.c	2004-08-31 21:26:38.000000000 +0000
+++ 2.6.9-rc1-bk7-dev/drivers/char/dtlk.c	2004-09-01 22:06:19.000000000 +0000
@@ -55,7 +55,7 @@
 #include <linux/mm.h>		/* for verify_area */
 #include <linux/errno.h>	/* for -EBUSY */
 #include <linux/ioport.h>	/* for request_region */
-#include <linux/delay.h>	/* for loops_per_jiffy */
+#include <linux/delay.h>	/* for loops_per_jiffy, msleep */
 #include <asm/io.h>		/* for inb_p, outb_p, inb, outb, etc. */
 #include <asm/uaccess.h>	/* for get_user, etc. */
 #include <linux/wait.h>		/* for wait_queue */
@@ -107,7 +107,6 @@ static struct file_operations dtlk_fops 
 };
 
 /* local prototypes */
-static void dtlk_delay(int ms);
 static int dtlk_dev_probe(void);
 static struct dtlk_settings *dtlk_interrogate(void);
 static int dtlk_readable(void);
@@ -146,7 +145,7 @@ static ssize_t dtlk_read(struct file *fi
 			return i;
 		if (file->f_flags & O_NONBLOCK)
 			break;
-		dtlk_delay(100);
+		msleep(100);
 	}
 	if (retries == loops_per_jiffy)
 		printk(KERN_ERR "dtlk_read times out\n");
@@ -191,7 +190,7 @@ static ssize_t dtlk_write(struct file *f
 				   rate to 500 bytes/sec, but that's
 				   still enough to keep up with the
 				   speech synthesizer. */
-				dtlk_delay(1);
+				msleep(1);
 			else {
 				/* the RDY bit goes zero 2-3 usec
 				   after writing, and goes 1 again
@@ -212,7 +211,7 @@ static ssize_t dtlk_write(struct file *f
 		if (file->f_flags & O_NONBLOCK)
 			break;
 
-		dtlk_delay(1);
+		msleep(1);
 
 		if (++retries > 10 * HZ) { /* wait no more than 10 sec
 					      from last write */
@@ -368,13 +367,6 @@ module_exit(dtlk_cleanup);
 
 /* ------------------------------------------------------------------------ */
 
-/* sleep for ms milliseconds */
-static void dtlk_delay(int ms)
-{
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout((ms * HZ + 1000 - HZ) / 1000);
-}
-
 static int dtlk_readable(void)
 {
 #ifdef TRACING
@@ -431,7 +423,7 @@ static int __init dtlk_dev_probe(void)
 			/* posting an index takes 18 msec.  Here, we
 			   wait up to 100 msec to see whether it
 			   appears. */
-			dtlk_delay(100);
+			msleep(100);
 			dtlk_has_indexing = dtlk_readable();
 #ifdef TRACING
 			printk(", indexing %d\n", dtlk_has_indexing);

--===============38208766981022624==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38208766981022624==--
