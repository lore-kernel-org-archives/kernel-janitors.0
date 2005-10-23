From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 03:07:13 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/istallion.c: replace
Message-Id: <20051023030713.GM2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15297352553616506=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============15297352553616506==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/istallion.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/istallion.c mod/drivers/char/istallion.c
--- 2.6.14-rc5/drivers/char/istallion.c	2005-10-22 00:06:18.000000000 -0500
+++ mod/drivers/char/istallion.c	2005-10-22 16:07:21.000000000 -0500
@@ -1052,7 +1052,8 @@ static int stli_open(struct tty_struct *
  *	for it is done with the same context.
  */
 	if (portp->flags & ASYNC_CLOSING) {
-		interruptible_sleep_on(&portp->close_wait);
+		wait_event_interruptible(portp->close_wait,
+			(portp->flags & ASYNC_CLOSING) == 0);
 		if (portp->flags & ASYNC_HUP_NOTIFY)
 			return(-EAGAIN);
 		return(-ERESTARTSYS);
@@ -1092,7 +1093,8 @@ static int stli_open(struct tty_struct *
  *	for it is done with the same context.
  */
 	if (portp->flags & ASYNC_CLOSING) {
-		interruptible_sleep_on(&portp->close_wait);
+		wait_event_interruptible(portp->close_wait,
+			(portp->flags & ASYNC_CLOSING) == 0);
 		if (portp->flags & ASYNC_HUP_NOTIFY)
 			return(-EAGAIN);
 		return(-ERESTARTSYS);
 



--===============15297352553616506==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15297352553616506==--
