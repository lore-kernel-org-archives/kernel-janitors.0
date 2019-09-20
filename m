From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 20 Sep 2019 11:30:35 +0000
Subject: [PATCH v2] ethernet: axienet: Use devm_platform_ioremap_resource() in axienet_probe()
Message-Id: <604a6376-0298-ebcd-ee84-435945370374@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <af65355e-c2f8-9142-4d0b-6903f23a98b2@web.de>
 <CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com>
In-Reply-To: <CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Michal Simek <michals@xilinx.com>, Radhey Shyam Pandey <radheys@xilinx.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Sep 2019 13:17:01 +0200

Simplify this function implementation by using the wrapper function
“devm_platform_ioremap_resource” instead of calling the functions
“platform_get_resource” and “devm_ioremap_resource” directly.

* Thus reduce also a bit of exception handling code here.
* Delete the local variable “res”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Further changes were requested by Radhey Shyam Pandey.
https://lore.kernel.org/r/CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com/

* Updates for three modules were split into a separate patch for each driver.
* The commit description was adjusted.


 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 4fc627fb4d11..92783aaaa0a2 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1787,14 +1787,7 @@ static int axienet_probe(struct platform_device *pdev)
 		of_node_put(np);
 		lp->eth_irq = platform_get_irq(pdev, 0);
 	} else {
-		/* Check for these resources directly on the Ethernet node. */
-		struct resource *res = platform_get_resource(pdev,
-							     IORESOURCE_MEM, 1);
-		if (!res) {
-			dev_err(&pdev->dev, "unable to get DMA memory resource\n");
-			goto free_netdev;
-		}
-		lp->dma_regs = devm_ioremap_resource(&pdev->dev, res);
+		lp->dma_regs = devm_platform_ioremap_resource(pdev, 1);
 		lp->rx_irq = platform_get_irq(pdev, 1);
 		lp->tx_irq = platform_get_irq(pdev, 0);
 		lp->eth_irq = platform_get_irq(pdev, 2);
--
2.23.0
