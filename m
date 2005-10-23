From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 03:02:49 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/epca.c: replace
Message-Id: <20051023030249.GI2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49983768951022833=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============49983768951022833==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/epca.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/epca.c mod/drivers/char/epca.c
--- 2.6.14-rc5/drivers/char/epca.c	2005-10-22 00:06:18.000000000 -0500
+++ mod/drivers/char/epca.c	2005-10-22 20:56:25.000000000 -0500
@@ -894,7 +894,8 @@ static int block_til_ready(struct tty_st
 		until it's done, and then try again.
 	-------------------------------------------------------------------- */
 	if (ch->asyncflags & ASYNC_CLOSING) {
-		interruptible_sleep_on(&ch->close_wait);
+		wait_event_interruptible(ch->close_wait,
+			(ch->asyncflags & ASYNC_CLOSING)==0);
 
 		if (ch->asyncflags & ASYNC_HUP_NOTIFY)
 			return -EAGAIN;
 



--===============49983768951022833==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49983768951022833==--
