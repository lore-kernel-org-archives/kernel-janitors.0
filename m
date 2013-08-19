From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 19 Aug 2013 11:20:37 +0000
Subject: [PATCH 3/7] iommu/arm: replace devm_request_and_ioremap by devm_ioremap_resource
Message-Id: <1376911241-27720-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use devm_ioremap_resource instead of devm_request_and_ioremap.

This was partly done using the semantic patch
scripts/coccinelle/api/devm_ioremap_resource.cocci

The error-handling code on the call to platform_get_resource was removed
manually, and the initialization of smmu->size was manually moved lower, to
take advantage of the NULL test on res performed by devm_ioremap_resource.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/iommu/arm-smmu.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index ebd0a4c..dd91465 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1761,15 +1761,10 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev)
 	smmu->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "missing base address/size\n");
-		return -ENODEV;
-	}
-
+	smmu->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(smmu->base))
+		return PTR_ERR(smmu->base);
 	smmu->size = resource_size(res);
-	smmu->base = devm_request_and_ioremap(dev, res);
-	if (!smmu->base)
-		return -EADDRNOTAVAIL;
 
 	if (of_property_read_u32(dev->of_node, "#global-interrupts",
 				 &smmu->num_global_irqs)) {

