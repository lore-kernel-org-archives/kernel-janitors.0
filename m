From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 24 Jun 2005 10:45:40 +0000
Subject: [KJ] [PATCH] time_after : drivers/net/apne.c
Message-Id: <20050624104540.GG5023@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78096095658141773=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78096095658141773==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Replace if(jiffies - a>x) by if(time_after(jiffies,a+x))

Long description:
Some drivers do:
if ((jiffies - data->last_updated > HZ * 2) ||
    (jiffies < data->last_updated))

Should be:

#include <linux/jiffies.h>
if (time_after(jiffies, data->last_updated + HZ * 2))

Have a patch for drivers/i2c/chips/*.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


				    
diff -urpN -X dontdiff 2.6.12-orig/drivers/net/apne.c 2.6.12/drivers/net/apne.c
--- 2.6.12-orig/drivers/net/apne.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/net/apne.c	2005-06-24 12:27:56.447191048 +0200
@@ -36,6 +36,7 @@
 #include <linux/delay.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
+#include <linux/jiffies.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -216,7 +217,7 @@ static int __init apne_probe1(struct net
 	outb(inb(ioaddr + NE_RESET), ioaddr + NE_RESET);
 
 	while ((inb(ioaddr + NE_EN0_ISR) & ENISR_RESET) == 0)
-		if (jiffies - reset_start_time > 2*HZ/100) {
+		if (time_after(jiffies, reset_start_time + 2*HZ/100)) {
 			printk(" not found (no reset ack).\n");
 			return -ENODEV;
 		}
@@ -382,7 +383,7 @@ apne_reset_8390(struct net_device *dev)
 
     /* This check _should_not_ be necessary, omit eventually. */
     while ((inb(NE_BASE+NE_EN0_ISR) & ENISR_RESET) == 0)
-	if (jiffies - reset_start_time > 2*HZ/100) {
+    	if (time_after(jiffies, reset_start_time + 2*HZ/100)) {
 	    printk("%s: ne_reset_8390() did not complete.\n", dev->name);
 	    break;
 	}
@@ -530,7 +531,7 @@ apne_block_output(struct net_device *dev
     dma_start = jiffies;
 
     while ((inb(NE_BASE + NE_EN0_ISR) & ENISR_RDC) == 0)
-	if (jiffies - dma_start > 2*HZ/100) {		/* 20ms */
+    	if (time_after(jiffies, dma_start + 2*HZ/100)) { /* 20ms */
 		printk("%s: timeout waiting for Tx RDC.\n", dev->name);
 		apne_reset_8390(dev);
 		NS8390_init(dev,1);

--===============78096095658141773==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78096095658141773==--
