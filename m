From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Feb 2018 09:11:55 +0000
Subject: [PATCH net] net: aquantia: Fix error handling in aq_pci_probe()
Message-Id: <20180222091155.GA9883@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Igor Russkikh <igor.russkikh@aquantia.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Pavel Belous <pavel.belous@aquantia.com>, David Arcari <darcari@redhat.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We should check "self->aq_hw" for allocation failure, and also we should
free it on the error paths.

Fixes: 23ee07ad3c2f ("net: aquantia: Cleanup pci functions module")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
index 22889fc158f2..87c4308b52a7 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
@@ -226,6 +226,10 @@ static int aq_pci_probe(struct pci_dev *pdev,
 		goto err_ioremap;
 
 	self->aq_hw = kzalloc(sizeof(*self->aq_hw), GFP_KERNEL);
+	if (!self->aq_hw) {
+		err = -ENOMEM;
+		goto err_ioremap;
+	}
 	self->aq_hw->aq_nic_cfg = aq_nic_get_cfg(self);
 
 	for (bar = 0; bar < 4; ++bar) {
@@ -235,19 +239,19 @@ static int aq_pci_probe(struct pci_dev *pdev,
 			mmio_pa = pci_resource_start(pdev, bar);
 			if (mmio_pa = 0U) {
 				err = -EIO;
-				goto err_ioremap;
+				goto err_free_aq_hw;
 			}
 
 			reg_sz = pci_resource_len(pdev, bar);
 			if ((reg_sz <= 24 /*ATL_REGS_SIZE*/)) {
 				err = -EIO;
-				goto err_ioremap;
+				goto err_free_aq_hw;
 			}
 
 			self->aq_hw->mmio = ioremap_nocache(mmio_pa, reg_sz);
 			if (!self->aq_hw->mmio) {
 				err = -EIO;
-				goto err_ioremap;
+				goto err_free_aq_hw;
 			}
 			break;
 		}
@@ -255,7 +259,7 @@ static int aq_pci_probe(struct pci_dev *pdev,
 
 	if (bar = 4) {
 		err = -EIO;
-		goto err_ioremap;
+		goto err_free_aq_hw;
 	}
 
 	numvecs = min((u8)AQ_CFG_VECS_DEF,
@@ -290,6 +294,8 @@ static int aq_pci_probe(struct pci_dev *pdev,
 	aq_pci_free_irq_vectors(self);
 err_hwinit:
 	iounmap(self->aq_hw->mmio);
+err_free_aq_hw:
+	kfree(self->aq_hw);
 err_ioremap:
 	free_netdev(ndev);
 err_pci_func:
