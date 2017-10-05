From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Oct 2017 10:23:56 +0000
Subject: [PATCH] pinctrl: sx150x: make struct sx150x_regmap_config static
Message-Id: <20171005102356.29944-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure sx150x_regmap_config is local to the source and does not
need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'sx150x_regmap_config' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 7450f5118445..c5ab8cef942d 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1087,7 +1087,7 @@ static bool sx150x_reg_volatile(struct device *dev, unsigned int reg)
 	return reg = pctl->data->reg_irq_src || reg = pctl->data->reg_data;
 }
 
-const struct regmap_config sx150x_regmap_config = {
+static const struct regmap_config sx150x_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 32,
 
-- 
2.14.1

