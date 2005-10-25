From: irwan.djajadi@iname.com
Date: Tue, 25 Oct 2005 03:41:18 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/stallion.c: replace
Message-Id: <20051025034118.GD22363@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32436564654510947=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============32436564654510947==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/stallion.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/stallion.c mod/drivers/char/stallion.c
--- 2.6.14-rc5/drivers/char/stallion.c	2005-09-16 20:02:12.000000000 -0500
+++ mod/drivers/char/stallion.c	2005-10-24 22:19:41.000000000 -0500
@@ -1044,7 +1044,8 @@ static int stl_open(struct tty_struct *t
  *	for it is done with the same context.
  */
 	if (portp->flags & ASYNC_CLOSING) {
-		interruptible_sleep_on(&portp->close_wait);
+		wait_event_interruptible(portp->close_wait,
+			(portp->flags & ASYNC_CLOSING)==0);
 		if (portp->flags & ASYNC_HUP_NOTIFY)
 			return(-EAGAIN);
 		return(-ERESTARTSYS);


--===============32436564654510947==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32436564654510947==--
