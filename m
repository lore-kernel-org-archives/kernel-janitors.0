From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 12 Oct 2009 05:45:44 +0000
Subject: [PATCH Resend] bt8xxgpio: Check gpiochip_remove() result
Message-Id: <1255326344.23361.4.camel@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Resending the patch, forgot about checkpatch.pl

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/gpio/bt8xxgpio.c |   33 +++++++++++++++++++--------------
 1 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/bt8xxgpio.c b/drivers/gpio/bt8xxgpio.c
index 2559f22..b4aa126 100644
--- a/drivers/gpio/bt8xxgpio.c
+++ b/drivers/gpio/bt8xxgpio.c
@@ -242,20 +242,25 @@ err_freebg:
 static void bt8xxgpio_remove(struct pci_dev *pdev)
 {
 	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
-
-	gpiochip_remove(&bg->gpio);
-
-	bgwrite(0, BT848_INT_MASK);
-	bgwrite(~0x0, BT848_INT_STAT);
-	bgwrite(0x0, BT848_GPIO_OUT_EN);
-
-	iounmap(bg->mmio);
-	release_mem_region(pci_resource_start(pdev, 0),
-			   pci_resource_len(pdev, 0));
-	pci_disable_device(pdev);
-
-	pci_set_drvdata(pdev, NULL);
-	kfree(bg);
+	int ret;
+
+	ret = gpiochip_remove(&bg->gpio);
+
+	if (!ret) {
+		bgwrite(0, BT848_INT_MASK);
+		bgwrite(~0x0, BT848_INT_STAT);
+		bgwrite(0x0, BT848_GPIO_OUT_EN);
+
+		iounmap(bg->mmio);
+		release_mem_region(pci_resource_start(pdev, 0),
+				   pci_resource_len(pdev, 0));
+		pci_disable_device(pdev);
+
+		pci_set_drvdata(pdev, NULL);
+		kfree(bg);
+	} else
+		dev_err(&pdev->dev, "Failed to remove the GPIO controller:
+			%d\n", ret);
 }
 
 #ifdef CONFIG_PM
-- 
1.6.0.4





