From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 03:04:18 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/esp.c: replace
Message-Id: <20051023030418.GJ2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0631512796217919=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============0631512796217919==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/esp.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/esp.c mod/drivers/char/esp.c
--- 2.6.14-rc5/drivers/char/esp.c	2005-09-16 20:02:12.000000000 -0500
+++ mod/drivers/char/esp.c	2005-10-22 20:57:51.000000000 -0500
@@ -2166,8 +2166,8 @@ static int block_til_ready(struct tty_st
 	 */
 	if (tty_hung_up_p(filp) ||
 	    (info->flags & ASYNC_CLOSING)) {
-		if (info->flags & ASYNC_CLOSING)
-			interruptible_sleep_on(&info->close_wait);
+		wait_event_interruptible(info->close_wait,
+			(info->flags & ASYNC_CLOSING) == 0);
 #ifdef SERIAL_DO_RESTART
 		if (info->flags & ASYNC_HUP_NOTIFY)
 			return -EAGAIN;
 



--===============0631512796217919==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0631512796217919==--
