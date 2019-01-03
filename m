From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 03 Jan 2019 03:12:18 +0000
Subject: [PATCH -next] PCI: amlogic: Use PTR_ERR_OR_ZERO
Message-Id: <1546485138-142830-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yue Wang <yue.wang@Amlogic.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Kevin
 Hilman <khilman@baylibre.com>
Cc: linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 241ebe0..51cf20c 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -181,10 +181,7 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
 
 	/* Meson SoC has two PCI controllers use same phy register*/
 	mp->mem_res.phy_base = meson_pcie_get_mem_shared(pdev, mp, "phy");
-	if (IS_ERR(mp->mem_res.phy_base))
-		return PTR_ERR(mp->mem_res.phy_base);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(mp->mem_res.phy_base);
 }
 
 static void meson_pcie_power_on(struct meson_pcie *mp)
@@ -258,10 +255,7 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
 		return PTR_ERR(res->general_clk);
 
 	res->clk = meson_pcie_probe_clock(dev, "pcie", 0);
-	if (IS_ERR(res->clk))
-		return PTR_ERR(res->clk);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(res->clk);
 }
 
 static inline void meson_elb_writel(struct meson_pcie *mp, u32 val, u32 reg)
