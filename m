From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 24 Mar 2005 16:19:51 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/dstr.c
Message-Id: <20050324161951.GB1855@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="9dgjiU4MmWPVapMU"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324161716.GA1855@rhum.iomeda.fr>
In-Reply-To: <20050324161716.GA1855@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_dstr.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/dstr.c b/drivers/block/paride/dstr.c
--- a/drivers/block/paride/dstr.c	2005-03-18 02:34:27.000000000 +0100
+++ b/drivers/block/paride/dstr.c	2005-03-22 16:40:30.000000000 +0100
@@ -195,7 +195,7 @@ static void dstr_log_adapter( PIA *pi, c
 {       char    *mode_string[5] = {"4-bit","8-bit","EPP-8",
 				   "EPP-16","EPP-32"};
 
-        printk("%s: dstr %s, DataStor EP2000 at 0x%x, ",
+        printk(KERN_INFO "%s: dstr %s, DataStor EP2000 at 0x%x, ",
                 pi->device,DSTR_VERSION,pi->port);
         printk("mode %d (%s), delay %d\n",pi->mode,
 		mode_string[pi->mode],pi->delay);

--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--9dgjiU4MmWPVapMU--
