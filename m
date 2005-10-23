From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 03:06:22 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/isicom.c: replace
Message-Id: <20051023030622.GL2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4827149775380577=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============4827149775380577==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/isicom.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/isicom.c mod/drivers/char/isicom.c
--- 2.6.14-rc5/drivers/char/isicom.c	2005-09-16 20:02:12.000000000 -0500
+++ mod/drivers/char/isicom.c	2005-10-22 16:00:09.000000000 -0500
@@ -1137,7 +1137,8 @@ static int block_til_ready(struct tty_st
 #ifdef ISICOM_DEBUG	
 		printk(KERN_DEBUG "ISICOM: block_til_ready: close in progress.\n");
 #endif		
-		interruptible_sleep_on(&port->close_wait);
+		wait_event_interruptible(port->close_wait,
+			(port->flags & ASYNC_CLOSING)==0);
 		if (port->flags & ASYNC_HUP_NOTIFY)
 			return -EAGAIN;
 		else
 



--===============4827149775380577==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4827149775380577==--
