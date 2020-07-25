From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 25 Jul 2020 06:34:40 +0000
Subject: [PATCH -next] crypto: sa2ul - fix wrong pointer passed to PTR_ERR()
Message-Id: <20200725063440.172238-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Keerthy <j-keerthy@ti.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

PTR_ERR should access the value just tested by IS_ERR, otherwise
the wrong error code will be returned.

Fixes: 7694b6ca649f ("crypto: sa2ul - Add crypto driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/crypto/sa2ul.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/sa2ul.c b/drivers/crypto/sa2ul.c
index ebcdffcdb686..5bc099052bd2 100644
--- a/drivers/crypto/sa2ul.c
+++ b/drivers/crypto/sa2ul.c
@@ -2259,7 +2259,7 @@ static int sa_dma_init(struct sa_crypto_data *dd)
 
 	dd->dma_tx = dma_request_chan(dd->dev, "tx");
 	if (IS_ERR(dd->dma_tx)) {
-		if (PTR_ERR(dd->dma_rx1) != -EPROBE_DEFER)
+		if (PTR_ERR(dd->dma_tx) != -EPROBE_DEFER)
 			dev_err(dd->dev, "Unable to request tx DMA channel\n");
 		ret = PTR_ERR(dd->dma_tx);
 		goto err_dma_tx;
