From: irwan.djajadi@iname.com
Date: Tue, 25 Oct 2005 04:07:31 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/isdn/i4l/isdn_tty.c: replace
Message-Id: <20051025040731.GA24164@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============021343924823833405=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============021343924823833405==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/isdn/i4l/isdn_tty.c: replace interruptible_sleep_on() with
wait_event_interruptible

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>


diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/isdn/i4l/isdn_tty.c mod/drivers/isdn/i4l/isdn_tty.c
--- 2.6.14-rc5/drivers/isdn/i4l/isdn_tty.c	2005-09-16 20:02:12.000000000 -0500
+++ mod/drivers/isdn/i4l/isdn_tty.c	2005-10-24 22:58:36.000000000 -0500
@@ -1511,8 +1511,8 @@ isdn_tty_block_til_ready(struct tty_stru
 	 */
 	if (tty_hung_up_p(filp) ||
 	    (info->flags & ISDN_ASYNC_CLOSING)) {
-		if (info->flags & ISDN_ASYNC_CLOSING)
-			interruptible_sleep_on(&info->close_wait);
+		wait_event_interruptible(info->close_wait,
+			(info->flags & ISDN_ASYNC_CLOSING)==0);
 #ifdef MODEM_DO_RESTART
 		if (info->flags & ISDN_ASYNC_HUP_NOTIFY)
 			return -EAGAIN;


--===============021343924823833405==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============021343924823833405==--
