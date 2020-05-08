From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 08 May 2020 02:15:19 +0000
Subject: [PATCH net-next] octeontx2-vf: Fix error return code in otx2vf_probe()
Message-Id: <20200508021519.179062-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, Tomasz Duszynski <tduszynski@marvell.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fix to return negative error code -ENOMEM from the alloc failed error
handling case instead of 0, as done elsewhere in this function.

Fixes: 3184fb5ba96e ("octeontx2-vf: Virtual function driver support")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
index 187c633a7af5..f4227517dc8e 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
@@ -497,13 +497,17 @@ static int otx2vf_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	hw->irq_name = devm_kmalloc_array(&hw->pdev->dev, num_vec, NAME_SIZE,
 					  GFP_KERNEL);
-	if (!hw->irq_name)
+	if (!hw->irq_name) {
+		err = -ENOMEM;
 		goto err_free_netdev;
+	}
 
 	hw->affinity_mask = devm_kcalloc(&hw->pdev->dev, num_vec,
 					 sizeof(cpumask_var_t), GFP_KERNEL);
-	if (!hw->affinity_mask)
+	if (!hw->affinity_mask) {
+		err = -ENOMEM;
 		goto err_free_netdev;
+	}
 
 	err = pci_alloc_irq_vectors(hw->pdev, num_vec, num_vec, PCI_IRQ_MSIX);
 	if (err < 0) {
