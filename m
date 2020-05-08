From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 08 May 2020 07:53:23 +0000
Subject: [PATCH next] ath11k: convert to devm_platform_get_and_ioremap_resource
Message-Id: <20200508075323.81128-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, ath11k@lists.infradead.org

Use the helper function that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 3b2b76d602f2..d4ad99eb0e16 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -891,13 +891,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem_res) {
-		dev_err(&pdev->dev, "failed to get IO memory resource\n");
-		return -ENXIO;
-	}
-
-	mem = devm_ioremap_resource(&pdev->dev, mem_res);
+	mem = devm_platform_get_and_ioremap_resource(pdev, 0, &mem_res);
 	if (IS_ERR(mem)) {
 		dev_err(&pdev->dev, "ioremap error\n");
 		return PTR_ERR(mem);
