From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 18:22:34 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/3] macintosh/macserial:
Message-Id: <20040917182234.GR1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85327042056099511=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916231114.GE1777@us.ibm.com>
In-Reply-To: <20040916231114.GE1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============85327042056099511==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/macintosh/macserial.c	2004-09-09 23:05:59.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/macintosh/macserial.c	2004-09-10 11:49:18.000000000 -0700
@@ -2002,8 +2002,7 @@ static void rs_close(struct tty_struct *
 
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	}
@@ -2048,8 +2047,7 @@ static void rs_wait_until_sent(struct tt
 	if (timeout)
 		char_time = min_t(unsigned long, char_time, timeout);
 	while ((read_zsreg(info->zs_channel, 1) & ALL_SNT) == 0) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(char_time);
+		msleep_interruptible(jiffies_to_msecs(char_time));
 		if (signal_pending(current))
 			break;
 		if (timeout && time_after(jiffies, orig_jiffies + timeout))

--===============85327042056099511==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85327042056099511==--
