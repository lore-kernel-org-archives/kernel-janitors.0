From: Colin King <colin.king@canonical.com>
Date: Thu, 16 Jul 2020 15:29:00 +0000
Subject: [PATCH] crypto: xts: use memmove to avoid overlapped memory copy
Message-Id: <20200716152900.1709694-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a memcpy that performs a potential overlapped memory copy
from source b to destination b + 1.  Fix this by using the safer
memmove instead.

Addresses-Coverity: ("Overlapping buffer in memory copy")
Fixes: 8083b1bf8163 ("crypto: xts - add support for ciphertext stealing")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 crypto/xts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/xts.c b/crypto/xts.c
index 3565f3b863a6..fa3e6e7b7043 100644
--- a/crypto/xts.c
+++ b/crypto/xts.c
@@ -169,7 +169,7 @@ static int cts_final(struct skcipher_request *req,
 				      offset - XTS_BLOCK_SIZE);
 
 	scatterwalk_map_and_copy(b, rctx->tail, 0, XTS_BLOCK_SIZE, 0);
-	memcpy(b + 1, b, tail);
+	memmove(b + 1, b, tail);
 	scatterwalk_map_and_copy(b, req->src, offset, tail, 0);
 
 	le128_xor(b, &rctx->t, b);
-- 
2.27.0
