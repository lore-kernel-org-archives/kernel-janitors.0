From: irwan.djajadi@iname.com
Date: Tue, 25 Oct 2005 03:42:11 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/synclink.c: replace
Message-Id: <20051025034211.GE22363@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68446289585286602=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============68446289585286602==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/synclink.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/synclink.c mod/drivers/char/synclink.c
--- 2.6.14-rc5/drivers/char/synclink.c	2005-10-22 00:06:18.000000000 -0500
+++ mod/drivers/char/synclink.c	2005-10-24 22:21:41.000000000 -0500
@@ -3474,8 +3474,8 @@ static int mgsl_open(struct tty_struct *
 
 	/* If port is closing, signal caller to try again */
 	if (tty_hung_up_p(filp) || info->flags & ASYNC_CLOSING){
-		if (info->flags & ASYNC_CLOSING)
-			interruptible_sleep_on(&info->close_wait);
+		wait_event_interruptible(info->close_wait,
+			(info->flags & ASYNC_CLOSING)==0);
 		retval = ((info->flags & ASYNC_HUP_NOTIFY) ?
 			-EAGAIN : -ERESTARTSYS);
 		goto cleanup;


--===============68446289585286602==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68446289585286602==--
