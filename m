From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:12:03 +0000
Subject: [KJ] [PATCH 23/53] ffb: Clean up printk()'s in drivers/video/ffb.c
Message-Id: <20050125231159.10418.88211.81463@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24237074911545409=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24237074911545409==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/ffb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/ffb.c linux-2.6.11-rc2-mm1/drivers/video/ffb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/ffb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/ffb.c	2005-01-24 19:07:03.111260360 -0500
@@ -934,12 +934,12 @@
 	struct all_info *all;
 
 	if (prom_getproperty(node, "reg", (void *) regs, sizeof(regs)) <= 0) {
-		printk("ffb: Cannot get reg device node property.\n");
+		printk(KERN_ERR "ffb: Cannot get reg device node property.\n");
 		return;
 	}
 
 	if (ffb_apply_upa_parent_ranges(parent, &regs[0])) {
-		printk("ffb: Cannot apply parent ranges to regs.\n");
+		printk(KERN_ERR "ffb: Cannot apply parent ranges to regs.\n");
 		return;
 	}
 
@@ -1026,7 +1026,7 @@
 
 	list_add(&all->list, &ffb_list);
 
-	printk("ffb: %s at %016lx type %d DAC %d\n",
+	pr_info("ffb: %s at %016lx type %d DAC %d\n",
 	       ((all->par.flags & FFB_FLAG_AFB) ? "AFB" : "FFB"),
 	       regs[0].phys_addr, all->par.board_type, all->par.dac_rev);
 }

--===============24237074911545409==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24237074911545409==--
