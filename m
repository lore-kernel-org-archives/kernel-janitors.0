From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 13:04:19 +0000
Subject: [PATCH] mfd-dm355evm_msp: One function call less in add_child() after error detection
Message-Id: <568284D3.3060006@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 13:56:42 +0100

The platform_device_put() function was called in one case by the
add_child() function during error handling even if the passed
variable "pdev" contained a null pointer.

Implementation details could be improved by the adjustment of jump targets
according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/dm355evm_msp.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
index bc90efe..e4aa1b8 100644
--- a/drivers/mfd/dm355evm_msp.c
+++ b/drivers/mfd/dm355evm_msp.c
@@ -202,7 +202,7 @@ static struct device *add_child(struct i2c_client *client, const char *name,
 	if (!pdev) {
 		dev_dbg(&client->dev, "can't alloc dev\n");
 		status = -ENOMEM;
-		goto err;
+		goto report_failure;
 	}
 
 	device_init_wakeup(&pdev->dev, can_wakeup);
@@ -212,7 +212,7 @@ static struct device *add_child(struct i2c_client *client, const char *name,
 		status = platform_device_add_data(pdev, pdata, pdata_len);
 		if (status < 0) {
 			dev_dbg(&pdev->dev, "can't add platform_data\n");
-			goto err;
+			goto put_device;
 		}
 	}
 
@@ -225,19 +225,18 @@ static struct device *add_child(struct i2c_client *client, const char *name,
 		status = platform_device_add_resources(pdev, &r, 1);
 		if (status < 0) {
 			dev_dbg(&pdev->dev, "can't add irq\n");
-			goto err;
+			goto put_device;
 		}
 	}
 
 	status = platform_device_add(pdev);
-
-err:
-	if (status < 0) {
-		platform_device_put(pdev);
-		dev_err(&client->dev, "can't add %s dev\n", name);
-		return ERR_PTR(status);
-	}
-	return &pdev->dev;
+	if (!status)
+		return &pdev->dev;
+put_device:
+	platform_device_put(pdev);
+report_failure:
+	dev_err(&client->dev, "can't add %s dev\n", name);
+	return ERR_PTR(status);
 }
 
 static int add_children(struct i2c_client *client)
-- 
2.6.3

