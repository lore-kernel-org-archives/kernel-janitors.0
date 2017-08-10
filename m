From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 10 Aug 2017 10:06:21 +0000
Subject: [PATCH 09/17] pinctrl: aspeed: g5: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Message-Id: <1502359589-15970-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

These structures are only stored in fields of a pinctrl_desc
structure (confops, pctlops, and pmxops) that are const. Make the
structures const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 634b371..187abd7 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2492,7 +2492,7 @@
 	.nconfigs = ARRAY_SIZE(aspeed_g5_configs),
 };
 
-static struct pinmux_ops aspeed_g5_pinmux_ops = {
+static const struct pinmux_ops aspeed_g5_pinmux_ops = {
 	.get_functions_count = aspeed_pinmux_get_fn_count,
 	.get_function_name = aspeed_pinmux_get_fn_name,
 	.get_function_groups = aspeed_pinmux_get_fn_groups,
@@ -2501,7 +2501,7 @@
 	.strict = true,
 };
 
-static struct pinctrl_ops aspeed_g5_pinctrl_ops = {
+static const struct pinctrl_ops aspeed_g5_pinctrl_ops = {
 	.get_groups_count = aspeed_pinctrl_get_groups_count,
 	.get_group_name = aspeed_pinctrl_get_group_name,
 	.get_group_pins = aspeed_pinctrl_get_group_pins,
@@ -2510,7 +2510,7 @@
 	.dt_free_map = pinctrl_utils_free_map,
 };
 
-static struct pinconf_ops aspeed_g5_conf_ops = {
+static const struct pinconf_ops aspeed_g5_conf_ops = {
 	.is_generic = true,
 	.pin_config_get = aspeed_pin_config_get,
 	.pin_config_set = aspeed_pin_config_set,

