From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Mon, 11 Apr 2005 19:05:03 +0000
Subject: [KJ] [PATCH] drivers/net/arm/etherh.c : Use of time_after() macro
Message-Id: <425ACA5F.7060100@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use of time_after() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

-- 

Marcelo Feitoza Parisi            
marcelo at feitoza.com.br
http://marcelo.feitoza.com.br/



Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/arm/etherh.c	2005-03-02 04:38:25.000000000 -0300
+++ development/drivers/net/arm/etherh.c	2005-04-09 22:10:36.000000000 -0300
@@ -46,6 +46,7 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/system.h>
 #include <asm/ecard.h>
@@ -356,7 +357,7 @@ etherh_block_output (struct net_device *
 	dma_start = jiffies;
 
 	while ((readb (addr + EN0_ISR) & ENISR_RDC) = 0)
-		if (jiffies - dma_start > 2*HZ/100) { /* 20ms */
+		if (time_after(jiffies, dma_start + 2*HZ/100)) { /* 20ms */
 			printk(KERN_ERR "%s: timeout waiting for TX RDC\n",
 				dev->name);
 			etherh_reset (dev);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
