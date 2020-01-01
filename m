From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 07:43:32 +0000
Subject: [PATCH 14/16] pinctrl: qcom: ssbi-gpio: constify copied structure
Message-Id: <1577864614-5543-15-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Andy Gross <agross@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The pm8xxx_pinctrl_desc structure is only copied into another
structure, so make it const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index dca86886b1f9..c7912135bbfb 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -439,7 +439,7 @@ static const struct pinconf_ops pm8xxx_pinconf_ops = {
 	.pin_config_group_set = pm8xxx_pin_config_set,
 };
 
-static struct pinctrl_desc pm8xxx_pinctrl_desc = {
+static const struct pinctrl_desc pm8xxx_pinctrl_desc = {
 	.name = "pm8xxx_gpio",
 	.pctlops = &pm8xxx_pinctrl_ops,
 	.pmxops = &pm8xxx_pinmux_ops,
