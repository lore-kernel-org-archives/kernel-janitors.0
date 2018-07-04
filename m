From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 04 Jul 2018 08:35:17 +0000
Subject: [PATCH -next] mmc: sdhci-msm: Remove redundant dev_err call in sdhci_msm_probe()
Message-Id: <1530693317-14482-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mmc/host/sdhci-msm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index a0dc3e1..3cc8bfe 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1764,7 +1764,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 				core_memres);
 
 		if (IS_ERR(msm_host->core_mem)) {
-			dev_err(&pdev->dev, "Failed to remap registers\n");
 			ret = PTR_ERR(msm_host->core_mem);
 			goto clk_disable;
 		}



