From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 02 Nov 2004 19:29:13 +0000
Subject: [KJ] [PATCH] sound/cs4231_lib: replace schedule_timeout() with
Message-Id: <20041102192913.GA1710@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============046306040027588757=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============046306040027588757==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 02, 2004 at 01:20:04PM +0100, Clemens Ladisch wrote:
> Nishanth Aravamudan wrote:
> > sound/isa/cs423x/cs4231_lib.c
> >
> > which contains the following code:
> >
> > 	timeout = HZ / 4 / 2;
> > 	time = 2;
> > 	while (snd_cs4231_in(chip, CS4231_TEST_INIT) & CS4231_CALIB_IN_PROGRESS) {
> > 		set_current_state(TASK_INTERRUPTIBLE);
> > 		time = schedule_timeout(time);
> > 		if (time > 0)
> > 			continue;
> > 		time = 2;
> > 		if (--timeout < 0) {
> > 			snd_printk("mce_down - auto calibration time out (2)\n");
> > 			return;
> > 		}
> > 	}
> >
> > This code seems pretty strange, as the delay is in terms of time, which
> > seems to mean the loop (as long as the condition is true, of course)
> > sleeps for 2 jiffies, then sleeps for another 2, about HZ / 4 / 2 (HZ /
> > 8) times. This results in a maximal delay of HZ / 4 jiffies...
> 
> This code was introduced in revision 1.29:
> http://cvs.sourceforge.net/viewcvs.py/alsa/alsa-kernel/isa/cs423x/cs4231_lib.c?rev=HEAD&view=log#rev1.29
> 
> Originally, there was a single timeout of 250 ms, but it had to be
> split up into several waits to be able to check the chip status more
> frequently.
> 
> There is no reason to use 2 jiffies -- the code was written assuming
> HZ=100 (for 20ms waits), but now this isn't the case anyway.
> 
> BTW: Using TASK_INTERRUPTIBLE isn't quite correct because we don't
> check for signals here.

Ok, great! Thanks for the information! How about the following patch? I
tried to follow the information you gave me as well as what I saw as the
original intent of the code. Of course, I am open to changes... Also,
there is similar code in sound/sparc/cs4231.c. Can similar changes be
made there? It seems like it should be possible, as long as I keep the
irq_* functions in place.

Finally, I used TASK_UNINTERRUPTIBLE (i.e. msleep()). This, though, will
guarantee that the task sleeps *at least* the requested time (20 ms per
iteration). This may lead to a longer delay than desired, for instance,
if perhaps the condition should be checked after each signal. I can make
this change, of course, and use msleep_interruptible() instead, which to
me makes a little more sense...

-Nish

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays as expected. This lead to several related changes, as
the current code assumes the value of HZ is 100. Use timeout as an
iteration variable to count out how many 20ms delays should be used.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-rc1-vanilla/sound/isa/cs423x/cs4231_lib.c	2004-10-30 15:34:19.000000000 -0700
+++ 2.6.10-rc1/sound/isa/cs423x/cs4231_lib.c	2004-11-02 11:27:40.000000000 -0800
@@ -390,34 +390,26 @@ void snd_cs4231_mce_down(cs4231_t *chip)
 #if 0
 	printk("(2) timeout = %i, jiffies = %li\n", timeout, jiffies);
 #endif
-	timeout = HZ / 4 / 2;
-	time = 2;
+	/* in 20 ms increments, check condition, up to 260 ms */
+	timeout = 8;
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
+		msleep(20);
 	}
 #if 0
 	printk("(3) jiffies = %li\n", jiffies);
 #endif
-	timeout = HZ / 10 / 2;
-	time = 2;
+	/* in 20 ms increments, check condition, up to 100 ms */
+	timeout = 5;
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
+		msleep(20);
 	}
 #if 0
 	printk("(4) jiffies = %li\n", jiffies);

--===============046306040027588757==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============046306040027588757==--
