From: Alan Mikhak <alan.mikhak@sifive.com>
Date: Fri, 10 Apr 2020 18:48:18 +0000
Subject: [PATCH][next] PCI: endpoint: functions/pci-epf-test: fix leak of buf in pci_epf_test_write()
Message-Id: <1586544498-29978-1-git-send-email-alan.mikhak@sifive.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200401223541.403438-1-colin.king@canonical.com>
In-Reply-To: <20200401223541.403438-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, kishon@ti.com, bhelgaas@google.com, martin.petersen@oracle.com, vidyas@nvidia.com, efremov@linux.com, kjlu@umn.edu, paul.walmsley@sifive.com
Cc: Alan Mikhak <alan.mikhak@sifive.com>

From: Alan Mikhak <alan.mikhak@sifive.com>

In the case where pci_epf_test_write() cannot transfer using DMA, the
allocation of 'buf' leaks on the error return path. Fix by jumping to
the label err_dma_map to free the 'buf' before returning.

Fixes: a558357b1b34 ("PCI: endpoint: functions/pci-epf-test: Add DMA support to transfer data")
Signed-off-by: Alan Mikhak <alan.mikhak@sifive.com>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 60330f3e3751..22fb2858f20a 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -438,7 +438,7 @@ static int pci_epf_test_write(struct pci_epf_test *epf_test)
 		if (!epf_test->dma_supported) {
 			dev_err(dev, "Cannot transfer data using DMA\n");
 			ret = -EINVAL;
-			goto err_map_addr;
+			goto err_dma_map;
 		}
 
 		src_phys_addr = dma_map_single(dma_dev, buf, reg->size,
-- 
2.7.4
