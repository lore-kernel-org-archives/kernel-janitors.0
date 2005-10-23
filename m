From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 02:53:51 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/block/acsi_slm.c: replace
Message-Id: <20051023025351.GC2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52296878864634411=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52296878864634411==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/block/acsi_slm.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/block/acsi_slm.c mod/drivers/block/acsi_slm.c
--- 2.6.14-rc5/drivers/block/acsi_slm.c	2005-10-22 00:06:17.000000000 -0500
+++ mod/drivers/block/acsi_slm.c	2005-10-22 15:10:39.000000000 -0500
@@ -627,7 +627,7 @@ static ssize_t slm_write( struct file *f
 
 	while( SLMState == PRINTING ||
 		   (SLMState == FILLING && SLMBufOwner != device) ) {
-		interruptible_sleep_on( &slm_wait );
+		wait_event_interruptible( slm_wait, SLMState==IDLE );
 		if (signal_pending(current))
 			return( -ERESTARTSYS );
 	}
 



--===============52296878864634411==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52296878864634411==--
