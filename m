From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 17:18:07 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 19/33] char/pcxx: replace
Message-Id: <20040916171807.GL1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56066669940560354=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56066669940560354==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/pcxx.c	2004-09-09 23:05:41.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/pcxx.c	2004-09-10 11:10:10.000000000 -0700
@@ -561,8 +561,7 @@ static void pcxe_close(struct tty_struct
 #endif
 		if(info->blocked_open) {
 			if(info->close_delay) {
-				current->state = TASK_INTERRUPTIBLE;
-				schedule_timeout(info->close_delay);
+				msleep_interruptible(jiffies_to_msecs(info->close_delay));
 			}
 			wake_up_interruptible(&info->open_wait);
 		}

--===============56066669940560354==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56066669940560354==--
