From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 22 Aug 2019 02:03:52 +0000
Subject: [PATCH -next] PCI: tegra: Fix the error return code in tegra_pcie_dw_probe()
Message-Id: <20190822020352.35412-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix the error return code in tegra_pcie_dw_probe() by using error code
instead of PTR_ERR(NULL) which is always 0.

Fixes: 6404441c8e13 ("PCI: tegra: Add Tegra194 PCIe support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index fc0dbeb31d78..678a6b51c7aa 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1384,7 +1384,7 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 						      "appl");
 	if (!pcie->appl_res) {
 		dev_err(dev, "Failed to find \"appl\" region\n");
-		return PTR_ERR(pcie->appl_res);
+		return -ENODEV;
 	}
 
 	pcie->appl_base = devm_ioremap_resource(dev, pcie->appl_res);
@@ -1400,7 +1400,7 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 
 	phys = devm_kcalloc(dev, pcie->phy_count, sizeof(*phys), GFP_KERNEL);
 	if (!phys)
-		return PTR_ERR(phys);
+		return -ENOMEM;
 
 	for (i = 0; i < pcie->phy_count; i++) {
 		name = kasprintf(GFP_KERNEL, "p2u-%u", i);
@@ -1422,7 +1422,7 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 	dbi_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
 	if (!dbi_res) {
 		dev_err(dev, "Failed to find \"dbi\" region\n");
-		return PTR_ERR(dbi_res);
+		return -ENODEV;
 	}
 	pcie->dbi_res = dbi_res;
 
@@ -1437,7 +1437,7 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 						   "atu_dma");
 	if (!atu_dma_res) {
 		dev_err(dev, "Failed to find \"atu_dma\" region\n");
-		return PTR_ERR(atu_dma_res);
+		return -ENODEV;
 	}
 	pcie->atu_dma_res = atu_dma_res;
