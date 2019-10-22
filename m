From: Colin King <colin.king@canonical.com>
Date: Tue, 22 Oct 2019 11:18:06 +0000
Subject: [PATCH][next] thermal: qcom: tsens-v1: fix kfree of a non-pointer value
Message-Id: <20191022111806.23143-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amit Kucheria <amit.kucheria@linaro.org>, Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, AngeloGioacchino Del Regno <kholk11@gmail.com>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the kfree of pointer qfprom_cdata is kfreeing an
error value that has been cast to a pointer rather than a
valid address.  Fix this by removing the kfree.

Fixes: 95ededc17e4e ("thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/thermal/qcom/tsens-v1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index 2d1077b64887..bd2ddb684a45 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -240,10 +240,8 @@ static int calibrate_8976(struct tsens_priv *priv)
 	u32 *qfprom_cdata;
 
 	qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
-	if (IS_ERR(qfprom_cdata)) {
-		kfree(qfprom_cdata);
+	if (IS_ERR(qfprom_cdata))
 		return PTR_ERR(qfprom_cdata);
-	}
 
 	mode = (qfprom_cdata[4] & MSM8976_CAL_SEL_MASK);
 	dev_dbg(priv->dev, "calibration mode is %d\n", mode);
-- 
2.20.1
