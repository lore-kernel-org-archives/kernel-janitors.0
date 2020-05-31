From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 31 May 2020 07:37:16 +0000
Subject: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is unused and broken
Message-Id: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")
has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' in
'pxa2xx_pinctrl_init()'.
However, the corresponding 'pinctrl_unregister()' call in
'pxa2xx_pinctrl_exit()' has not been removed.

This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
Remove it now to avoid some wondering in the future and save a few LoC.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If some some reason the function should be kept, at least it should be
only 'return 0;'
---
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
index bddf2c5dd3bf..eab029a21643 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
@@ -425,15 +425,6 @@ int pxa2xx_pinctrl_init(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(pxa2xx_pinctrl_init);
 
-int pxa2xx_pinctrl_exit(struct platform_device *pdev)
-{
-	struct pxa_pinctrl *pctl = platform_get_drvdata(pdev);
-
-	pinctrl_unregister(pctl->pctl_dev);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pxa2xx_pinctrl_exit);
-
 MODULE_AUTHOR("Robert Jarzmik <robert.jarzmik@free.fr>");
 MODULE_DESCRIPTION("Marvell PXA2xx pinctrl driver");
 MODULE_LICENSE("GPL v2");
-- 
2.25.1
