From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sun, 19 Jan 2020 02:30:03 +0000
Subject: [PATCH -next] PCI: brcmstb: Fix missing mutex_init()
Message-Id: <20200119023003.100987-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Jim Quinlan <james.quinlan@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org

The driver allocates the mutex but not initialize it.
Use mutex_init() on it to initialize it correctly.

This is detected by Coccinelle semantic patch.

Fixes: 72af6f6f0d13 ("PCI: brcmstb: Add MSI support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 43cba76c0e1e..065bada9cfad 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -528,6 +528,7 @@ static int brcm_pcie_enable_msi(struct brcm_pcie *pcie)
 	if (!msi)
 		return -ENOMEM;
 
+	mutex_init(&msi->lock);
 	msi->dev = dev;
 	msi->base = pcie->base;
 	msi->np = pcie->np;
