From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sun, 10 Apr 2005 01:28:13 +0000
Subject: [KJ] [PATCH] drivers/net/zorro8390.c : Use of time_after() macro
Message-Id: <4258812D.2030009@feitoza.com.br>
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

--- linux/drivers/net/zorro8390.c	2005-03-02 04:38:11.000000000 -0300
+++ development/drivers/net/zorro8390.c	2005-04-09 22:21:18.000000000 -0300
@@ -27,6 +27,7 @@
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/zorro.h>
+#include <linux/jiffies.h>
 
 #include <asm/system.h>
 #include <asm/irq.h>
@@ -151,7 +152,7 @@ static int __devinit zorro8390_init(stru
 	z_writeb(z_readb(ioaddr + NE_RESET), ioaddr + NE_RESET);
 
 	while ((z_readb(ioaddr + NE_EN0_ISR) & ENISR_RESET) = 0)
-	    if (jiffies - reset_start_time > 2*HZ/100) {
+	    if (time_after(jiffies, reset_start_time + 2*HZ/100)) {
 		printk(KERN_WARNING " not found (no reset ack).\n");
 		return -ENODEV;
 	    }
@@ -273,7 +274,7 @@ static void zorro8390_reset_8390(struct 
 
     /* This check _should_not_ be necessary, omit eventually. */
     while ((z_readb(NE_BASE+NE_EN0_ISR) & ENISR_RESET) = 0)
-	if (jiffies - reset_start_time > 2*HZ/100) {
+	if (time_after(jiffies, reset_start_time + 2*HZ/100)) {
 	    printk(KERN_WARNING "%s: ne_reset_8390() did not complete.\n",
 		   dev->name);
 	    break;
@@ -400,7 +401,7 @@ static void zorro8390_block_output(struc
     dma_start = jiffies;
 
     while ((z_readb(NE_BASE + NE_EN0_ISR) & ENISR_RDC) = 0)
-	if (jiffies - dma_start > 2*HZ/100) {		/* 20ms */
+	if (time_after(jiffies, dma_start + 2*HZ/100)) {	/* 20ms */
 		printk(KERN_ERR "%s: timeout waiting for Tx RDC.\n",
 		       dev->name);
 		zorro8390_reset_8390(dev);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
