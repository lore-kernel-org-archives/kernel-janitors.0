From: irwan.djajadi@iname.com
Date: Tue, 25 Oct 2005 03:39:13 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/char/serial167.c: replace
Message-Id: <20051025033913.GB22363@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68828834132246519=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023030021.GG2438@poopie.dyndns.org>
In-Reply-To: <20051023030021.GG2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============68828834132246519==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/char/serial167.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/char/serial167.c mod/drivers/char/serial167.c
--- 2.6.14-rc5/drivers/char/serial167.c	2005-09-16 20:02:12.000000000 -0500
+++ mod/drivers/char/serial167.c	2005-10-24 22:18:21.000000000 -0500
@@ -1867,7 +1867,8 @@ block_til_ready(struct tty_struct *tty, 
      * until it's done, and then try again.
      */
     if (info->flags & ASYNC_CLOSING) {
-	interruptible_sleep_on(&info->close_wait);
+	wait_event_interruptible(info->close_wait,
+		(info->flags & ASYNC_CLOSING)==0);
 	if (info->flags & ASYNC_HUP_NOTIFY){
 	    return -EAGAIN;
 	}else{


--===============68828834132246519==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68828834132246519==--
