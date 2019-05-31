From: Colin King <colin.king@canonical.com>
Date: Fri, 31 May 2019 10:57:08 +0000
Subject: [PATCH][next] drivers: thermal: tsens: remove redundant u32 comparison with less than zero
Message-Id: <20190531105708.15312-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The u32 variable hw_id is unsigned and cannot be less than zero so
the comparison with less than zero is always false and hence is redundant
and can be removed.

Addresses-Coverity: ("Unsigned compared against 0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/thermal/qcom/tsens-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
index 928e8e81ba69..f4419f45025d 100644
--- a/drivers/thermal/qcom/tsens-common.c
+++ b/drivers/thermal/qcom/tsens-common.c
@@ -69,7 +69,7 @@ bool is_sensor_enabled(struct tsens_priv *priv, u32 hw_id)
 	u32 val;
 	int ret;
 
-	if ((hw_id > (priv->num_sensors - 1)) || (hw_id < 0))
+	if (hw_id > (priv->num_sensors - 1))
 		return -EINVAL;
 	ret = regmap_field_read(priv->rf[SENSOR_EN], &val);
 	if (ret)
-- 
2.20.1
