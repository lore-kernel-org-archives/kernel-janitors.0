From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 30 Jul 2018 02:45:17 +0000
Subject: [PATCH -next v2] thermal: armada: fix copy-paste error in armada_thermal_probe()
Message-Id: <1532918717-46808-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix the retrn value check which testing the wrong variable
in armada_thermal_probe().

Fixes: e72f03ef2543 ("thermal: armada: use the resource managed registration helper alternative")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 - > v2: fix typo of patch subject
---
 drivers/thermal/armada_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_thermal.c
index 8de4ba5..a269482 100644
--- a/drivers/thermal/armada_thermal.c
+++ b/drivers/thermal/armada_thermal.c
@@ -610,7 +610,7 @@ static int armada_thermal_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!priv)
+	if (!drvdata)
 		return -ENOMEM;
 
 	priv->dev = &pdev->dev;

