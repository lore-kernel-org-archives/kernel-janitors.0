From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 01 Jul 2016 17:29:24 +0000
Subject: [PATCH v4] mfd: dm355evm_msp: Refactoring for add_child()
Message-Id: <4dcb4cab-e2cc-87c0-9cfc-d140f185254b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>

Adjust jump targets according to the Linux coding style convention.
Another check for the variable "status" can be omitted then at the end.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
v4: Further feedback was integrated into this message.
v3: Deletion of another blank line
v2: Rebasing

 drivers/mfd/dm355evm_msp.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
index 270e19c..86eca61 100644
--- a/drivers/mfd/dm355evm_msp.c
+++ b/drivers/mfd/dm355evm_msp.c
@@ -209,7 +209,7 @@ static struct device *add_child(struct i2c_client *client, const char *name,
 		status = platform_device_add_data(pdev, pdata, pdata_len);
 		if (status < 0) {
 			dev_dbg(&pdev->dev, "can't add platform_data\n");
-			goto err;
+			goto put_device;
 		}
 	}
 
@@ -222,19 +222,20 @@ static struct device *add_child(struct i2c_client *client, const char *name,
 		status = platform_device_add_resources(pdev, &r, 1);
 		if (status < 0) {
 			dev_dbg(&pdev->dev, "can't add irq\n");
-			goto err;
+			goto put_device;
 		}
 	}
 
 	status = platform_device_add(pdev);
+	if (status)
+		goto put_device;
 
-err:
-	if (status < 0) {
-		platform_device_put(pdev);
-		dev_err(&client->dev, "can't add %s dev\n", name);
-		return ERR_PTR(status);
-	}
 	return &pdev->dev;
+
+put_device:
+	platform_device_put(pdev);
+	dev_err(&client->dev, "failed to add device %s\n", name);
+	return ERR_PTR(status);
 }
 
 static int add_children(struct i2c_client *client)
-- 
2.9.0

