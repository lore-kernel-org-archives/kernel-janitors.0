From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 10 Aug 2017 10:06:13 +0000
Subject: [PATCH 01/17] pinctrl: bcm281xx: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Message-Id: <1502359589-15970-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

This pinconf_ops structure is only stored in the const confops
field of a pinctrl_desc structure. Make the pinconf_ops structure
const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index a7cceff..bc3b232 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -1384,7 +1384,7 @@ static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinconf_ops bcm281xx_pinctrl_pinconf_ops = {
+static const struct pinconf_ops bcm281xx_pinctrl_pinconf_ops = {
 	.pin_config_get = bcm281xx_pinctrl_pin_config_get,
 	.pin_config_set = bcm281xx_pinctrl_pin_config_set,
 };

