From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 25 Mar 2005 13:31:14 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/kbic.c
Message-Id: <20050325133114.GN14356@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Dx9iWuMxHO1cCoFc"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324161716.GA1855@rhum.iomeda.fr>
In-Reply-To: <20050324161716.GA1855@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_kbic.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/kbic.c b/drivers/block/paride/kbic.c
--- a/drivers/block/paride/kbic.c	2005-03-18 02:34:23.000000000 +0100
+++ b/drivers/block/paride/kbic.c	2005-03-22 16:44:28.000000000 +0100
@@ -232,7 +232,7 @@ static void kbic_log_adapter( PIA *pi, c
 {       char    *mode_string[6] = {"4-bit","5/3","8-bit",
 				   "EPP-8","EPP_16","EPP-32"};
 
-        printk("%s: kbic %s, KingByte %s at 0x%x, ",
+        printk(KERN_INFO "%s: kbic %s, KingByte %s at 0x%x, ",
                 pi->device,KBIC_VERSION,chip,pi->port);
         printk("mode %d (%s), delay %d\n",pi->mode,
 		mode_string[pi->mode],pi->delay);

--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Dx9iWuMxHO1cCoFc--
