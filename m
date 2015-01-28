From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Jan 2015 19:15:31 +0000
Subject: [patch] regulator: qcom-rpm: signedness bug in probe()
Message-Id: <20150128191531.GD10259@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"force_mode" is a u32 so it is never "< 0", but because of type
promotion then comparing "= -1" will do what we want.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index edd0a17..ec540aa 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -769,7 +769,7 @@ static int rpm_reg_probe(struct platform_device *pdev)
 			break;
 		}
 
-		if (force_mode < 0) {
+		if (force_mode = -1) {
 			dev_err(&pdev->dev, "invalid force mode\n");
 			return -EINVAL;
 		}
