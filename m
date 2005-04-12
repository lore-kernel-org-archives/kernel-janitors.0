From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Tue, 12 Apr 2005 15:27:49 +0000
Subject: [KJ] [PATCH] drivers/net/apne.c : Use of time_after() macro
Message-Id: <425BE8F5.6070204@feitoza.com.br>
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

--- linux/drivers/net/apne.c	2005-03-02 04:38:33.000000000 -0300
+++ development/drivers/net/apne.c	2005-04-09 22:24:05.000000000 -0300
@@ -36,6 +36,7 @@
 #include <linux/delay.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
+#include <linux/jiffies.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -216,7 +217,7 @@ static int __init apne_probe1(struct net
 	outb(inb(ioaddr + NE_RESET), ioaddr + NE_RESET);
 
 	while ((inb(ioaddr + NE_EN0_ISR) & ENISR_RESET) = 0)
-		if (jiffies - reset_start_time > 2*HZ/100) {
+		if (time_after(jiffies, reset_start_time + 2*HZ/100)) {
 			printk(" not found (no reset ack).\n");
 			return -ENODEV;
 		}
@@ -382,7 +383,7 @@ apne_reset_8390(struct net_device *dev)
 
     /* This check _should_not_ be necessary, omit eventually. */
     while ((inb(NE_BASE+NE_EN0_ISR) & ENISR_RESET) = 0)
-	if (jiffies - reset_start_time > 2*HZ/100) {
+	if (time_after(jiffies, reset_start_time + 2*HZ/100)) {
 	    printk("%s: ne_reset_8390() did not complete.\n", dev->name);
 	    break;
 	}
@@ -530,7 +531,7 @@ apne_block_output(struct net_device *dev
     dma_start = jiffies;
 
     while ((inb(NE_BASE + NE_EN0_ISR) & ENISR_RDC) = 0)
-	if (jiffies - dma_start > 2*HZ/100) {		/* 20ms */
+	if (time_after(jiffies, dma_start + 2*HZ/100)) {	/* 20ms */
 		printk("%s: timeout waiting for Tx RDC.\n", dev->name);
 		apne_reset_8390(dev);
 		NS8390_init(dev,1);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
