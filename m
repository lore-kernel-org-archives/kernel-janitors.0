From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 19 Dec 2016 05:52:55 +0000
Subject: [PATCH] NTB: Fix 'request_irq()' and 'free_irq()' inconsistancy
Message-Id: <20161219055255.21418-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xiangliang.Yu@amd.com, jdmason@kudzu.us, dave.jiang@intel.com, Allen.Hubbe@emc.com
Cc: linux-ntb@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'request_irq()' and 'free_irq()' should have the same 'dev_id'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/ntb/hw/amd/ntb_hw_amd.c     | 2 +-
 drivers/ntb/hw/intel/ntb_hw_intel.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
index 6ccba0d862df..a48c3e085eab 100644
--- a/drivers/ntb/hw/amd/ntb_hw_amd.c
+++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
@@ -598,7 +598,7 @@ static int ndev_init_isr(struct amd_ntb_dev *ndev,
 
 err_msix_request:
 	while (i-- > 0)
-		free_irq(ndev->msix[i].vector, ndev);
+		free_irq(ndev->msix[i].vector, &ndev->vec[i]);
 	pci_disable_msix(pdev);
 err_msix_enable:
 	kfree(ndev->msix);
diff --git a/drivers/ntb/hw/intel/ntb_hw_intel.c b/drivers/ntb/hw/intel/ntb_hw_intel.c
index 7310a261c858..2413600aae30 100644
--- a/drivers/ntb/hw/intel/ntb_hw_intel.c
+++ b/drivers/ntb/hw/intel/ntb_hw_intel.c
@@ -472,7 +472,7 @@ static int ndev_init_isr(struct intel_ntb_dev *ndev,
 
 err_msix_request:
 	while (i-- > 0)
-		free_irq(ndev->msix[i].vector, ndev);
+		free_irq(ndev->msix[i].vector, &ndev->vec[i]);
 	pci_disable_msix(pdev);
 err_msix_enable:
 	kfree(ndev->msix);
-- 
2.9.3

