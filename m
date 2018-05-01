From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 May 2018 07:22:50 +0000
Subject: [PATCH] PCI: qcom: fix a bitwise vs logical NOT typo
Message-Id: <20180501072250.GA4269@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanimir Varbanov <svarbanov@mm-sol.com>, John Crispin <john@phrozen.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo here so we accidentally set "val" to zero when we
intended just to clear BIT(0).

Fixes: 90d52d57ccac ("PCI: qcom: Add support for IPQ4019 PCIe controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

diff --git a/drivers/pci/dwc/pcie-qcom.c b/drivers/pci/dwc/pcie-qcom.c
index 5897af7d3355..b65bbf7c284e 100644
--- a/drivers/pci/dwc/pcie-qcom.c
+++ b/drivers/pci/dwc/pcie-qcom.c
@@ -869,7 +869,7 @@ static int qcom_pcie_init_2_4_0(struct qcom_pcie *pcie)
 
 	/* enable PCIe clocks and resets */
 	val = readl(pcie->parf + PCIE20_PARF_PHY_CTRL);
-	val &= !BIT(0);
+	val &= ~BIT(0);
 	writel(val, pcie->parf + PCIE20_PARF_PHY_CTRL);
 
 	/* change DBI base address */
