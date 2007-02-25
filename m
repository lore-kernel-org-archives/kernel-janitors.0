From: Douglas Schilling Landgraf <dougsland@gmail.com>
Date: Sun, 25 Feb 2007 16:45:08 +0000
Subject: [KJ] [PATCH] 3c505.c: cleanup not needed casts
Message-Id: <20070225173130.GA3595@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Removed all unnecessary casts.

Signed-off-by: Douglas Schilling Landgraf <dougsland@gmail.com>

Index: linux-2.6.20.1/drivers/net/3c505.c
=================================--- linux-2.6.20.1.orig/drivers/net/3c505.c
+++ linux-2.6.20.1/drivers/net/3c505.c
@@ -659,7 +659,7 @@ static irqreturn_t elp_interrupt(int irq
 	unsigned long timeout;
 
 	dev = dev_id;
-	adapter = (elp_device *) dev->priv;
+	adapter = dev->priv;
 
 	spin_lock(&adapter->lock);
 
@@ -1121,7 +1121,7 @@ static int elp_start_xmit(struct sk_buff
 
 static struct net_device_stats *elp_get_stats(struct net_device *dev)
 {
-	elp_device *adapter = (elp_device *) dev->priv;
+	elp_device *adapter = dev->priv;
 
 	if (elp_debug >= 3)
 		printk(KERN_DEBUG "%s: request for stats\n", dev->name);
@@ -1226,7 +1226,7 @@ static int elp_close(struct net_device *
 
 static void elp_set_mc_list(struct net_device *dev)
 {
-	elp_device *adapter = (elp_device *) dev->priv;
+	elp_device *adapter = dev->priv;
 	struct dev_mc_list *dmi = dev->mc_list;
 	int i;
 	unsigned long flags;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
