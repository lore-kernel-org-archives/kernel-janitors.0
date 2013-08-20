From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Aug 2013 08:51:41 +0000
Subject: [patch] crypto: sahara - checking the wrong variable
Message-Id: <20130820085141.GA7469@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.hengli.com.au>
Cc: "David S. Miller" <davem@davemloft.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo here.  "dev->hw_link[]" is an array, not a pointer, so
the check is nonsense.  We should be checking recently allocated
"dev->hw_link[0]" instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/sahara.c b/drivers/crypto/sahara.c
index b076d81..d7bb8ba 100644
--- a/drivers/crypto/sahara.c
+++ b/drivers/crypto/sahara.c
@@ -955,7 +955,7 @@ static int sahara_probe(struct platform_device *pdev)
 	dev->hw_link[0] = dma_alloc_coherent(&pdev->dev,
 			SAHARA_MAX_HW_LINK * sizeof(struct sahara_hw_link),
 			&dev->hw_phys_link[0], GFP_KERNEL);
-	if (!dev->hw_link) {
+	if (!dev->hw_link[0]) {
 		dev_err(&pdev->dev, "Could not allocate hw links\n");
 		err = -ENOMEM;
 		goto err_link;
