From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 16:57:52 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2] s390/ctctty: replace
Message-Id: <20040927165752.GI1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76019172654613687=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76019172654613687==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/s390/net/ctctty.c	2004-09-09 23:05:27.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/s390/net/ctctty.c	2004-09-10 15:36:11.000000000 -0700
@@ -1071,8 +1071,7 @@ ctc_tty_close(struct tty_struct *tty, st
 	info->tty = 0;
 	tty->closing = 0;
 	if (info->blocked_open) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/2);
+		msleep_interruptible(500);
 		wake_up_interruptible(&info->open_wait);
 	}
 	info->flags &= ~(CTC_ASYNC_NORMAL_ACTIVE | CTC_ASYNC_CLOSING);

--===============76019172654613687==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76019172654613687==--
