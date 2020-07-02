From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Jul 2020 11:56:59 +0000
Subject: [PATCH][next] regulator: fix null pointer check on regmap
Message-Id: <20200702115659.38208-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Wesley Cheng <wcheng@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The null pointer check on regmap that checks for a dev_get_regmap failure
is currently returning -ENOENT if the regmap succeeded. Fix this by adding
in the missing ! operator.

Addresses-Coverity: ("Dereference after null check")
Fixes: 4fe66d5a62fb ("regulator: Add support for QCOM PMIC VBUS booster")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index 342d92373598..8ba947f3585f 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -49,7 +49,7 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	}
 
 	regmap = dev_get_regmap(dev->parent, NULL);
-	if (regmap) {
+	if (!regmap) {
 		dev_err(dev, "Failed to get regmap\n");
 		return -ENOENT;
 	}
-- 
2.27.0
