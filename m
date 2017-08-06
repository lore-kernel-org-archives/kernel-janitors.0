From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 06 Aug 2017 23:49:53 +0000
Subject: [PATCH] i2c: imx: Remove a useless test in 'i2c_imx_init_recovery_info()'
Message-Id: <20170806234953.30682-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wsa@the-dreams.de
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'devm_pinctrl_get()' never returns NULL, so this test can be simplified.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 54a47b40546f..7e84662fe1c0 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -997,7 +997,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
 	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
 
 	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
+	if (IS_ERR(i2c_imx->pinctrl)) {
 		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
 		return PTR_ERR(i2c_imx->pinctrl);
 	}
-- 
2.11.0

