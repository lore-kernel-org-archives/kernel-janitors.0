From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 07 Nov 2019 20:24:55 +0000
Subject: [PATCH] net: aquantia: Use common error handling code in aq_pci_probe()
Message-Id: <f155464c-5cbd-5cf7-c889-dabbe0f1135e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Igor Russkikh <igor.russkikh@aquantia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 7 Nov 2019 21:17:40 +0100

Move the same error code assignments so that such exception handling
can be better reused at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 .../ethernet/aquantia/atlantic/aq_pci_func.c  | 29 +++++++++----------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
index e82c96b50373..be0c018d0074 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
@@ -241,30 +241,23 @@ static int aq_pci_probe(struct pci_dev *pdev,
 			resource_size_t reg_sz;

 			mmio_pa = pci_resource_start(pdev, bar);
-			if (mmio_pa == 0U) {
-				err = -EIO;
-				goto err_free_aq_hw;
-			}
+			if (mmio_pa == 0U)
+				goto e_io;

 			reg_sz = pci_resource_len(pdev, bar);
-			if ((reg_sz <= 24 /*ATL_REGS_SIZE*/)) {
-				err = -EIO;
-				goto err_free_aq_hw;
-			}
+			if (reg_sz <= 24 /* ATL_REGS_SIZE */)
+				goto e_io;

 			self->aq_hw->mmio = ioremap_nocache(mmio_pa, reg_sz);
-			if (!self->aq_hw->mmio) {
-				err = -EIO;
-				goto err_free_aq_hw;
-			}
+			if (!self->aq_hw->mmio)
+				goto e_io;
+
 			break;
 		}
 	}

-	if (bar == 4) {
-		err = -EIO;
-		goto err_free_aq_hw;
-	}
+	if (bar == 4)
+		goto e_io;

 	numvecs = min((u8)AQ_CFG_VECS_DEF,
 		      aq_nic_get_cfg(self)->aq_hw_caps->msix_irqs);
@@ -312,6 +305,10 @@ static int aq_pci_probe(struct pci_dev *pdev,
 err_pci_func:
 	pci_disable_device(pdev);
 	return err;
+
+e_io:
+	err = -EIO;
+	goto err_free_aq_hw;
 }

 static void aq_pci_remove(struct pci_dev *pdev)
--
2.24.0
