From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 22 Mar 2005 16:12:31 +0000
Subject: [KJ] [PATCH] printk: drivers/acorn/block/fd1772.c
Message-Id: <20050322161231.GO14887@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jy6Sn24JjFx/iggw"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_acorn_block_fd1772.c.diff"

diff -urpN -X dontdiff a/drivers/acorn/block/fd1772.c b/drivers/acorn/block/fd1772.c
--- a/drivers/acorn/block/fd1772.c	2005-03-18 02:34:09.000000000 +0100
+++ b/drivers/acorn/block/fd1772.c	2005-03-22 16:28:53.000000000 +0100
@@ -410,7 +410,7 @@ static void fd_select_side(int side)
 static void fd_select_drive(int drive)
 {
 #ifdef DEBUG
-	printk("fd_select_drive:%d\n", drive);
+	printk(KERN_DEBUG "fd_select_drive:%d\n", drive);
 #endif
 	/* Hmm - nowhere do we seem to turn the motor on - I'm going to do it here! */
 	oldlatch_aupdate(LATCHA_MOTOR | LATCHA_INUSE, 0);
@@ -594,7 +594,7 @@ static void floppy_irqconsequencehandler
 
 static void fd_error(void)
 {
-	printk("FDC1772: fd_error\n");
+	printk(KERN_INFO "FDC1772: fd_error\n");
 	/*panic("fd1772: fd_error"); *//* DAG tmp */
 	if (!CURRENT)
 		return;

--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--jy6Sn24JjFx/iggw--
