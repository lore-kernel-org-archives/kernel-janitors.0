From: Clemens Ladisch <clemens@ladisch.de>
Date: Wed, 03 Nov 2004 09:22:34 +0000
Subject: [KJ] Re: [Alsa-devel] [PATCH] sound/cs4231_lib: replace
Message-Id: <Pine.HPX.4.33n.0411031010440.25361-100000@studcom.urz.uni-halle.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89289788799041925=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89289788799041925==
Content-Type: TEXT/PLAIN; charset=US-ASCII

Nishanth Aravamudan wrote:
> [...]
> How about the following patch?

Applied, with some changes (see below).

> I used TASK_UNINTERRUPTIBLE (i.e. msleep()). This, though, will
> guarantee that the task sleeps *at least* the requested time (20
> ms per iteration). This may lead to a longer delay than desired,
> for instance, if perhaps the condition should be checked after
> each signal.

This code was never intended to handle signals; using
TASK_INTERRUPTIBLE was a bug.

20 ms happens to be the usual calibration time of the original CS4231
chip (so it was expected to stop after the first iteration), but there
are many clones that might need a slightly different time, so I
changed it to 10 ms.  However, this doesn't really matter. :)

Finally, I removed the time variable because it wasn't used anymore.


Clemens


Index: alsa-kernel/isa/cs423x/cs4231_lib.c
===================================================================
RCS file: /cvsroot/alsa/alsa-kernel/isa/cs423x/cs4231_lib.c,v
retrieving revision 1.43
retrieving revision 1.44
diff -u -r1.43 -r1.44
--- alsa-kernel/isa/cs423x/cs4231_lib.c	20 Jul 2004 15:54:22 -0000	1.43
+++ alsa-kernel/isa/cs423x/cs4231_lib.c	3 Nov 2004 09:10:40 -0000	1.44
@@ -356,7 +356,6 @@
 {
 	unsigned long flags;
 	int timeout;
-	signed long time;

 	snd_cs4231_busy_wait(chip);
 #if 0
@@ -390,34 +389,26 @@
 #if 0
 	printk("(2) timeout = %i, jiffies = %li\n", timeout, jiffies);
 #endif
-	timeout = HZ / 4 / 2;
-	time = 2;
+	/* in 10 ms increments, check condition, up to 250 ms */
+	timeout = 25;
 	while (snd_cs4231_in(chip, CS4231_TEST_INIT) & CS4231_CALIB_IN_PROGRESS) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		time = schedule_timeout(time);
-		if (time > 0)
-			continue;
-		time = 2;
 		if (--timeout < 0) {
 			snd_printk("mce_down - auto calibration time out (2)\n");
 			return;
 		}
+		msleep(10);
 	}
 #if 0
 	printk("(3) jiffies = %li\n", jiffies);
 #endif
-	timeout = HZ / 10 / 2;
-	time = 2;
+	/* in 10 ms increments, check condition, up to 100 ms */
+	timeout = 10;
 	while (cs4231_inb(chip, CS4231P(REGSEL)) & CS4231_INIT) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		time = schedule_timeout(time);
-		if (time > 0)
-			continue;
-		time = 2;
 		if (--timeout < 0) {
 			snd_printk(KERN_ERR "mce_down - auto calibration time out (3)\n");
 			return;
 		}
+		msleep(10);
 	}
 #if 0
 	printk("(4) jiffies = %li\n", jiffies);


--===============89289788799041925==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89289788799041925==--
