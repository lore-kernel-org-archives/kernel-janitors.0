From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 03:08:01 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/moxa.c: replace
Message-Id: <20051023030801.GN2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65938513872620907=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============65938513872620907==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/moxa.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/moxa.c mod/drivers/char/moxa.c
--- 2.6.14-rc5/drivers/char/moxa.c	2005-10-22 00:06:18.000000000 -0500
+++ mod/drivers/char/moxa.c	2005-10-22 20:58:31.000000000 -0500
@@ -1002,8 +1002,8 @@ static int block_till_ready(struct tty_s
 	 * until it's done, and then try again.
 	 */
 	if (tty_hung_up_p(filp) || (ch->asyncflags & ASYNC_CLOSING)) {
-		if (ch->asyncflags & ASYNC_CLOSING)
-			interruptible_sleep_on(&ch->close_wait);
+		wait_event_interruptible(ch->close_wait,
+			(ch->asyncflags & ASYNC_CLOSING)==0);
 #ifdef SERIAL_DO_RESTART
 		if (ch->asyncflags & ASYNC_HUP_NOTIFY)
 			return (-EAGAIN);
 



--===============65938513872620907==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65938513872620907==--
