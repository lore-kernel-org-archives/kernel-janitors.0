From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:32:38 +0000
Subject: [KJ] [PATCH 27/34] net/lanstreamer: replace
Message-Id: <20050126003238.GS12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16008801212183665=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============16008801212183665==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible_timeout() instead of the
deprecated interruptible_sleep_on_timeout(). Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/net/tokenring/lanstreamer.c	2005-01-25 16:30:39.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/net/tokenring/lanstreamer.c	2005-01-25 16:31:12.000000000 -0800
@@ -121,6 +121,7 @@
 #include <linux/spinlock.h>
 #include <linux/version.h>
 #include <linux/bitops.h>
+#include <linux/wait.h>
 
 #include <net/checksum.h>
 
@@ -669,18 +670,16 @@ static int streamer_open(struct net_devi
 		writew(LISR_SRB_CMD, streamer_mmio + LISR_SUM);
 		spin_unlock_irqrestore(&streamer_priv->streamer_lock, flags);
 
-		while (streamer_priv->srb_queued) {
-			interruptible_sleep_on_timeout(&streamer_priv->srb_wait, 5 * HZ);
-			if (signal_pending(current)) {
-				printk(KERN_WARNING "%s: SRB timed out.\n", dev->name);
-				printk(KERN_WARNING "SISR=%x MISR=%x, LISR=%x\n",
-				       readw(streamer_mmio + SISR),
-				       readw(streamer_mmio + MISR_RUM),
-				       readw(streamer_mmio + LISR));
-				streamer_priv->srb_queued = 0;
-				break;
-			}
-		}
+		wait_event_interruptible_timeout(streamer_priv->srb_wait,
+				!streamer_priv->srb_queued, 5 * HZ);
+		if (signal_pending(current)) {
+			printk(KERN_WARNING "%s: SRB timed out.\n", dev->name);
+			printk(KERN_WARNING "SISR=%x MISR=%x, LISR=%x\n",
+			       readw(streamer_mmio + SISR),
+			       readw(streamer_mmio + MISR_RUM),
+			       readw(streamer_mmio + LISR));
+			streamer_priv->srb_queued = 0;
+		}		
 
 #if STREAMER_DEBUG
 		printk("SISR_MASK: %x\n", readw(streamer_mmio + SISR_MASK));
@@ -1223,20 +1222,15 @@ static int streamer_close(struct net_dev
 
 	spin_unlock_irqrestore(&streamer_priv->streamer_lock, flags);
 
-	while (streamer_priv->srb_queued) 
-	{
-		interruptible_sleep_on_timeout(&streamer_priv->srb_wait,
-					       jiffies + 60 * HZ);
-		if (signal_pending(current)) 
-		{
-			printk(KERN_WARNING "%s: SRB timed out.\n", dev->name);
-			printk(KERN_WARNING "SISR=%x MISR=%x LISR=%x\n",
-			       readw(streamer_mmio + SISR),
-			       readw(streamer_mmio + MISR_RUM),
-			       readw(streamer_mmio + LISR));
-			streamer_priv->srb_queued = 0;
-			break;
-		}
+	wait_event_interruptible_timeout(streamer_priv->srb_wait,
+			!streamer_priv->srb_queued, 60*HZ);
+	if (signal_pending(current)) { 
+		printk(KERN_WARNING "%s: SRB timed out.\n", dev->name);
+		printk(KERN_WARNING "SISR=%x MISR=%x LISR=%x\n",
+		       readw(streamer_mmio + SISR),
+		       readw(streamer_mmio + MISR_RUM),
+		       readw(streamer_mmio + LISR));
+		streamer_priv->srb_queued = 0;
 	}
 
 	streamer_priv->rx_ring_last_received = (streamer_priv->rx_ring_last_received + 1) & (STREAMER_RX_RING_SIZE - 1);

--===============16008801212183665==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16008801212183665==--
