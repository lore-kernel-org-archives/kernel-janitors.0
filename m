From: Leann Ogasawara <ogasawara@osdl.org>
Date: Fri, 16 Jan 2004 23:46:33 +0000
Subject: [Kernel-janitors] [PATCH] dgrs.c ioremap/iounmap audit
Message-Id: <1074296792.12959.126.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

Insert missing iounmap's.  You know the drill, feedback wanted.

diffed against 2.6.1

Leann

=== drivers/net/dgrs.c 1.22 vs edited ==--- 1.22/drivers/net/dgrs.c	Tue Sep  9 14:57:21 2003
+++ edited/drivers/net/dgrs.c	Fri Jan 16 14:40:16 2004
@@ -322,8 +322,10 @@
 	 */
 	priv0->vplxdma[PLX_DMA0_MODE/4] = 0xFFFFFFFF;
 	x = priv0->vplxdma[PLX_DMA0_MODE/4];
-	if (x != 0x00001FFF)
+	if (x != 0x00001FFF) {
+		iounmap(priv0->vplxdma);
 		return (0);
+	}
 
 	return (1);
 }
@@ -1015,6 +1017,8 @@
 		if (!is)
 		{
 			printk("%s: Illegal IRQ %d\n", dev0->name, dev0->irq);
+			iounmap(priv0->vmem);
+			priv0->vmem = NULL;
 			return -ENXIO;
 		}
 		OUTB(dev0->base_addr + ES4H_AS_31_24,
@@ -1096,6 +1100,8 @@
 	if (priv0->bcomm->bc_status < BC_RUN)
 	{
 		printk("%s: board not operating\n", dev0->name);
+		iounmap(priv0->vmem);
+		priv0->vmem = NULL;
 		return -ENXIO;
 	}
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
