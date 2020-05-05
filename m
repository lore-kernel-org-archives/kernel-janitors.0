From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 05 May 2020 10:12:00 +0000
Subject: [PATCH -next] crypto: xilinx - Remove set but not used variable 'drv_ctx'
Message-Id: <20200505101200.195184-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Michal Simek <michal.simek@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rajan Vaja <rajan.vaja@xilinx.com>, Kalyani Akula <kalyani.akula@xilinx.com>, Jolly Shah <jolly.shah@xilinx.com>
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/crypto/xilinx/zynqmp-aes-gcm.c: In function 'zynqmp_aes_aead_cipher':
drivers/crypto/xilinx/zynqmp-aes-gcm.c:83:30: warning:
 variable 'drv_ctx' set but not used [-Wunused-but-set-variable]

commit bc86f9c54616 ("firmware: xilinx: Remove eemi ops for aes engine") left
behind this, remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/xilinx/zynqmp-aes-gcm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/crypto/xilinx/zynqmp-aes-gcm.c b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
index d0a0daf3ea08..9a342932b7f3 100644
--- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
+++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
@@ -79,8 +79,6 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 	struct zynqmp_aead_tfm_ctx *tfm_ctx = crypto_aead_ctx(aead);
 	struct zynqmp_aead_req_ctx *rq_ctx = aead_request_ctx(req);
 	struct device *dev = tfm_ctx->dev;
-	struct aead_alg *alg = crypto_aead_alg(aead);
-	struct zynqmp_aead_drv_ctx *drv_ctx;
 	struct zynqmp_aead_hw_req *hwreq;
 	dma_addr_t dma_addr_data, dma_addr_hw_req;
 	unsigned int data_size;
@@ -89,8 +87,6 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 	char *kbuf;
 	int err;
 
-	drv_ctx = container_of(alg, struct zynqmp_aead_drv_ctx, alg.aead);
-
 	if (tfm_ctx->keysrc = ZYNQMP_AES_KUP_KEY)
 		dma_size = req->cryptlen + ZYNQMP_AES_KEY_SIZE
 			   + GCM_AES_IV_SIZE;
