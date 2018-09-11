From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Sep 2018 12:28:32 +0000
Subject: [PATCH] iommu/fsl: fix spelling mistake pci_endpt_partioning -> pci_endpt_partitioning
Message-Id: <20180911122832.32383-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in variable name

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iommu/fsl_pamu_domain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index f089136e9c3f..18970d38f698 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -916,13 +916,13 @@ static struct iommu_group *get_shared_pci_device_group(struct pci_dev *pdev)
 static struct iommu_group *get_pci_device_group(struct pci_dev *pdev)
 {
 	struct pci_controller *pci_ctl;
-	bool pci_endpt_partioning;
+	bool pci_endpt_partitioning;
 	struct iommu_group *group = NULL;
 
 	pci_ctl = pci_bus_to_host(pdev->bus);
-	pci_endpt_partioning = check_pci_ctl_endpt_part(pci_ctl);
+	pci_endpt_partitioning = check_pci_ctl_endpt_part(pci_ctl);
 	/* We can partition PCIe devices so assign device group to the device */
-	if (pci_endpt_partioning) {
+	if (pci_endpt_partitioning) {
 		group = pci_device_group(&pdev->dev);
 
 		/*
-- 
2.17.1
