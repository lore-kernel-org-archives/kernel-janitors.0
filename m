From: Colin King <colin.king@canonical.com>
Date: Mon, 01 Jul 2019 13:08:14 +0000
Subject: [PATCH][next] crypto: ccree - fix spelling mistake "configration" -> "configuration"
Message-Id: <20190701130814.14251-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Ben-Yossef <gilad@benyossef.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/ccree/cc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_driver.c
index 980aa04b655b..eeb803f40623 100644
--- a/drivers/crypto/ccree/cc_driver.c
+++ b/drivers/crypto/ccree/cc_driver.c
@@ -421,7 +421,7 @@ static int init_cc_resources(struct platform_device *plat_dev)
 			}
 			break;
 		default:
-			dev_err(dev, "Unsupported engines configration.\n");
+			dev_err(dev, "Unsupported engines configuration.\n");
 			rc = -EINVAL;
 			goto post_clk_err;
 		}
-- 
2.20.1
