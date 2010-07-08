From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 08 Jul 2010 12:10:03 +0000
Subject: [PATCH 2/4] ll_temac: fix memory leak
Message-Id: <1278591006-3156-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, John Linn <john.linn@xilinx.com>, Grant Likely <grant.likely@secretlab.ca>, Jiri Pirko <jpirko@redhat.com>, Brian Hill <brian.hill@xilinx.com>, netdev@vger.kernel.org

If of_iomap() or irq_of_parse_and_map() fail then np must be freed.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/ll_temac_main.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ll_temac_main.c b/drivers/net/ll_temac_main.c
index 5bca20b..a2da3d7 100644
--- a/drivers/net/ll_temac_main.c
+++ b/drivers/net/ll_temac_main.c
@@ -999,19 +999,22 @@ temac_of_probe(struct of_device *op, const struct of_device_id *match)
 			dev_dbg(&op->dev, "MEM base: %p\n", lp->sdma_regs);
 		} else {
 			dev_err(&op->dev, "unable to map DMA registers\n");
+			of_node_put(np);
 			goto err_iounmap;
 		}
 	}
 
 	lp->rx_irq = irq_of_parse_and_map(np, 0);
 	lp->tx_irq = irq_of_parse_and_map(np, 1);
+
+	of_node_put(np); /* Finished with the DMA node; drop the reference */
+
 	if ((lp->rx_irq = NO_IRQ) || (lp->tx_irq = NO_IRQ)) {
 		dev_err(&op->dev, "could not determine irqs\n");
 		rc = -ENOMEM;
 		goto err_iounmap_2;
 	}
 
-	of_node_put(np); /* Finished with the DMA node; drop the reference */
 
 	/* Retrieve the MAC address */
 	addr = of_get_property(op->dev.of_node, "local-mac-address", &size);
-- 
1.7.0.4

