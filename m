From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 09 Jan 2019 06:11:18 +0000
Subject: [PATCH v2 -next] crypto: brcm - Fix some set-but-not-used warning
Message-Id: <1547014278-93847-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545968644-191671-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1545968644-191671-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@google.com>, Gilad Ben-Yossef <gilad@benyossef.com>, Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>, Stefan Agner <stefan@agner.ch>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/crypto/bcm/cipher.c: In function 'handle_ahash_req':
drivers/crypto/bcm/cipher.c:720:15: warning:
 variable 'chunk_start' set but not used [-Wunused-but-set-variable]

drivers/crypto/bcm/cipher.c: In function 'spu_rx_callback':
drivers/crypto/bcm/cipher.c:1679:31: warning:
 variable 'areq' set but not used [-Wunused-but-set-variable]

drivers/crypto/bcm/cipher.c:1678:22: warning:
 variable 'ctx' set but not used [-Wunused-but-set-variable]

Fixes: 9d12ba86f818 ("crypto: brcm - Add Broadcom SPU driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
---
v2: add Fixes tag
---
 drivers/crypto/bcm/cipher.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/crypto/bcm/cipher.c b/drivers/crypto/bcm/cipher.c
index c9393ff..9a66c29 100644
--- a/drivers/crypto/bcm/cipher.c
+++ b/drivers/crypto/bcm/cipher.c
@@ -717,7 +717,7 @@ static int handle_ahash_req(struct iproc_reqctx_s *rctx)
 	 */
 	unsigned int new_data_len;
 
-	unsigned int chunk_start = 0;
+	unsigned int __maybe_unused chunk_start = 0;
 	u32 db_size;	 /* Length of data field, incl gcm and hash padding */
 	int pad_len = 0; /* total pad len, including gcm, hash, stat padding */
 	u32 data_pad_len = 0;	/* length of GCM/CCM padding */
@@ -1675,8 +1675,6 @@ static void spu_rx_callback(struct mbox_client *cl, void *msg)
 	struct spu_hw *spu = &iproc_priv.spu;
 	struct brcm_message *mssg = msg;
 	struct iproc_reqctx_s *rctx;
-	struct iproc_ctx_s *ctx;
-	struct crypto_async_request *areq;
 	int err = 0;
 
 	rctx = mssg->ctx;
@@ -1686,8 +1684,6 @@ static void spu_rx_callback(struct mbox_client *cl, void *msg)
 		err = -EFAULT;
 		goto cb_finish;
 	}
-	areq = rctx->parent;
-	ctx = rctx->ctx;
 
 	/* process the SPU status */
 	err = spu->spu_status_process(rctx->msg_buf.rx_stat);
