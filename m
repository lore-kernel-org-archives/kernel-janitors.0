From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 24 Mar 2005 16:17:16 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/comm.c
Message-Id: <20050324161716.GA1855@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="l76fUT7nc3MelDdI"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_comm.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/comm.c b/drivers/block/paride/comm.c
--- a/drivers/block/paride/comm.c	2005-03-18 02:34:07.000000000 +0100
+++ b/drivers/block/paride/comm.c	2005-03-22 16:40:17.000000000 +0100
@@ -180,7 +180,7 @@ static void comm_log_adapter( PIA *pi, c
 
 {       char    *mode_string[5] = {"4-bit","8-bit","EPP-8","EPP-16","EPP-32"};
 
-        printk("%s: comm %s, DataStor Commuter at 0x%x, ",
+        printk(KERN_INFO "%s: comm %s, DataStor Commuter at 0x%x, ",
                 pi->device,COMM_VERSION,pi->port);
         printk("mode %d (%s), delay %d\n",pi->mode,
 		mode_string[pi->mode],pi->delay);

--l76fUT7nc3MelDdI
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--l76fUT7nc3MelDdI--
