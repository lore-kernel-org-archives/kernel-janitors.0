From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 23 Jan 2017 20:50:08 +0000
Subject: [PATCH] ACPI/IORT: Fix error handling
Message-Id: <20170123205008.10065-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lorenzo.pieralisi@arm.com, hanjun.guo@linaro.org, sudeep.holla@arm.com
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'platform_device_alloc()' returns NULL, the current code returns
0, which means success. Return -ENOMEM instead.

Fixes: 846f0e9e74a0 ("ACPI/IORT: Add support for ARM SMMU platform devices creation")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/acpi/arm64/iort.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index e0d2e6e6e40c..655407ad112e 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -828,7 +828,7 @@ static int __init iort_add_smmu_platform_device(struct acpi_iort_node *node)
 
 	pdev = platform_device_alloc(ops->name, PLATFORM_DEVID_AUTO);
 	if (!pdev)
-		return PTR_ERR(pdev);
+		return -ENOMEM;
 
 	count = ops->iommu_count_resources(node);
 
-- 
2.9.3

