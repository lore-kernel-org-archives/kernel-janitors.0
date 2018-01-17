From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Jan 2018 11:28:14 +0000
Subject: [PATCH -next] perf: hisi: Remove redundant dev_err call
Message-Id: <1516188494-147057-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 4 +---
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c | 4 +---
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 4 +---
 3 file changed, 3 insertion(+), 9 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index 1b10ea0..deb11d2 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -270,10 +270,8 @@ static int hisi_ddrc_pmu_init_data(struct platform_device *pdev,
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ddrc_pmu->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(ddrc_pmu->base)) {
-		dev_err(&pdev->dev, "ioremap failed for ddrc_pmu resource\n");
+	if (IS_ERR(ddrc_pmu->base))
 		return PTR_ERR(ddrc_pmu->base);
-	}
 
 	return 0;
 }
diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
index 443906e..dbf7629 100644
--- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
@@ -263,10 +263,8 @@ static int hisi_hha_pmu_init_data(struct platform_device *pdev,
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	hha_pmu->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(hha_pmu->base)) {
-		dev_err(&pdev->dev, "ioremap failed for hha_pmu resource\n");
+	if (IS_ERR(hha_pmu->base))
 		return PTR_ERR(hha_pmu->base);
-	}
 
 	return 0;
 }
diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index 0bde5d9..8d79d88 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -266,10 +266,8 @@ static int hisi_l3c_pmu_init_data(struct platform_device *pdev,
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	l3c_pmu->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(l3c_pmu->base)) {
-		dev_err(&pdev->dev, "ioremap failed for l3c_pmu resource\n");
+	if (IS_ERR(l3c_pmu->base))
 		return PTR_ERR(l3c_pmu->base);
-	}
 
 	return 0;
 }

