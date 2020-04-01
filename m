From: Colin King <colin.king@canonical.com>
Date: Wed, 01 Apr 2020 22:35:41 +0000
Subject: [PATCH][next] PCI: endpoint: functions/pci-epf-test: fix memory leak of buf
Message-Id: <20200401223541.403438-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where data cannot be transferred using DMA the allocation
of buf leaked on the error return path. Fix this by jumping to the
label err_dma_map that kfree's buf before the return.

Addresses-Coverity: ("Resource leak")
Fixes: a558357b1b34 ("PCI: endpoint: functions/pci-epf-test: Add DMA support to transfer data")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 3b4cf7e2bc60..60330f3e3751 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -347,7 +347,7 @@ static int pci_epf_test_read(struct pci_epf_test *epf_test)
 		if (!epf_test->dma_supported) {
 			dev_err(dev, "Cannot transfer data using DMA\n");
 			ret = -EINVAL;
-			goto err_map_addr;
+			goto err_dma_map;
 		}
 
 		dst_phys_addr = dma_map_single(dma_dev, buf, reg->size,
-- 
2.25.1
