From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 01 Dec 2018 01:45:46 +0000
Subject: [PATCH -next] mmc: jz4740: Use PTR_ERR_OR_ZERO in jz4740_mmc_request_gpios()
Message-Id: <1543628746-101825-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/mmc/host/jz4740_mmc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 6f7a99e..8eca423 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -975,10 +975,7 @@ static int jz4740_mmc_request_gpios(struct jz4740_mmc_host *host,
 
 	host->power = devm_gpiod_get_optional(&pdev->dev, "power",
 					      GPIOD_OUT_HIGH);
-	if (IS_ERR(host->power))
-		return PTR_ERR(host->power);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(host->power);
 }
 
 static const struct of_device_id jz4740_mmc_of_match[] = {
