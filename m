From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 18 Jun 2020 13:38:37 +0000
Subject: [PATCH -next] scsi: ufs: ufs-exynos: Fix return value check in exynos_ufs_init()
Message-Id: <20200618133837.127274-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Seungwon
 Jeon <essuuj@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: 55f4b1f73631 ("scsi: ufs: ufs-exynos: Add UFS host support for Exynos SoCs")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/scsi/ufs/ufs-exynos.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-exynos.c b/drivers/scsi/ufs/ufs-exynos.c
index 440f2af83d9c..c918fbc6ca60 100644
--- a/drivers/scsi/ufs/ufs-exynos.c
+++ b/drivers/scsi/ufs/ufs-exynos.c
@@ -950,25 +950,25 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	/* exynos-specific hci */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vs_hci");
 	ufs->reg_hci = devm_ioremap_resource(dev, res);
-	if (!ufs->reg_hci) {
+	if (IS_ERR(ufs->reg_hci)) {
 		dev_err(dev, "cannot ioremap for hci vendor register\n");
-		return -ENOMEM;
+		return PTR_ERR(ufs->reg_hci);
 	}
 
 	/* unipro */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "unipro");
 	ufs->reg_unipro = devm_ioremap_resource(dev, res);
-	if (!ufs->reg_unipro) {
+	if (IS_ERR(ufs->reg_unipro)) {
 		dev_err(dev, "cannot ioremap for unipro register\n");
-		return -ENOMEM;
+		return PTR_ERR(ufs->reg_unipro);
 	}
 
 	/* ufs protector */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ufsp");
 	ufs->reg_ufsp = devm_ioremap_resource(dev, res);
-	if (!ufs->reg_ufsp) {
+	if (IS_ERR(ufs->reg_ufsp)) {
 		dev_err(dev, "cannot ioremap for ufs protector register\n");
-		return -ENOMEM;
+		return PTR_ERR(ufs->reg_ufsp);
 	}
 
 	ret = exynos_ufs_parse_dt(dev, ufs);
