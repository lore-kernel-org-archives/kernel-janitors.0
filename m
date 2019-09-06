From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 06 Sep 2019 12:25:02 +0000
Subject: [PATCH -next] crypto: essiv - Remove unnecessary NULL checks
Message-Id: <20190906122502.27236-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>

NULL check before kfree is not needed.
Generated-by: scripts/coccinelle/free/ifnullfree.cocci

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 crypto/essiv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/crypto/essiv.c b/crypto/essiv.c
index a8befc8..3d3f9d7 100644
--- a/crypto/essiv.c
+++ b/crypto/essiv.c
@@ -188,8 +188,7 @@ static void essiv_aead_done(struct crypto_async_request *areq, int err)
 	struct aead_request *req = areq->data;
 	struct essiv_aead_request_ctx *rctx = aead_request_ctx(req);
 
-	if (rctx->assoc)
-		kfree(rctx->assoc);
+	kfree(rctx->assoc);
 	aead_request_complete(req, err);
 }
 
-- 
2.7.4
