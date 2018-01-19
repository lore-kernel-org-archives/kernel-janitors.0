From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Jan 2018 20:50:56 +0000
Subject: [PATCH] IOMMU-Tegra: gart: Delete two error messages for a failed memory allocation in tegra_gart_pr
Message-Id: <faa84bc9-d663-f0ea-4f62-40b853c0212b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Jan 2018 21:44:31 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/iommu/tegra-gart.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index b62f790ad1ba..1fee3a956832 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -419,10 +419,8 @@ static int tegra_gart_probe(struct platform_device *pdev)
 	}
 
 	gart = devm_kzalloc(dev, sizeof(*gart), GFP_KERNEL);
-	if (!gart) {
-		dev_err(dev, "failed to allocate gart_device\n");
+	if (!gart)
 		return -ENOMEM;
-	}
 
 	gart_regs = devm_ioremap(dev, res->start, resource_size(res));
 	if (!gart_regs) {
@@ -455,10 +453,8 @@ static int tegra_gart_probe(struct platform_device *pdev)
 	gart->page_count = (resource_size(res_remap) >> GART_PAGE_SHIFT);
 
 	gart->savedata = vmalloc(sizeof(u32) * gart->page_count);
-	if (!gart->savedata) {
-		dev_err(dev, "failed to allocate context save area\n");
+	if (!gart->savedata)
 		return -ENOMEM;
-	}
 
 	platform_set_drvdata(pdev, gart);
 	do_gart_setup(gart, NULL);
-- 
2.15.1

