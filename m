From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 02 Nov 2004 19:40:19 +0000
Subject: [KJ] [PATCH] sound/cs4231: replace schedule_timeout() with
Message-Id: <20041102194019.GA2163@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48181361286308078=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============48181361286308078==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description: Uses msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected. Changes the type of time to
match the return value of msleep_interruptible().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-rc1-vanilla/sound/sparc/cs4231.c	2004-10-30 15:34:20.000000000 -0700
+++ 2.6.10-rc1/sound/sparc/cs4231.c	2004-11-02 11:35:00.000000000 -0800
@@ -560,7 +560,7 @@ static void snd_cs4231_mce_down(cs4231_t
 {
 	unsigned long flags;
 	int timeout;
-	signed long time;
+	unsigned long time;
 
 	spin_lock_irqsave(&chip->lock, flags);
 	snd_cs4231_busy_wait(chip);
@@ -594,29 +594,27 @@ static void snd_cs4231_mce_down(cs4231_t
 #if 0
 	printk("(2) timeout = %i, jiffies = %li\n", timeout, jiffies);
 #endif
-	time = HZ / 4;
+	time = 250;
 	while (snd_cs4231_in(chip, CS4231_TEST_INIT) & CS4231_CALIB_IN_PROGRESS) {
 		spin_unlock_irqrestore(&chip->lock, flags);
 		if (time <= 0) {
 			snd_printk("mce_down - auto calibration time out (2)\n");
 			return;
 		}
-		set_current_state(TASK_INTERRUPTIBLE);
-		time = schedule_timeout(time);
+		time = msleep_interruptible(time);
 		spin_lock_irqsave(&chip->lock, flags);
 	}
 #if 0
 	printk("(3) jiffies = %li\n", jiffies);
 #endif
-	time = HZ / 10;
+	time = 100;
 	while (__cs4231_readb(chip, CS4231P(chip, REGSEL)) & CS4231_INIT) {
 		spin_unlock_irqrestore(&chip->lock, flags);
 		if (time <= 0) {
 			snd_printk("mce_down - auto calibration time out (3)\n");
 			return;
 		}
-		set_current_state(TASK_INTERRUPTIBLE);		
-		time = schedule_timeout(time);
+		time = msleep_interruptible(time);
 		spin_lock_irqsave(&chip->lock, flags);
 	}
 	spin_unlock_irqrestore(&chip->lock, flags);

--===============48181361286308078==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48181361286308078==--
