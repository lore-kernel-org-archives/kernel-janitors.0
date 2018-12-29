From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 29 Dec 2018 16:42:22 +0000
Subject: [PATCH] octeontx2-af: Fix a resource leak in an error handling path in 'cgx_probe()'
Message-Id: <20181229164222.15791-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If an error occurs after the call to 'pci_alloc_irq_vectors()', we must
call 'pci_free_irq_vectors()' in order to avoid a	resource leak.

The same sequence is already in place in the corresponding 'cgx_remove()'
function.

Fixes: 1463f382f58d ("octeontx2-af: Add support for CGX link management")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/marvell/octeontx2/af/cgx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/cgx.c b/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
index 742f0c1f60df..6d55e3d0b7ea 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
@@ -825,7 +825,7 @@ static int cgx_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!cgx->cgx_cmd_workq) {
 		dev_err(dev, "alloc workqueue failed for cgx cmd");
 		err = -ENOMEM;
-		goto err_release_regions;
+		goto err_free_irq_vectors;
 	}
 
 	list_add(&cgx->cgx_list, &cgx_list);
@@ -841,6 +841,8 @@ static int cgx_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 err_release_lmac:
 	cgx_lmac_exit(cgx);
 	list_del(&cgx->cgx_list);
+err_free_irq_vectors:
+	pci_free_irq_vectors(pdev);
 err_release_regions:
 	pci_release_regions(pdev);
 err_disable_device:
-- 
2.19.1
