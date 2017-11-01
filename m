From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 01 Nov 2017 20:50:37 +0000
Subject: [PATCH] pwm-twl: Use common error handling code in twl6030_pwm_disable()
Message-Id: <97ad7b8f-a5ca-b867-41a9-c3b46507eddb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pwm@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 1 Nov 2017 21:44:30 +0100

* Adjust jump targets so that a specific error message is stored only once
  at the end of this function implementation.

* Replace three calls of the function "dev_err" by goto statements.

* Adjust three condition checks.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pwm/pwm-twl.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/pwm/pwm-twl.c b/drivers/pwm/pwm-twl.c
index b7a45be99815..0367fb8e425b 100644
--- a/drivers/pwm/pwm-twl.c
+++ b/drivers/pwm/pwm-twl.c
@@ -264,30 +264,29 @@ static void twl6030_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	val &= ~TWL6030_PWM_TOGGLE(pwm->hwpwm, TWL6030_PWMXS | TWL6030_PWMXEN);
 
 	ret = twl_i2c_write_u8(TWL6030_MODULE_ID1, val, TWL6030_TOGGLE3_REG);
-	if (ret < 0) {
-		dev_err(chip->dev, "%s: Failed to disable PWM\n", pwm->label);
-		goto out;
-	}
+	if (ret)
+		goto report_failure;
 
 	val |= TWL6030_PWM_TOGGLE(pwm->hwpwm, TWL6030_PWMXEN);
 
 	ret = twl_i2c_write_u8(TWL6030_MODULE_ID1, val, TWL6030_TOGGLE3_REG);
-	if (ret < 0) {
-		dev_err(chip->dev, "%s: Failed to disable PWM\n", pwm->label);
-		goto out;
-	}
+	if (ret)
+		goto report_failure;
 
 	val &= ~TWL6030_PWM_TOGGLE(pwm->hwpwm, TWL6030_PWMXEN);
 
 	ret = twl_i2c_write_u8(TWL6030_MODULE_ID1, val, TWL6030_TOGGLE3_REG);
-	if (ret < 0) {
-		dev_err(chip->dev, "%s: Failed to disable PWM\n", pwm->label);
-		goto out;
-	}
+	if (ret)
+		goto report_failure;
 
 	twl->twl6030_toggle3 = val;
-out:
+unlock:
 	mutex_unlock(&twl->mutex);
+	return;
+
+report_failure:
+	dev_err(chip->dev, "%s: Failed to disable PWM\n", pwm->label);
+	goto unlock;
 }
 
 static const struct pwm_ops twl4030_pwm_ops = {
-- 
2.14.3

