From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 18:13:46 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 22/33] char/rocket: replace
Message-Id: <20040916181346.GO1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============027719850124181988=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============027719850124181988==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/rocket.c	2004-09-09 23:05:41.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/rocket.c	2004-09-10 11:16:03.000000000 -0700
@@ -1108,8 +1108,7 @@ static void rp_close(struct tty_struct *
 
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	} else {
@@ -1538,8 +1537,7 @@ static void rp_wait_until_sent(struct tt
 #ifdef ROCKET_DEBUG_WAIT_UNTIL_SENT
 		printk(KERN_INFO "txcnt = %d (jiff=%lu,check=%d)...", txcnt, jiffies, check_time);
 #endif
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(check_time);
+		msleep_interruptible(jiffies_to_msecs(check_time));
 		if (signal_pending(current))
 			break;
 	}

--===============027719850124181988==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============027719850124181988==--
