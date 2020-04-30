From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 30 Apr 2020 08:13:53 +0000
Subject: [PATCH -next] crypto: drbg - fix error return code in drbg_alloc_state()
Message-Id: <20200430081353.112449-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Stephan Mueller <smueller@chronox.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return negative error code -ENOMEM from the kzalloc error handling
case instead of 0, as done elsewhere in this function.

Fixes: db07cd26ac6a ("crypto: drbg - add FIPS 140-2 CTRNG for noise source")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 crypto/drbg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/crypto/drbg.c b/crypto/drbg.c
index e57901d8545b..37526eb8c5d5 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -1306,8 +1306,10 @@ static inline int drbg_alloc_state(struct drbg_state *drbg)
 	if (IS_ENABLED(CONFIG_CRYPTO_FIPS)) {
 		drbg->prev = kzalloc(drbg_sec_strength(drbg->core->flags),
 				     GFP_KERNEL);
-		if (!drbg->prev)
+		if (!drbg->prev) {
+			ret = -ENOMEM;
 			goto fini;
+		}
 		drbg->fips_primed = false;
 	}
