From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 10 Aug 2017 10:06:29 +0000
Subject: [PATCH 17/17] pinctrl: vt8500: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Message-Id: <1502359589-15970-18-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/pinctrl/vt8500/pinctrl-wmt.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index 974e646..d73956b 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -163,7 +163,7 @@ static int wmt_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinmux_ops wmt_pinmux_ops = {
+static const struct pinmux_ops wmt_pinmux_ops = {
 	.get_functions_count = wmt_pmx_get_functions_count,
 	.get_function_name = wmt_pmx_get_function_name,
 	.get_function_groups = wmt_pmx_get_function_groups,
@@ -409,7 +409,7 @@ static int wmt_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return err;
 }
 
-static struct pinctrl_ops wmt_pctl_ops = {
+static const struct pinctrl_ops wmt_pctl_ops = {
 	.get_groups_count = wmt_get_groups_count,
 	.get_group_name	= wmt_get_group_name,
 	.get_group_pins	= wmt_get_group_pins,
@@ -472,7 +472,7 @@ static int wmt_pinconf_set(struct pinctrl_dev *pctldev, unsigned pin,
 	return 0;
 }
 
-static struct pinconf_ops wmt_pinconf_ops = {
+static const struct pinconf_ops wmt_pinconf_ops = {
 	.pin_config_get = wmt_pinconf_get,
 	.pin_config_set = wmt_pinconf_set,
 };

