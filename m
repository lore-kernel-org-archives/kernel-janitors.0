From: irwan.djajadi@iname.com
Date: Tue, 25 Oct 2005 03:40:26 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/specialix.c: replace
Message-Id: <20051025034026.GC22363@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98002413159989399=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============98002413159989399==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/specialix.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/specialix.c mod/drivers/char/specialix.c
--- 2.6.14-rc5/drivers/char/specialix.c	2005-09-16 20:02:12.000000000 -0500
+++ mod/drivers/char/specialix.c	2005-10-24 22:19:06.000000000 -0500
@@ -1418,7 +1418,8 @@ static int block_til_ready(struct tty_st
 	 * until it's done, and then try again.
 	 */
 	if (tty_hung_up_p(filp) || port->flags & ASYNC_CLOSING) {
-		interruptible_sleep_on(&port->close_wait);
+		wait_event_interruptible(port->close_wait,
+			(port->flags & ASYNC_CLOSING)==0);
 		if (port->flags & ASYNC_HUP_NOTIFY) {
 			func_exit();
 			return -EAGAIN;


--===============98002413159989399==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98002413159989399==--
