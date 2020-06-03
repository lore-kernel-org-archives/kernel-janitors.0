From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jun 2020 17:52:07 +0000
Subject: [PATCH] PCI: uniphier: Fix some error handling in uniphier_pcie_ep_probe()
Message-Id: <20200603175207.GB18931@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

This code is checking the wrong variable.  It should be checking
"clk_gio" instead of "clk".  The "priv->clk" pointer is NULL at this
point so the condition is false.

Fixes: 006564dee8253 ("PCI: uniphier: Add Socionext UniPhier Pro5 PCIe endpoint controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index 0f36aa33d2e50..1483559600610 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -324,8 +324,8 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->base);
 
 	priv->clk_gio = devm_clk_get(dev, "gio");
-	if (IS_ERR(priv->clk))
-		return PTR_ERR(priv->clk);
+	if (IS_ERR(priv->clk_gio))
+		return PTR_ERR(priv->clk_gio);
 
 	priv->rst_gio = devm_reset_control_get_shared(dev, "gio");
 	if (IS_ERR(priv->rst_gio))
-- 
2.26.2
