From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 12:23:58 +0000
Subject: [PATCH v5 1/2] mfd: dm355evm_msp: Refactoring for add_child()
Message-Id: <0e48a854-11dc-e4b5-e77c-b7f4ab36eb48@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80dc4486-01d1-df66-c9c2-b71ee2251251@users.sourceforge.net>
In-Reply-To: <80dc4486-01d1-df66-c9c2-b71ee2251251@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 13:30:32 +0200

Adjust jump targets according to the Linux coding style convention.
Another check for the variable "status" can be omitted then at the end.

Link: https://lkml.kernel.org/g/<20160628163146.GG29166@dell>
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v5: Rebased on the source files from Linux next-20160809.

v4: Adjustment of an error message at the end
    
    See also a change request for the module "twl-core" on 2016-06-08:
    https://lkml.kernel.org/g/<20160608111442.GB14888@dell>

v3: Deletion of another blank line as requested by Lee Jones

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
2.9.2

