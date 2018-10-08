From: Colin King <colin.king@canonical.com>
Date: Mon, 08 Oct 2018 13:35:58 +0000
Subject: [PATCH] net: aquantia: remove some redundant variable initializations
Message-Id: <20181008133558.5841-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Igor Russkikh <igor.russkikh@aquantia.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several variables being initialized that are being set later
and hence the initialization is redundant and can be removed. Remove
then.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
index 750007513f9d..1d5d6b8df855 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
@@ -84,7 +84,7 @@ static int aq_pci_probe_get_hw_by_id(struct pci_dev *pdev,
 				     const struct aq_hw_ops **ops,
 				     const struct aq_hw_caps_s **caps)
 {
-	int i = 0;
+	int i;
 
 	if (pdev->vendor != PCI_VENDOR_ID_AQUANTIA)
 		return -EINVAL;
@@ -107,7 +107,7 @@ static int aq_pci_probe_get_hw_by_id(struct pci_dev *pdev,
 
 int aq_pci_func_init(struct pci_dev *pdev)
 {
-	int err = 0;
+	int err;
 
 	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
 	if (!err) {
@@ -141,7 +141,7 @@ int aq_pci_func_alloc_irq(struct aq_nic_s *self, unsigned int i,
 			  char *name, void *aq_vec, cpumask_t *affinity_mask)
 {
 	struct pci_dev *pdev = self->pdev;
-	int err = 0;
+	int err;
 
 	if (pdev->msix_enabled || pdev->msi_enabled)
 		err = request_irq(pci_irq_vector(pdev, i), aq_vec_isr, 0,
@@ -164,7 +164,7 @@ int aq_pci_func_alloc_irq(struct aq_nic_s *self, unsigned int i,
 void aq_pci_func_free_irqs(struct aq_nic_s *self)
 {
 	struct pci_dev *pdev = self->pdev;
-	unsigned int i = 0U;
+	unsigned int i;
 
 	for (i = 32U; i--;) {
 		if (!((1U << i) & self->msix_entry_mask))
@@ -194,8 +194,8 @@ static void aq_pci_free_irq_vectors(struct aq_nic_s *self)
 static int aq_pci_probe(struct pci_dev *pdev,
 			const struct pci_device_id *pci_id)
 {
-	struct aq_nic_s *self = NULL;
-	int err = 0;
+	struct aq_nic_s *self;
+	int err;
 	struct net_device *ndev;
 	resource_size_t mmio_pa;
 	u32 bar;
-- 
2.17.1
