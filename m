From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 15:25:15 +0000
Subject: [PATCH 1/2] crypto: omap: Delete an error message for a failed memory allocation in three functions
Message-Id: <d6a0efa2-3056-de6f-269f-ddf5cdee62fb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <28780631-d093-a581-8690-3868f8fa327e@users.sourceforge.net>
In-Reply-To: <28780631-d093-a581-8690-3868f8fa327e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Joel Fernandes <joelf@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 16:00:33 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/crypto/omap-aes.c  | 5 ++---
 drivers/crypto/omap-des.c  | 5 ++---
 drivers/crypto/omap-sham.c | 1 -
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index fbec0a2e76dd..a2bac3b869b6 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -1040,10 +1040,9 @@ static int omap_aes_probe(struct platform_device *pdev)
 	u32 reg;
 
 	dd = devm_kzalloc(dev, sizeof(struct omap_aes_dev), GFP_KERNEL);
-	if (dd = NULL) {
-		dev_err(dev, "unable to alloc data struct.\n");
+	if (!dd)
 		goto err_data;
-	}
+
 	dd->dev = dev;
 	platform_set_drvdata(pdev, dd);
 
diff --git a/drivers/crypto/omap-des.c b/drivers/crypto/omap-des.c
index ebc5c0f11f03..f4199be783a9 100644
--- a/drivers/crypto/omap-des.c
+++ b/drivers/crypto/omap-des.c
@@ -964,10 +964,9 @@ static int omap_des_probe(struct platform_device *pdev)
 	u32 reg;
 
 	dd = devm_kzalloc(dev, sizeof(struct omap_des_dev), GFP_KERNEL);
-	if (dd = NULL) {
-		dev_err(dev, "unable to alloc data struct.\n");
+	if (!dd)
 		goto err_data;
-	}
+
 	dd->dev = dev;
 	platform_set_drvdata(pdev, dd);
 
diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 86b89ace836f..7aa4eb50ebc9 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -2024,7 +2024,6 @@ static int omap_sham_probe(struct platform_device *pdev)
 
 	dd = devm_kzalloc(dev, sizeof(struct omap_sham_dev), GFP_KERNEL);
 	if (dd = NULL) {
-		dev_err(dev, "unable to alloc data struct.\n");
 		err = -ENOMEM;
 		goto data_err;
 	}
-- 
2.16.1

