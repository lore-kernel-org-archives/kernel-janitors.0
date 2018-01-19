From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Jan 2018 21:30:19 +0000
Subject: [PATCH] IPMMU-VMSA: Delete an error message for a failed memory allocation in ipmmu_probe()
Message-Id: <457b87a4-8653-913a-c678-328c1fb681db@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iommu@lists.linux-foundation.org, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Jan 2018 22:22:38 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/iommu/ipmmu-vmsa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 8dce3a9de9d8..1f78d60f2029 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -949,10 +949,8 @@ static int ipmmu_probe(struct platform_device *pdev)
 	int ret;
 
 	mmu = devm_kzalloc(&pdev->dev, sizeof(*mmu), GFP_KERNEL);
-	if (!mmu) {
-		dev_err(&pdev->dev, "cannot allocate device data\n");
+	if (!mmu)
 		return -ENOMEM;
-	}
 
 	mmu->dev = &pdev->dev;
 	mmu->num_utlbs = 32;
-- 
2.15.1

