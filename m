From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 21:20:46 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 26/33] char/stallion: replace
Message-Id: <20040916212046.GT1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74710228242352228=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74710228242352228==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. I'm not sure if I did the desired
thing here, as I got rid of stl_delay() completely. After the
msleep_interruptible() replacement, stli_delay() would only be used in
one place. I'm not sure which way is preferred (the original or mine)
regarding the second change, therefore.

Description: Use msleep_interruptible() instead of stl_delay() to
guarantee the task delays as expected. Removed the definition /
prototype of stl_delay() as it was only called in one other place,
where I made the direct change to
set_current_state()/schedule_timeout().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/stallion.c	2004-09-13 17:15:50.000000000 -0700
+++ 2.6.9-rc2/drivers/char/stallion.c	2004-09-16 14:17:30.000000000 -0700
@@ -512,7 +512,6 @@ static int	stl_clrportstats(stlport_t *p
 static int	stl_getportstruct(stlport_t __user *arg);
 static int	stl_getbrdstruct(stlbrd_t __user *arg);
 static int	stl_waitcarrier(stlport_t *portp, struct file *filp);
-static void	stl_delay(int len);
 static void	stl_eiointr(stlbrd_t *brdp);
 static void	stl_echatintr(stlbrd_t *brdp);
 static void	stl_echmcaintr(stlbrd_t *brdp);
@@ -1205,7 +1204,7 @@ static void stl_close(struct tty_struct 
 
 	if (portp->openwaitcnt) {
 		if (portp->close_delay)
-			stl_delay(portp->close_delay);
+			msleep_interruptible(jiffies_to_msecs(portp->close_delay));
 		wake_up_interruptible(&portp->open_wait);
 	}
 
@@ -1217,25 +1216,6 @@ static void stl_close(struct tty_struct 
 /*****************************************************************************/
 
 /*
- *	Wait for a specified delay period, this is not a busy-loop. It will
- *	give up the processor while waiting. Unfortunately this has some
- *	rather intimate knowledge of the process management stuff.
- */
-
-static void stl_delay(int len)
-{
-#ifdef DEBUG
-	printk("stl_delay(len=%d)\n", len);
-#endif
-	if (len > 0) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(len);
-	}
-}
-
-/*****************************************************************************/
-
-/*
  *	Write routine. Take data and stuff it in to the TX ring queue.
  *	If transmit interrupts are not running then start them.
  */
@@ -1858,7 +1838,8 @@ static void stl_waituntilsent(struct tty
 	while (stl_datastate(portp)) {
 		if (signal_pending(current))
 			break;
-		stl_delay(2);
+		set_current_state(TASK_INTERRUPTIBLE);
+		schedule_timeout(2);
 		if (time_after_eq(jiffies, tend))
 			break;
 	}

--===============74710228242352228==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74710228242352228==--
