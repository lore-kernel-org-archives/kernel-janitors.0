From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 07 Jan 2017 06:32:15 +0000
Subject: [patch] pinctrl/amd: white space cleanups in amd_gpio_dbg_show()
Message-Id: <20170107063214.GE26959@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Shah@elgon.mountain, Nehal-bakulchandra <Nehal-Bakulchandra.shah@amd.com>, Ken Xue <Ken.Xue@amd.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally deleted two tabs from the first line, but even with that
fixed the conditions were not really kernel style.  Put the && at the
end of the line so we can align the condition clauses.  Also add spaces
around the "+" operator.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 7b95c1886f7b..249aa5e83419 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -216,14 +216,14 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 			if (pin_reg & BIT(INTERRUPT_ENABLE_OFF)) {
 				interrupt_enable = "interrupt is enabled|";
 
-		if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF))
-				&& !(pin_reg & BIT(ACTIVE_LEVEL_OFF+1)))
+				if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF)) &&
+				    !(pin_reg & BIT(ACTIVE_LEVEL_OFF + 1)))
 					active_level = "Active low|";
-				else if (pin_reg & BIT(ACTIVE_LEVEL_OFF)
-				&& !(pin_reg & BIT(ACTIVE_LEVEL_OFF+1)))
+				else if (pin_reg & BIT(ACTIVE_LEVEL_OFF) &&
+					 !(pin_reg & BIT(ACTIVE_LEVEL_OFF + 1)))
 					active_level = "Active high|";
-				else if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF))
-					&& pin_reg & BIT(ACTIVE_LEVEL_OFF+1))
+				else if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF)) &&
+					 pin_reg & BIT(ACTIVE_LEVEL_OFF + 1))
 					active_level = "Active on both|";
 				else
 					active_level = "Unknow Active level|";
