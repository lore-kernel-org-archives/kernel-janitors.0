From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Mar 2010 12:11:45 +0000
Subject: [patch] korina: use resource_size()
Message-Id: <20100322121145.GK21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Phil Sutter <n0-1@freewrt.org>, Jiri Pirko <jpirko@redhat.com>, Stephen Hemminger <shemminger@vyatta.com>, Joe Perches <joe@perches.com>

This size calculation is wrong.  It should be end - start + 1.
Use resource_size() to calculate it correctly.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I don't have a way to test this, or even to compile it.  :/

diff --git a/drivers/net/korina.c b/drivers/net/korina.c
index 300c224..edaedc7 100644
--- a/drivers/net/korina.c
+++ b/drivers/net/korina.c
@@ -1135,7 +1135,7 @@ static int korina_probe(struct platform_device *pdev)
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "korina_regs");
 	dev->base_addr = r->start;
-	lp->eth_regs = ioremap_nocache(r->start, r->end - r->start);
+	lp->eth_regs = ioremap_nocache(r->start, resource_size(r));
 	if (!lp->eth_regs) {
 		printk(KERN_ERR DRV_NAME ": cannot remap registers\n");
 		rc = -ENXIO;
@@ -1143,7 +1143,7 @@ static int korina_probe(struct platform_device *pdev)
 	}
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "korina_dma_rx");
-	lp->rx_dma_regs = ioremap_nocache(r->start, r->end - r->start);
+	lp->rx_dma_regs = ioremap_nocache(r->start, resource_size(r));
 	if (!lp->rx_dma_regs) {
 		printk(KERN_ERR DRV_NAME ": cannot remap Rx DMA registers\n");
 		rc = -ENXIO;
@@ -1151,7 +1151,7 @@ static int korina_probe(struct platform_device *pdev)
 	}
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "korina_dma_tx");
-	lp->tx_dma_regs = ioremap_nocache(r->start, r->end - r->start);
+	lp->tx_dma_regs = ioremap_nocache(r->start, resource_size(r));
 	if (!lp->tx_dma_regs) {
 		printk(KERN_ERR DRV_NAME ": cannot remap Tx DMA registers\n");
 		rc = -ENXIO;
