From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 19 Dec 2016 05:33:51 +0000
Subject: [PATCH] dmaengine: ti-dma-crossbar: Add some 'of_node_put()' in error path.
Message-Id: <20161219053351.21156-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vinod.koul@intel.com, dan.j.williams@intel.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Add some missing 'of_node_put()' in early exit error path.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/dma/ti-dma-crossbar.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/ti-dma-crossbar.c b/drivers/dma/ti-dma-crossbar.c
index 3f24aeb48c0e..2403475a37cf 100644
--- a/drivers/dma/ti-dma-crossbar.c
+++ b/drivers/dma/ti-dma-crossbar.c
@@ -149,6 +149,7 @@ static int ti_am335x_xbar_probe(struct platform_device *pdev)
 	match = of_match_node(ti_am335x_master_match, dma_node);
 	if (!match) {
 		dev_err(&pdev->dev, "DMA master is not supported\n");
+		of_node_put(dma_node);
 		return -EINVAL;
 	}
 
@@ -339,6 +340,7 @@ static int ti_dra7_xbar_probe(struct platform_device *pdev)
 	match = of_match_node(ti_dra7_master_match, dma_node);
 	if (!match) {
 		dev_err(&pdev->dev, "DMA master is not supported\n");
+		of_node_put(dma_node);
 		return -EINVAL;
 	}
 
-- 
2.9.3

