From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 11:10:44 +0000
Subject: [PATCH -next] PCI: dwc: pci-dra7xx: Fix potential NULL dereference in dra7xx_pcie_probe()
Message-Id: <20200427111044.162618-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

platform_get_resource() may fail and return NULL, so we should
better check it's return value to avoid a NULL pointer dereference
a bit later in the code.

This is detected by Coccinelle semantic patch.

@@
expression pdev, res, n, t, e, e1, e2;
@@

res = \(platform_get_resource\|platform_get_resource_byname\)(pdev, t, n);
+ if (!res)
+   return -EINVAL;
... when != res = NULL
e = devm_ioremap(e1, res->start, e2);

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pci/controller/dwc/pci-dra7xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 3b0e58f2de58..7a3d12f7e7d9 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -878,6 +878,9 @@ static int __init dra7xx_pcie_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ti_conf");
+	if (!res)
+		return -EINVAL;
+
 	base = devm_ioremap(dev, res->start, resource_size(res));
 	if (!base)
 		return -ENOMEM;
