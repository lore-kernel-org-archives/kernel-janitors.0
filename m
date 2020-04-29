From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 29 Apr 2020 01:50:27 +0000
Subject: [PATCH -next  v2] PCI: dwc: pci-dra7xx: use devm_platform_ioremap_resource_byname()
Message-Id: <20200429015027.134485-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427111044.162618-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427111044.162618-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Vignesh Raghavendra <vigneshr@ti.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

platform_get_resource() may fail and return NULL, so we should better
check it's return value to avoid a NULL pointer dereference a bit later
in the code. Fix it to use devm_platform_ioremap_resource_byname()
instead of calling platform_get_resource_byname() and devm_ioremap().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 -> v2: use devm_platform_ioremap_resource_byname, suggest by Vignesh
---
 drivers/pci/controller/dwc/pci-dra7xx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 3b0e58f2de58..6184ebc9392d 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -840,7 +840,6 @@ static int __init dra7xx_pcie_probe(struct platform_device *pdev)
 	struct phy **phy;
 	struct device_link **link;
 	void __iomem *base;
-	struct resource *res;
 	struct dw_pcie *pci;
 	struct dra7xx_pcie *dra7xx;
 	struct device *dev = &pdev->dev;
@@ -877,10 +876,9 @@ static int __init dra7xx_pcie_probe(struct platform_device *pdev)
 		return irq;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ti_conf");
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return -ENOMEM;
+	base = devm_platform_ioremap_resource_byname(pdev, "ti_conf");
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	phy_count = of_property_count_strings(np, "phy-names");
 	if (phy_count < 0) {
