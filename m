From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:13:24 +0000
Subject: [KJ] [PATCH 28/53] imsttfb: Clean up printk()'s in
Message-Id: <20050125231320.10418.31033.74743@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============008965164183552865=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============008965164183552865==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/imsttfb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/imsttfb.c linux-2.6.11-rc2-mm1/drivers/video/imsttfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/imsttfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/imsttfb.c	2005-01-24 19:07:03.287259789 -0500
@@ -1413,7 +1413,8 @@
 
 	if ((info->var.xres * info->var.yres) * (info->var.bits_per_pixel >> 3) > info->fix.smem_len
 	    || !(compute_imstt_regvals(par, info->var.xres, info->var.yres))) {
-		printk("imsttfb: %ux%ux%u not supported\n", info->var.xres, info->var.yres, info->var.bits_per_pixel);
+		printk(KERN_ERR "imsttfb: %ux%ux%u not supported\n",
+			info->var.xres, info->var.yres, info->var.bits_per_pixel);
 		kfree(info);
 		return;
 	}
@@ -1455,7 +1456,7 @@
 	}
 
 	tmp = (read_reg_le32(par->dc_regs, SSTATUS) & 0x0f00) >> 8;
-	printk("fb%u: %s frame buffer; %uMB vram; chip version %u\n",
+	pr_info("fb%u: %s frame buffer; %uMB vram; chip version %u\n",
 		info->node, info->fix.id, info->fix.smem_len >> 20, tmp);
 }
 

--===============008965164183552865==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============008965164183552865==--
