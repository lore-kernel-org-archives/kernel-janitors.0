From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 21:35:47 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/33] char/dtlk: replace
Message-Id: <20040915213547.GI5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60550098110018347=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60550098110018347==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout() /
dtlk_delay() to guarantee the task delays as expected. Removes the
definition/prototype of dtlk_delay().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/dtlk.c	2004-09-09 23:05:41.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/dtlk.c	2004-09-10 10:36:04.000000000 -0700
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
+		msleep_interruptible(100);
 	}
 	if (retries == loops_per_jiffy)
 		printk(KERN_ERR "dtlk_read times out\n");
@@ -191,7 +190,7 @@ static ssize_t dtlk_write(struct file *f
 				   rate to 500 bytes/sec, but that's
 				   still enough to keep up with the
 				   speech synthesizer. */
-				dtlk_delay(1);
+				msleep_interruptible(1);
 			else {
 				/* the RDY bit goes zero 2-3 usec
 				   after writing, and goes 1 again
@@ -212,7 +211,7 @@ static ssize_t dtlk_write(struct file *f
 		if (file->f_flags & O_NONBLOCK)
 			break;
 
-		dtlk_delay(1);
+		msleep_interruptible(1);
 
 		if (++retries > 10 * HZ) { /* wait no more than 10 sec
 					      from last write */
@@ -351,8 +350,7 @@ static int __init dtlk_init(void)
 static void __exit dtlk_cleanup (void)
 {
 	dtlk_write_bytes("goodbye", 8);
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(5 * HZ / 10);		/* nap 0.50 sec but
+	msleep_interruptible(500);		/* nap 0.50 sec but
 						   could be awakened
 						   earlier by
 						   signals... */
@@ -368,13 +366,6 @@ module_exit(dtlk_cleanup);
 
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
@@ -431,7 +422,7 @@ static int __init dtlk_dev_probe(void)
 			/* posting an index takes 18 msec.  Here, we
 			   wait up to 100 msec to see whether it
 			   appears. */
-			dtlk_delay(100);
+			msleep_interruptible(100);
 			dtlk_has_indexing = dtlk_readable();
 #ifdef TRACING
 			printk(", indexing %d\n", dtlk_has_indexing);

--===============60550098110018347==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60550098110018347==--
