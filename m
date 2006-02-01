From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 01 Feb 2006 15:12:56 +0000
Subject: [KJ] [Patch 2/4] ide cleanups - Insert BUG() to __ide_set_handler()
Message-Id: <1138806777.22662.25.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92269744297579459=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92269744297579459==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch makes __ide_set_handler() BUG() if a handler
is already defined. This makes place for further cleanups.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/ide/ide-iops.c.orig	2006-02-01 15:46:50.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-iops.c	2006-02-01 15:47:27.000000000 +0100
@@ -899,6 +899,7 @@ static void __ide_set_handler (ide_drive
 		printk(KERN_CRIT "%s: ide_set_handler: handler not null; "
 			"old=%p, new=%p\n",
 			drive->name, hwgroup->handler, handler);
+			BUG();
 	}
 	hwgroup->handler	= handler;
 	hwgroup->expiry		= expiry;



--===============92269744297579459==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92269744297579459==--
