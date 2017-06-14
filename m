From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 09:12:09 +0000
Subject: [PATCH] pinctrl: ingenic: checking for NULL instead of IS_ERR()
Message-Id: <20170614091209.GC29394@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

devm_pinctrl_register() returns error pointers, it doesn't return NULL.

Fixes: b5c23aa46537 ("pinctrl: add a pinctrl driver for the Ingenic jz47xx SoCs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d8473d929cb1..d8e8842967d6 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -785,9 +785,9 @@ int ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	jzpc->pctl = devm_pinctrl_register(dev, pctl_desc, jzpc);
-	if (!jzpc->pctl) {
+	if (IS_ERR(jzpc->pctl)) {
 		dev_err(dev, "Failed to register pinctrl\n");
-		return -EINVAL;
+		return PTR_ERR(jzpc->pctl);
 	}
 
 	for (i = 0; i < chip_info->num_groups; i++) {
