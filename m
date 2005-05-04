From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 09:45:30 +0000
Subject: [KJ] [PATCH] drivers/block/paride/pcd.c : replace direct assignment
Message-Id: <20050504094530.GM8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="wac7ysb48OaltWcw"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_block_paride_pcd.c.patch"

diff -urpNX dontdiff a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
--- a/drivers/block/paride/pcd.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/block/paride/pcd.c	2005-04-29 09:53:18.000000000 +0200
@@ -516,7 +516,7 @@ static int pcd_tray_move(struct cdrom_de
 
 static void pcd_sleep(int cs)
 {
-	current->state = TASK_INTERRUPTIBLE;
+	set_current_state(TASK_INTERRUPTIBLE);
 	schedule_timeout(cs);
 }
 

--wac7ysb48OaltWcw
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--wac7ysb48OaltWcw--
