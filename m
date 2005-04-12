From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Tue, 12 Apr 2005 17:37:14 +0000
Subject: [KJ] [PATCH] drivers/net/ne-h8300.c : Use of time_after() macro
Message-Id: <425C074A.10100@feitoza.com.br>
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

--- linux/drivers/net/ne-h8300.c	2005-03-02 04:37:54.000000000 -0300
+++ development/drivers/net/ne-h8300.c	2005-04-09 18:00:59.000000000 -0300
@@ -27,6 +27,7 @@ static const char version1[]  #include <linux/delay.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
+#include <linux/jiffies.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -365,7 +366,7 @@ static void ne_reset_8390(struct net_dev
 
 	/* This check _should_not_ be necessary, omit eventually. */
 	while ((inb_p(NE_BASE+EN0_ISR) & ENISR_RESET) = 0)
-		if (jiffies - reset_start_time > 2*HZ/100) {
+		if (time_after(jiffies, reset_start_time + 2*HZ/100)) {
 			printk(KERN_WARNING "%s: ne_reset_8390() did not complete.\n", dev->name);
 			break;
 		}
@@ -580,7 +581,7 @@ retry:
 #endif
 
 	while ((inb_p(NE_BASE + EN0_ISR) & ENISR_RDC) = 0)
-		if (jiffies - dma_start > 2*HZ/100) {		/* 20ms */
+		if (time_after(jiffies, dma_start + 2*HZ/100)) {		/* 20ms */
 			printk(KERN_WARNING "%s: timeout waiting for Tx RDC.\n", dev->name);
 			ne_reset_8390(dev);
 			NS8390_init(dev,1);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
