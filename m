From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:16:04 +0000
Subject: [KJ] [PATCH 52/53] w100fb: Clean up printk()'s in
Message-Id: <20050125231603.10418.91729.17584@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============073135562868116288=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============073135562868116288==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/w100fb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/w100fb.c linux-2.6.11-rc2-mm1/drivers/video/w100fb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/w100fb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/w100fb.c	2005-01-24 19:07:04.383256232 -0500
@@ -143,7 +143,7 @@
 	unsigned long regs;
 	regs = simple_strtoul(buf, NULL, 16);
 	param = readl(remapped_regs + regs);
-	printk("Read Register 0x%08lX: 0x%08lX\n", regs, param);
+	printk(KERN_DEBUG "Read Register 0x%08lX: 0x%08lX\n", regs, param);
 	return count;
 }
 
@@ -156,7 +156,7 @@
 	sscanf(buf, "%lx %lx", &regs, &param);
 
 	if (regs <= 0x2000) {
-		printk("Write Register 0x%08lX: 0x%08lX\n", regs, param);
+		printk(KERN_DEBUG "Write Register 0x%08lX: 0x%08lX\n", regs, param);
 		writel(param, remapped_regs + regs);
 	}
 
@@ -183,11 +183,11 @@
 	param = simple_strtoul(buf, NULL, 10);
 
 	if (param == 75) {
-		printk("Set fastsysclk %d\n", param);
+		printk(KERN_DEBUG "Set fastsysclk %d\n", param);
 		par->fastsysclk_mode = param;
 		w100_set_fastsysclk(par->fastsysclk_mode);
 	} else if (param == 100) {
-		printk("Set fastsysclk %d\n", param);
+		printk(KERN_DEBUG "Set fastsysclk %d\n", param);
 		par->fastsysclk_mode = param;
 		w100_set_fastsysclk(par->fastsysclk_mode);
 	}

--===============073135562868116288==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============073135562868116288==--
