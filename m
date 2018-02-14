From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 13:33:50 +0000
Subject: [PATCH 1/2] crypto: sahara: Delete an error message for a failed memory allocation in sahara_probe()
Message-Id: <0d8aa357-223d-56e2-1cbb-8113290ea1cf@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6a487cd1-c05c-3d5d-ec6b-a6a2ae376f05@users.sourceforge.net>
In-Reply-To: <6a487cd1-c05c-3d5d-ec6b-a6a2ae376f05@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 14:10:03 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/crypto/sahara.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/sahara.c b/drivers/crypto/sahara.c
index 08e7bdcaa6e3..9f3cdda59139 100644
--- a/drivers/crypto/sahara.c
+++ b/drivers/crypto/sahara.c
@@ -1398,10 +1398,8 @@ static int sahara_probe(struct platform_device *pdev)
 	int i;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(struct sahara_dev), GFP_KERNEL);
-	if (dev = NULL) {
-		dev_err(&pdev->dev, "unable to alloc data struct.\n");
+	if (!dev)
 		return -ENOMEM;
-	}
 
 	dev->device = &pdev->dev;
 	platform_set_drvdata(pdev, dev);
-- 
2.16.1

