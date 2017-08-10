From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 10 Aug 2017 10:06:20 +0000
Subject: [PATCH 08/17] pinctrl: aspeed: g4: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Message-Id: <1502359589-15970-9-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

These structures are only stored in fields of a pinctrl_desc
structure (pctlops, and pmxops) that are const. Make the
structures const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index df56e58..05b1530 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2401,7 +2401,7 @@
 	.nconfigs = ARRAY_SIZE(aspeed_g4_configs),
 };
 
-static struct pinmux_ops aspeed_g4_pinmux_ops = {
+static const struct pinmux_ops aspeed_g4_pinmux_ops = {
 	.get_functions_count = aspeed_pinmux_get_fn_count,
 	.get_function_name = aspeed_pinmux_get_fn_name,
 	.get_function_groups = aspeed_pinmux_get_fn_groups,
@@ -2410,7 +2410,7 @@
 	.strict = true,
 };
 
-static struct pinctrl_ops aspeed_g4_pinctrl_ops = {
+static const struct pinctrl_ops aspeed_g4_pinctrl_ops = {
 	.get_groups_count = aspeed_pinctrl_get_groups_count,
 	.get_group_name = aspeed_pinctrl_get_group_name,
 	.get_group_pins = aspeed_pinctrl_get_group_pins,

