From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Jan 2018 14:00:07 +0000
Subject: [PATCH] iommu/dmar: Delete an error message for a failed memory allocation in dmar_alloc_pci_notify_
Message-Id: <bc2cf250-0c52-57df-e7e1-fd20a8c23731@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iommu@lists.linux-foundation.org, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Jan 2018 14:55:21 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/iommu/dmar.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
index 9a7ffd13c7f0..da6b121590cc 100644
--- a/drivers/iommu/dmar.c
+++ b/drivers/iommu/dmar.c
@@ -150,8 +150,6 @@ dmar_alloc_pci_notify_info(struct pci_dev *dev, unsigned long event)
 	} else {
 		info = kzalloc(size, GFP_KERNEL);
 		if (!info) {
-			pr_warn("Out of memory when allocating notify_info "
-				"for %s.\n", pci_name(dev));
 			if (dmar_dev_scope_status = 0)
 				dmar_dev_scope_status = -ENOMEM;
 			return NULL;
-- 
2.15.1

