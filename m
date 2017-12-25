From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 25 Dec 2017 21:02:03 +0000
Subject: [PATCH] pinctrl: xway: Delete two error messages for a failed memory allocation in pinmux_xway_probe
Message-Id: <0a27abb0-c222-765b-3a96-7e02163a0858@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, John Crispin <john@phrozen.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 25 Dec 2017 21:51:26 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-xway.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index f9e98a7d4f0c..cd0f402c1164 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1730,18 +1730,16 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 	xway_info.pads = devm_kzalloc(&pdev->dev,
 			sizeof(struct pinctrl_pin_desc) * xway_chip.ngpio,
 			GFP_KERNEL);
-	if (!xway_info.pads) {
-		dev_err(&pdev->dev, "Failed to allocate pads\n");
+	if (!xway_info.pads)
 		return -ENOMEM;
-	}
+
 	for (i = 0; i < xway_chip.ngpio; i++) {
 		/* strlen("ioXY") + 1 = 5 */
 		char *name = devm_kzalloc(&pdev->dev, 5, GFP_KERNEL);
 
-		if (!name) {
-			dev_err(&pdev->dev, "Failed to allocate pad name\n");
+		if (!name)
 			return -ENOMEM;
-		}
+
 		snprintf(name, 5, "io%d", i);
 		xway_info.pads[i].number = GPIO0 + i;
 		xway_info.pads[i].name = name;
-- 
2.15.1

