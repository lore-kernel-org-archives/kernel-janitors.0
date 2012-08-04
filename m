From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 04 Aug 2012 16:50:47 +0000
Subject: [PATCH 4/6] drivers/pinctrl/pinctrl-nomadik.c: drop devm_kfree of devm_kzalloc'd data
Message-Id: <1344099049-15212-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm_kfree should not have to be explicitly used.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,d;
@@

x = devm_kzalloc(...)
...
?-devm_kfree(d,x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/pinctrl-nomadik.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-nomadik.c b/drivers/pinctrl/pinctrl-nomadik.c
index 53b0d49..ec6ac50 100644
--- a/drivers/pinctrl/pinctrl-nomadik.c
+++ b/drivers/pinctrl/pinctrl-nomadik.c
@@ -1731,7 +1731,6 @@ static int __devinit nmk_pinctrl_probe(struct platform_device *pdev)
 	for (i = 0; i < npct->soc->gpio_num_ranges; i++) {
 		if (!nmk_gpio_chips[i]) {
 			dev_warn(&pdev->dev, "GPIO chip %d not registered yet\n", i);
-			devm_kfree(&pdev->dev, npct);
 			return -EPROBE_DEFER;
 		}
 		npct->soc->gpio_ranges[i].gc = &nmk_gpio_chips[i]->chip;

