From: irwan.djajadi@iname.com
Date: Tue, 25 Oct 2005 03:34:42 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/rocket.c: replace
Message-Id: <20051025033442.GA22363@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90605978458150682=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============90605978458150682==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/rocket.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/rocket.c mod/drivers/char/rocket.c
--- 2.6.14-rc5/drivers/char/rocket.c	2005-09-16 20:02:12.000000000 -0500
+++ mod/drivers/char/rocket.c	2005-10-24 22:17:04.000000000 -0500
@@ -901,7 +901,8 @@ static int block_til_ready(struct tty_st
 	if (tty_hung_up_p(filp))
 		return ((info->flags & ROCKET_HUP_NOTIFY) ? -EAGAIN : -ERESTARTSYS);
 	if (info->flags & ROCKET_CLOSING) {
-		interruptible_sleep_on(&info->close_wait);
+		wait_event_interruptible(info->close_wait,
+			(info->flags & ROCKET_CLOSING)==0);
 		return ((info->flags & ROCKET_HUP_NOTIFY) ? -EAGAIN : -ERESTARTSYS);
 	}
 
@@ -1006,7 +1007,8 @@ static int rp_open(struct tty_struct *tt
 		return -ENOMEM;
 
 	if (info->flags & ROCKET_CLOSING) {
-		interruptible_sleep_on(&info->close_wait);
+		wait_event_interruptible(info->close_wait,
+			(info->flags & ROCKET_CLOSING)==0);
 		free_page(page);
 		return ((info->flags & ROCKET_HUP_NOTIFY) ? -EAGAIN : -ERESTARTSYS);
 	}




--===============90605978458150682==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90605978458150682==--
