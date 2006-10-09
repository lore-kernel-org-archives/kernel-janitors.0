From: Amol Lad <amol@verismonetworks.com>
Date: Mon, 09 Oct 2006 11:45:27 +0000
Subject: [KJ] [PATCH] drivers/net/depca.c: Replacing yield with a better
Message-Id: <1160393608.19143.238.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, kernel Janitors <kernel-janitors@lists.osdl.org>

The change removes the 'manual' schedule_timeout and replaces it with
schedule_timeout_uninterruptible

Tested compile only with allmodconfig

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
 depca.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
---
--- linux-2.6.19-rc1-orig/drivers/net/depca.c	2006-10-05 14:00:47.000000000 +0530
+++ linux-2.6.19-rc1/drivers/net/depca.c	2006-10-09 16:37:13.000000000 +0530
@@ -738,7 +738,7 @@ static int __init depca_hw_init (struct 
 	   interrupts. For now we will always get a DMA error. */
 	if (dev->irq < 2) {
 		unsigned char irqnum;
-		unsigned long irq_mask, delay;
+		unsigned long irq_mask;
 
 		irq_mask = probe_irq_on();
 
@@ -767,9 +767,7 @@ static int __init depca_hw_init (struct 
 		/* Trigger an initialization just for the interrupt. */
 		outw(INEA | INIT, DEPCA_DATA);
 
-		delay = jiffies + HZ/50;
-		while (time_before(jiffies, delay))
-			yield();
+		schedule_timeout_uninterruptible(jiffies + HZ/50);
 
 		irqnum = probe_irq_off(irq_mask);
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
