From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:10:45 +0000
Subject: [Kernel-janitors] [PATCH] s390/ctctty: replace long_delay() with
Message-Id: <20040727221045.GD3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8797180862988272=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8797180862988272==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the task
delays as desired.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/s390/net/ctctty.c	2004-06-16 05:19:35.000000000 +0000
+++ linux-dev/drivers/s390/net/ctctty.c	2004-07-12 22:26:29.000000000 +0000
@@ -1039,8 +1039,7 @@ ctc_tty_close(struct tty_struct *tty, st
 	info->tty = 0;
 	tty->closing = 0;
 	if (info->blocked_open) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/2);
+		msleep(500);
 		wake_up_interruptible(&info->open_wait);
 	}
 	info->flags &= ~(CTC_ASYNC_NORMAL_ACTIVE | CTC_ASYNC_CLOSING);

--===============8797180862988272==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8797180862988272==--
