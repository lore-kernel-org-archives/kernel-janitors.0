From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 20:57:38 +0000
Subject: [PATCH 4/4] w1-masters: Improve a size determination in four functions
Message-Id: <1ed286dc-aa2f-8b84-e0d5-ed2f43faaa27@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cb845ee0-0826-6a68-1246-0beab38129c1@users.sourceforge.net>
In-Reply-To: <cb845ee0-0826-6a68-1246-0beab38129c1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Evgeniy Polyakov <zbr@ioremap.net>, "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Sebastian Reichel <sre@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 21:53:21 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/w1/masters/ds2482.c  | 3 ++-
 drivers/w1/masters/ds2490.c  | 2 +-
 drivers/w1/masters/mxc_w1.c  | 3 +--
 drivers/w1/masters/w1-gpio.c | 3 +--
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index d49681cd29af..7c3e25108285 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -451,7 +451,8 @@ static int ds2482_probe(struct i2c_client *client,
 				     I2C_FUNC_SMBUS_BYTE))
 		return -ENODEV;
 
-	if (!(data = kzalloc(sizeof(struct ds2482_data), GFP_KERNEL))) {
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data) {
 		err = -ENOMEM;
 		goto exit;
 	}
diff --git a/drivers/w1/masters/ds2490.c b/drivers/w1/masters/ds2490.c
index c0ee6ca9ce93..1e5b81490ffe 100644
--- a/drivers/w1/masters/ds2490.c
+++ b/drivers/w1/masters/ds2490.c
@@ -994,5 +994,5 @@ static int ds_probe(struct usb_interface *intf,
 	struct ds_device *dev;
 	int i, err, alt;
 
-	dev = kzalloc(sizeof(struct ds_device), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
diff --git a/drivers/w1/masters/mxc_w1.c b/drivers/w1/masters/mxc_w1.c
index 74f2e6e6202a..40a34942d07f 100644
--- a/drivers/w1/masters/mxc_w1.c
+++ b/drivers/w1/masters/mxc_w1.c
@@ -103,6 +103,5 @@ static int mxc_w1_probe(struct platform_device *pdev)
 	unsigned int clkdiv;
 	int err;
 
-	mdev = devm_kzalloc(&pdev->dev, sizeof(struct mxc_w1_device),
-			    GFP_KERNEL);
+	mdev = devm_kzalloc(&pdev->dev, sizeof(*mdev), GFP_KERNEL);
 	if (!mdev)
diff --git a/drivers/w1/masters/w1-gpio.c b/drivers/w1/masters/w1-gpio.c
index 6e8b18bf9fb1..a92eb1407f0f 100644
--- a/drivers/w1/masters/w1-gpio.c
+++ b/drivers/w1/masters/w1-gpio.c
@@ -128,6 +128,5 @@ static int w1_gpio_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	master = devm_kzalloc(&pdev->dev, sizeof(struct w1_bus_master),
-			GFP_KERNEL);
+	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
-- 
2.14.0

