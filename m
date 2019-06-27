From: Colin King <colin.king@canonical.com>
Date: Thu, 27 Jun 2019 13:16:39 +0000
Subject: [PATCH][next] regulator: lp87565: fix missing break in switch statement
Message-Id: <20190627131639.6394-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keerthy <j-keerthy@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the LP87565_DEVICE_TYPE_LP87561_Q1 case does not have a
break statement, causing it to fall through to a dev_err message.
Fix this by adding in the missing break statement.

Addresses-Coverity: ("Missing break in switch")
Fixes: 7ee63bd74750 ("regulator: lp87565: Add 4-phase lp87561 regulator support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/lp87565-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/lp87565-regulator.c b/drivers/regulator/lp87565-regulator.c
index 993c11702083..5d067f7c2116 100644
--- a/drivers/regulator/lp87565-regulator.c
+++ b/drivers/regulator/lp87565-regulator.c
@@ -180,6 +180,7 @@ static int lp87565_regulator_probe(struct platform_device *pdev)
 	case LP87565_DEVICE_TYPE_LP87561_Q1:
 		min_idx = LP87565_BUCK_3210;
 		max_idx = LP87565_BUCK_3210;
+		break;
 	default:
 		dev_err(lp87565->dev, "Invalid lp config %d\n",
 			lp87565->dev_type);
-- 
2.20.1
