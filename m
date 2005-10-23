From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 03:01:43 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/cyclades.c: replace
Message-Id: <20051023030143.GH2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84555372956786501=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============84555372956786501==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/cyclades.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/cyclades.c mod/drivers/char/cyclades.c
--- 2.6.14-rc5/drivers/char/cyclades.c	2005-10-22 00:06:17.000000000 -0500
+++ mod/drivers/char/cyclades.c	2005-10-22 20:55:43.000000000 -0500
@@ -2326,9 +2326,8 @@ block_til_ready(struct tty_struct *tty, 
      * until it's done, and then try again.
      */
     if (tty_hung_up_p(filp) || (info->flags & ASYNC_CLOSING)) {
-	if (info->flags & ASYNC_CLOSING) {
-            interruptible_sleep_on(&info->close_wait);
-	}
+	wait_event_interruptible(info->close_wait,
+		(info->flags & ASYNC_CLOSING)==0);
         return ((info->flags & ASYNC_HUP_NOTIFY) ? -EAGAIN : -ERESTARTSYS);
     }
 
@@ -2595,8 +2594,8 @@ cy_open(struct tty_struct *tty, struct f
      * If the port is the middle of closing, bail out now
      */
     if (tty_hung_up_p(filp) || (info->flags & ASYNC_CLOSING)) {
-	if (info->flags & ASYNC_CLOSING)
-	    interruptible_sleep_on(&info->close_wait);
+	wait_event_interruptible(info->close_wait,
+		(info->flags & ASYNC_CLOSING)==0);
 	return ((info->flags & ASYNC_HUP_NOTIFY) ? -EAGAIN : -ERESTARTSYS);
     }
 
 



--===============84555372956786501==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84555372956786501==--
