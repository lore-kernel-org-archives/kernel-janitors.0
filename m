From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 20:56:19 +0000
Subject: [PATCH 3/4] w1-masters: Delete an error message for a failed memory allocation in four functions
Message-Id: <aa0c09b1-8984-85d2-491f-80e11780409d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cb845ee0-0826-6a68-1246-0beab38129c1@users.sourceforge.net>
In-Reply-To: <cb845ee0-0826-6a68-1246-0beab38129c1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Evgeniy Polyakov <zbr@ioremap.net>, "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Sebastian Reichel <sre@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 21:40:29 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/w1/masters/ds2490.c    | 5 ++---
 drivers/w1/masters/matrox_w1.c | 7 +------
 drivers/w1/masters/omap_hdq.c  | 4 +---
 drivers/w1/masters/w1-gpio.c   | 4 +---
 4 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/w1/masters/ds2490.c b/drivers/w1/masters/ds2490.c
index 46ccb2fc4f60..c0ee6ca9ce93 100644
--- a/drivers/w1/masters/ds2490.c
+++ b/drivers/w1/masters/ds2490.c
@@ -998,7 +998,6 @@ static int ds_probe(struct usb_interface *intf,
-	if (!dev) {
-		pr_info("Failed to allocate new DS9490R structure.\n");
+	if (!dev)
 		return -ENOMEM;
-	}
+
 	dev->udev = usb_get_dev(udev);
 	if (!dev->udev) {
 		err = -ENOMEM;
diff --git a/drivers/w1/masters/matrox_w1.c b/drivers/w1/masters/matrox_w1.c
index d83d7c99d81d..62be2f9cdb4e 100644
--- a/drivers/w1/masters/matrox_w1.c
+++ b/drivers/w1/masters/matrox_w1.c
@@ -140,10 +140,5 @@ static int matrox_w1_probe(struct pci_dev *pdev, const struct pci_device_id *ent
-	if (!dev) {
-		dev_err(&pdev->dev,
-			"%s: Failed to create new matrox_device object.\n",
-			__func__);
+	if (!dev)
 		return -ENOMEM;
-	}
-
 
 	dev->bus_master = (struct w1_bus_master *)(dev + 1);
 
diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
index 83fc9aab34e8..6349fcd650dc 100644
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -669,7 +669,5 @@ static int omap_hdq_probe(struct platform_device *pdev)
-	if (!hdq_data) {
-		dev_dbg(&pdev->dev, "unable to allocate memory\n");
+	if (!hdq_data)
 		return -ENOMEM;
-	}
 
 	hdq_data->dev = dev;
 	platform_set_drvdata(pdev, hdq_data);
diff --git a/drivers/w1/masters/w1-gpio.c b/drivers/w1/masters/w1-gpio.c
index a90728ceec5a..6e8b18bf9fb1 100644
--- a/drivers/w1/masters/w1-gpio.c
+++ b/drivers/w1/masters/w1-gpio.c
@@ -133,7 +133,5 @@ static int w1_gpio_probe(struct platform_device *pdev)
-	if (!master) {
-		dev_err(&pdev->dev, "Out of memory\n");
+	if (!master)
 		return -ENOMEM;
-	}
 
 	err = devm_gpio_request(&pdev->dev, pdata->pin, "w1");
 	if (err) {
-- 
2.14.0

