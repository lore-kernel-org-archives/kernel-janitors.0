From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 12:26:44 +0000
Subject: [PATCH v5 2/2] mfd: dm355evm_msp: Change error messages in add_child()
Message-Id: <5e0c3af5-5efd-2e7e-020a-5c7304131cc1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80dc4486-01d1-df66-c9c2-b71ee2251251@users.sourceforge.net>
In-Reply-To: <80dc4486-01d1-df66-c9c2-b71ee2251251@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 14:00:43 +0200

Delete an error message at the end while increasing the importance of
related information.

Link: https://lkml.kernel.org/g/<20160809153615.GU5243@dell>
Suggested-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v5: Rebased on the source files from Linux next-20160809.

    Requested changes were applied.

 drivers/mfd/dm355evm_msp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
index 86eca61..463f9e2e 100644
--- a/drivers/mfd/dm355evm_msp.c
+++ b/drivers/mfd/dm355evm_msp.c
@@ -208,7 +208,7 @@ static struct device *add_child(struct i2c_client *client, const char *name,
 	if (pdata) {
 		status = platform_device_add_data(pdev, pdata, pdata_len);
 		if (status < 0) {
-			dev_dbg(&pdev->dev, "can't add platform_data\n");
+			dev_err(&pdev->dev, "can't add platform_data\n");
 			goto put_device;
 		}
 	}
@@ -221,7 +221,7 @@ static struct device *add_child(struct i2c_client *client, const char *name,
 
 		status = platform_device_add_resources(pdev, &r, 1);
 		if (status < 0) {
-			dev_dbg(&pdev->dev, "can't add irq\n");
+			dev_err(&pdev->dev, "can't add irq\n");
 			goto put_device;
 		}
 	}
@@ -234,7 +234,6 @@ static struct device *add_child(struct i2c_client *client, const char *name,
 
 put_device:
 	platform_device_put(pdev);
-	dev_err(&client->dev, "failed to add device %s\n", name);
 	return ERR_PTR(status);
 }
 
-- 
2.9.2

