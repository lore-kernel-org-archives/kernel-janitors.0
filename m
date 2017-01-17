From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Jan 2017 13:36:23 +0000
Subject: [patch] ACPI/IORT: fix an error code
Message-Id: <20170117121910.GA29263@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Hanjun Guo <hanjun.guo@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally return success if platform_device_alloc() fails.

Fixes: 846f0e9e74a0 ("ACPI/IORT: Add support for ARM SMMU platform devices creation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index e0d2e6e..655407a 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -828,7 +828,7 @@ static int __init iort_add_smmu_platform_device(struct acpi_iort_node *node)
 
 	pdev = platform_device_alloc(ops->name, PLATFORM_DEVID_AUTO);
 	if (!pdev)
-		return PTR_ERR(pdev);
+		return -ENOMEM;
 
 	count = ops->iommu_count_resources(node);
 
