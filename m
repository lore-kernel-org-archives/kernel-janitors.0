From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 30 Aug 2019 20:23:12 +0000
Subject: [PATCH] enetc: Add missing call to 'pci_free_irq_vectors()' in probe and remove functions
Message-Id: <20190830202312.21287-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yangbo.lu@nxp.com, claudiu.manoil@nxp.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Call to 'pci_free_irq_vectors()' are missing both in the error handling
path of the probe function, and in the remove function.
Add them.

Fixes: 19971f5ea0ab ("enetc: add PTP clock driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/freescale/enetc/enetc_ptp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ptp.c b/drivers/net/ethernet/freescale/enetc/enetc_ptp.c
index 2fd2586e42bf..bc594892507a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ptp.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ptp.c
@@ -82,7 +82,7 @@ static int enetc_ptp_probe(struct pci_dev *pdev,
 	n = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
 	if (n != 1) {
 		err = -EPERM;
-		goto err_irq;
+		goto err_irq_vectors;
 	}
 
 	ptp_qoriq->irq = pci_irq_vector(pdev, 0);
@@ -107,6 +107,8 @@ static int enetc_ptp_probe(struct pci_dev *pdev,
 err_no_clock:
 	free_irq(ptp_qoriq->irq, ptp_qoriq);
 err_irq:
+	pci_free_irq_vectors(pdev);
+err_irq_vectors:
 	iounmap(base);
 err_ioremap:
 	kfree(ptp_qoriq);
@@ -125,6 +127,7 @@ static void enetc_ptp_remove(struct pci_dev *pdev)
 
 	enetc_phc_index = -1;
 	ptp_qoriq_free(ptp_qoriq);
+	pci_free_irq_vectors(pdev);
 	kfree(ptp_qoriq);
 
 	pci_release_mem_regions(pdev);
-- 
2.20.1
