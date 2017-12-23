From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 23 Dec 2017 20:30:04 +0000
Subject: [PATCH] pinctrl: palmas: Delete an error message for a failed memory allocation in palmas_pinctrl_pr
Message-Id: <acda9837-523a-2f49-f7ba-b5e60eb8371e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 23 Dec 2017 21:16:42 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-palmas.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-palmas.c b/drivers/pinctrl/pinctrl-palmas.c
index 4d6a5015b927..d42f18cb1bc7 100644
--- a/drivers/pinctrl/pinctrl-palmas.c
+++ b/drivers/pinctrl/pinctrl-palmas.c
@@ -1012,10 +1012,8 @@ static int palmas_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	pci = devm_kzalloc(&pdev->dev, sizeof(*pci), GFP_KERNEL);
-	if (!pci) {
-		dev_err(&pdev->dev, "Malloc for pci failed\n");
+	if (!pci)
 		return -ENOMEM;
-	}
 
 	pci->dev = &pdev->dev;
 	pci->palmas = dev_get_drvdata(pdev->dev.parent);
-- 
2.15.1

