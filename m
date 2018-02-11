From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Feb 2018 12:42:13 +0000
Subject: [PATCH] gpio: merrifield: Delete an error message for a failed memory allocation in mrfld_gpio_probe
Message-Id: <d73420c9-60ee-ab28-e881-299441815afc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Feb 2018 13:30:14 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-merrifield.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index dd67a31ac337..eec21122299e 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -408,10 +408,8 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	pcim_iounmap_regions(pdev, BIT(1));
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		dev_err(&pdev->dev, "can't allocate chip data\n");
+	if (!priv)
 		return -ENOMEM;
-	}
 
 	priv->dev = &pdev->dev;
 	priv->reg_base = pcim_iomap_table(pdev)[0];
-- 
2.16.1

