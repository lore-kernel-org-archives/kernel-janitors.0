From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Apr 2017 09:07:53 +0000
Subject: [PATCH 02/10] pinctrl: imx: Use devm_kcalloc() in two functions
Message-Id: <4c55e8b6-a904-408f-58c4-18f3053bb633@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
In-Reply-To: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Gary Bisson <gary.bisson@boundarydevices.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Apr 2017 14:13:00 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "devm_kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data types by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 563d24e7989d..975ed40cb774 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -509,10 +509,10 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 	}
 
 	grp->num_pins = size / pin_size;
-	grp->data = devm_kzalloc(info->dev, grp->num_pins *
+	grp->data = devm_kcalloc(info->dev, grp->num_pins,
 				 sizeof(struct imx_pin), GFP_KERNEL);
-	grp->pins = devm_kzalloc(info->dev, grp->num_pins *
-				 sizeof(unsigned int), GFP_KERNEL);
+	grp->pins = devm_kcalloc(info->dev, grp->num_pins,
+				 sizeof(*grp->pins), GFP_KERNEL);
 	if (!grp->pins || !grp->data)
 		return -ENOMEM;
 
@@ -581,9 +581,10 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		dev_err(info->dev, "no groups defined in %s\n", np->full_name);
 		return -EINVAL;
 	}
-	func->group_names = devm_kzalloc(info->dev,
-					 func->num_group_names *
-					 sizeof(char *), GFP_KERNEL);
+	func->group_names = devm_kcalloc(info->dev,
+					 func->num_group_names,
+					 sizeof(*func->group_names),
+					 GFP_KERNEL);
 
 	for_each_child_of_node(np, child) {
 		func->group_names[i] = child->name;
-- 
2.12.2

