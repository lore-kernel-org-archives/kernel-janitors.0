From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Sep 2020 09:45:28 +0000
Subject: [PATCH] crypto: sa2ul - Fix pm_runtime_get_sync() error checking
Message-Id: <20200909094528.GB420136@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

The pm_runtime_get_sync() function returns either 0 or 1 on success but
this code treats a return of 1 as a failure.

Fixes: 7694b6ca649f ("crypto: sa2ul - Add crypto driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/crypto/sa2ul.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/sa2ul.c b/drivers/crypto/sa2ul.c
index acabb8ddacb6..604798c65e85 100644
--- a/drivers/crypto/sa2ul.c
+++ b/drivers/crypto/sa2ul.c
@@ -2333,7 +2333,7 @@ static int sa_ul_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(&pdev->dev, "%s: failed to get sync: %d\n", __func__,
 			ret);
 		return ret;
-- 
2.28.0
