From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 03:00:21 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/amiserial.c: replace
Message-Id: <20051023030021.GG2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64883399387697849=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64883399387697849==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/amiserial.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/amiserial.c mod/drivers/char/amiserial.c
--- 2.6.14-rc5/drivers/char/amiserial.c	2005-10-22 00:06:17.000000000 -0500
+++ mod/drivers/char/amiserial.c	2005-10-22 20:55:09.000000000 -0500
@@ -1656,8 +1656,8 @@ static int block_til_ready(struct tty_st
 	 */
 	if (tty_hung_up_p(filp) ||
 	    (info->flags & ASYNC_CLOSING)) {
-		if (info->flags & ASYNC_CLOSING)
-			interruptible_sleep_on(&info->close_wait);
+		wait_event_interruptible(info->close_wait,
+			(info->flags & ASYNC_CLOSING) == 0);
 #ifdef SERIAL_DO_RESTART
 		return ((info->flags & ASYNC_HUP_NOTIFY) ?
 			-EAGAIN : -ERESTARTSYS);
@@ -1829,8 +1829,8 @@ static int rs_open(struct tty_struct *tt
 	 */
 	if (tty_hung_up_p(filp) ||
 	    (info->flags & ASYNC_CLOSING)) {
-		if (info->flags & ASYNC_CLOSING)
-			interruptible_sleep_on(&info->close_wait);
+		wait_event_interruptible(info->close_wait,
+			(info->flags & ASYNC_CLOSING) == 0);
 #ifdef SERIAL_DO_RESTART
 		return ((info->flags & ASYNC_HUP_NOTIFY) ?
 			-EAGAIN : -ERESTARTSYS);
 



--===============64883399387697849==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64883399387697849==--
