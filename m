From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 17 Sep 2017 19:47:16 +0000
Subject: [PATCH] regulator: qcom_spmi: Fix an error handling path in 'qcom_spmi_regulator_probe()'
Message-Id: <20170917194716.31980-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lgirdwood@gmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If a memory allocation fails, we should go through the error handling path,
as done elsewhere in this 'for' loop.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/regulator/qcom_spmi-regulator.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 16c5f84e06a7..fbe908a37daa 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -1657,8 +1657,10 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 
 	for (reg = match->data; reg->name; reg++) {
 		vreg = devm_kzalloc(dev, sizeof(*vreg), GFP_KERNEL);
-		if (!vreg)
-			return -ENOMEM;
+		if (!vreg) {
+			ret = -ENOMEM;
+			goto err;
+		}
 
 		vreg->dev = dev;
 		vreg->base = reg->base;
-- 
2.11.0

