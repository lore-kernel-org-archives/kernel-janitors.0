From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 03 Nov 2004 18:03:15 +0000
Subject: [KJ] Re: [Alsa-devel] [PATCH] sound/cs4231: replace
Message-Id: <20041103180315.GE2163@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============013469387533617372=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.HPX.4.33n.0411031010440.25361-100000@studcom.urz.uni-halle.de>
In-Reply-To: <Pine.HPX.4.33n.0411031010440.25361-100000@studcom.urz.uni-halle.de>
To: kernel-janitors@vger.kernel.org

--===============013469387533617372==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 03, 2004 at 10:31:42AM +0100, Clemens Ladisch wrote:
> Nishanth Aravamudan wrote:
> > +	time = 250;
> >  	while (snd_cs4231_in(chip, CS4231_TEST_INIT) & CS4231_CALIB_IN_PROGRESS) {
> >  		spin_unlock_irqrestore(&chip->lock, flags);
> >  		if (time <= 0) {
> >  			snd_printk("mce_down - auto calibration time out (2)\n");
> >  			return;
> >  		}
> > -		set_current_state(TASK_INTERRUPTIBLE);
> > -		time = schedule_timeout(time);
> > +		time = msleep_interruptible(time);
> >  		spin_lock_irqsave(&chip->lock, flags);
> >  	}
> >
> > Description: Uses msleep_interruptible() instead of schedule_timeout()
> > to guarantee the task delays as expected.
> 
> The SPARC driver originated as a copy of the ISA driver and still has
> the problem that was fixed there, i.e., it uses a single 250 ms wait
> (which results in a delay of several seconds if OSS programs try to
> enumerate sample rates).
> 
> Like the ISA driver, this driver should check the hardware status more
> often so that the wait can be aborted as soon as the calibration has
> finished.
> 
> And this driver doesn't expect do receive signals; using msleep()
> would be just fine.

These changes have been made in the following patch. Does it look better
now?

-Nish

Description: Uses msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected. Changes the type of time to
match the return value of msleep_interruptible().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-rc1-vanilla/sound/sparc/cs4231.c	2004-10-30 15:34:20.000000000 -0700
+++ 2.6.10-rc1/sound/sparc/cs4231.c	2004-11-03 10:01:47.000000000 -0800
@@ -560,7 +560,6 @@ static void snd_cs4231_mce_down(cs4231_t
 {
 	unsigned long flags;
 	int timeout;
-	signed long time;
 
 	spin_lock_irqsave(&chip->lock, flags);
 	snd_cs4231_busy_wait(chip);
@@ -594,29 +593,29 @@ static void snd_cs4231_mce_down(cs4231_t
 #if 0
 	printk("(2) timeout = %i, jiffies = %li\n", timeout, jiffies);
 #endif
-	time = HZ / 4;
+	/* in 10ms increments, check condition, up to 250ms */
+	timeout = 25;
 	while (snd_cs4231_in(chip, CS4231_TEST_INIT) & CS4231_CALIB_IN_PROGRESS) {
 		spin_unlock_irqrestore(&chip->lock, flags);
-		if (time <= 0) {
+		if (--timeout < 0) {
 			snd_printk("mce_down - auto calibration time out (2)\n");
 			return;
 		}
-		set_current_state(TASK_INTERRUPTIBLE);
-		time = schedule_timeout(time);
+		msleep(10);
 		spin_lock_irqsave(&chip->lock, flags);
 	}
 #if 0
 	printk("(3) jiffies = %li\n", jiffies);
 #endif
-	time = HZ / 10;
+	/* in 10ms increments, check condition, up to 100ms */
+	timeout = 10;
 	while (__cs4231_readb(chip, CS4231P(chip, REGSEL)) & CS4231_INIT) {
 		spin_unlock_irqrestore(&chip->lock, flags);
-		if (time <= 0) {
+		if (--timeout < 0) {
 			snd_printk("mce_down - auto calibration time out (3)\n");
 			return;
 		}
-		set_current_state(TASK_INTERRUPTIBLE);		
-		time = schedule_timeout(time);
+		msleep(10);
 		spin_lock_irqsave(&chip->lock, flags);
 	}
 	spin_unlock_irqrestore(&chip->lock, flags);

--===============013469387533617372==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============013469387533617372==--
