From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 23:16:03 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2] tc/zs: replace
Message-Id: <20040927231603.GW1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64702355226461061=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64702355226461061==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.


--- 2.6.9-rc2-vanilla/drivers/tc/zs.c	2004-09-13 17:16:08.000000000 -0700
+++ 2.6.9-rc2/drivers/tc/zs.c	2004-09-14 10:26:12.000000000 -0700
@@ -1410,8 +1410,7 @@ static void rs_close(struct tty_struct *
 	info->tty = 0;
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	}
@@ -1444,8 +1443,7 @@ static void rs_wait_until_sent(struct tt
 	if (timeout)
 		char_time = min_t(unsigned long, char_time, timeout);
 	while ((read_zsreg(info->zs_channel, 1) & Tx_BUF_EMP) == 0) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(char_time);
+		msleep_interruptible(jiffies_to_msecs(char_time));
 		if (signal_pending(current))
 			break;
 		if (timeout && time_after(jiffies, orig_jiffies + timeout))

--===============64702355226461061==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64702355226461061==--
