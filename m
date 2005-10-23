From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 03:10:06 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/riscom8.c: replace
Message-Id: <20051023031006.GP2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1985670955895833=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============1985670955895833==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/riscom8.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/riscom8.c mod/drivers/char/riscom8.c
--- 2.6.14-rc5/drivers/char/riscom8.c	2005-09-16 20:02:12.000000000 -0500
+++ mod/drivers/char/riscom8.c	2005-10-22 16:12:49.000000000 -0500
@@ -955,7 +955,8 @@ static int block_til_ready(struct tty_st
 	 * until it's done, and then try again.
 	 */
 	if (tty_hung_up_p(filp) || port->flags & ASYNC_CLOSING) {
-		interruptible_sleep_on(&port->close_wait);
+		wait_event_interruptible(port->close_wait,
+			(port->flags & ASYNC_CLOSING)==0);
 		if (port->flags & ASYNC_HUP_NOTIFY)
 			return -EAGAIN;
 		else


--===============1985670955895833==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1985670955895833==--
