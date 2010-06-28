From: Dan Carpenter <error27@gmail.com>
Date: Mon, 28 Jun 2010 21:19:33 +0000
Subject: [patch] cpmac: use resource_size()
Message-Id: <20100628211933.GL19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <florian@openwrt.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code is off by one because we should start counting at
zero.  So the size of the resource is end - start + 1.  I switched it to
use resource_size() to do the calculation.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I don't have a cross compile environment, so I can't even compile test
this.  Sorry.

diff --git a/drivers/net/cpmac.c b/drivers/net/cpmac.c
index 23786ee..38de1a4 100644
--- a/drivers/net/cpmac.c
+++ b/drivers/net/cpmac.c
@@ -964,7 +964,7 @@ static int cpmac_open(struct net_device *dev)
 	struct sk_buff *skb;
 
 	mem = platform_get_resource_byname(priv->pdev, IORESOURCE_MEM, "regs");
-	if (!request_mem_region(mem->start, mem->end - mem->start, dev->name)) {
+	if (!request_mem_region(mem->start, resource_size(mem), dev->name)) {
 		if (netif_msg_drv(priv))
 			printk(KERN_ERR "%s: failed to request registers\n",
 			       dev->name);
@@ -972,7 +972,7 @@ static int cpmac_open(struct net_device *dev)
 		goto fail_reserve;
 	}
 
-	priv->regs = ioremap(mem->start, mem->end - mem->start);
+	priv->regs = ioremap(mem->start, resource_size(mem));
 	if (!priv->regs) {
 		if (netif_msg_drv(priv))
 			printk(KERN_ERR "%s: failed to remap registers\n",
@@ -1049,7 +1049,7 @@ fail_alloc:
 	iounmap(priv->regs);
 
 fail_remap:
-	release_mem_region(mem->start, mem->end - mem->start);
+	release_mem_region(mem->start, resource_size(mem));
 
 fail_reserve:
 	return res;
@@ -1077,7 +1077,7 @@ static int cpmac_stop(struct net_device *dev)
 	free_irq(dev->irq, dev);
 	iounmap(priv->regs);
 	mem = platform_get_resource_byname(priv->pdev, IORESOURCE_MEM, "regs");
-	release_mem_region(mem->start, mem->end - mem->start);
+	release_mem_region(mem->start, resource_size(mem));
 	priv->rx_head = &priv->desc_ring[CPMAC_QUEUES];
 	for (i = 0; i < priv->ring_size; i++) {
 		if (priv->rx_head[i].skb) {
