From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Apr 2020 22:49:47 +0000
Subject: [PATCH] crypto: chelsio: remove redundant assignment to variable error
Message-Id: <20200415224947.1565311-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ayush Sawal <ayush.sawal@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable error is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/chelsio/chcr_algo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index c29b80dd30d8..5d3000fdd5f4 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -1757,7 +1757,7 @@ static int chcr_ahash_final(struct ahash_request *req)
 	struct uld_ctx *u_ctx = ULD_CTX(h_ctx(rtfm));
 	struct chcr_context *ctx = h_ctx(rtfm);
 	u8 bs = crypto_tfm_alg_blocksize(crypto_ahash_tfm(rtfm));
-	int error = -EINVAL;
+	int error;
 	unsigned int cpu;
 
 	cpu = get_cpu();
-- 
2.25.1
