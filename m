From: Leann Ogasawara <ogasawara@osdl.org>
Date: Fri, 16 Jan 2004 23:35:24 +0000
Subject: [Kernel-janitors] [PATCH] depca.c ioremap/iounmap audit
Message-Id: <1074296124.24618.113.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

Inserts missing iounmap's and release_mem_region's.  Appreciate
feedback.

Leann

diffed against 2.6.1  

=== drivers/net/depca.c 1.20 vs edited ==--- 1.20/drivers/net/depca.c	Tue Sep 16 11:40:18 2003
+++ edited/drivers/net/depca.c	Fri Jan 16 14:23:56 2004
@@ -771,6 +771,8 @@
 		status = -ENXIO;
 		if (!irqnum) {
 			printk(" and failed to detect IRQ line.\n");
+			iounmap(lp->sh_mem);
+			release_mem_region(mem_start, mem_len);
 			goto out_priv;
 		} else {
 			for (dev->irq = 0, i = 0; (depca_irq[i]) && (!dev->irq); i++)
@@ -781,6 +783,8 @@
 
 			if (!dev->irq) {
 				printk(" but incorrect IRQ line detected.\n");
+				iounmap(lp->sh_mem);
+				release_mem_region(mem_start, mem_len);
 				return -ENXIO;
 			}
 		}


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
