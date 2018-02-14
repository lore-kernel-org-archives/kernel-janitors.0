From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 10:20:47 +0000
Subject: [PATCH 3/4] crypto: ux500: Adjust an error message in ux500_cryp_probe()
Message-Id: <93bfba75-2372-c20d-731e-d11dcb40dc3e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20dcb583-5455-b5b9-94df-db9d1e21931f@users.sourceforge.net>
In-Reply-To: <20dcb583-5455-b5b9-94df-db9d1e21931f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Geliang Tang <geliangtang@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 10:47:31 +0100

Replace the function name in this error message so that the same name
is mentioned according to what was called before.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/crypto/ux500/cryp/cryp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/ux500/cryp/cryp_core.c b/drivers/crypto/ux500/cryp/cryp_core.c
index 07cc92f88933..7c811d7eb274 100644
--- a/drivers/crypto/ux500/cryp/cryp_core.c
+++ b/drivers/crypto/ux500/cryp/cryp_core.c
@@ -1478,7 +1478,7 @@ static int ux500_cryp_probe(struct platform_device *pdev)
 	}
 
 	if (cryp_check(device_data)) {
-		dev_err(dev, "[%s]: cryp_init() failed!", __func__);
+		dev_err(dev, "[%s]: cryp_check() failed!", __func__);
 		ret = -EINVAL;
 		goto out_power;
 	}
-- 
2.16.1

