From: Colin King <colin.king@canonical.com>
Date: Thu, 18 Jun 2020 10:16:25 +0000
Subject: [PATCH] crypto: img-hash: remove redundant initialization of variable err
Message-Id: <20200618101625.11986-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/img-hash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/img-hash.c b/drivers/crypto/img-hash.c
index 0e25fc3087f3..87226b7c2795 100644
--- a/drivers/crypto/img-hash.c
+++ b/drivers/crypto/img-hash.c
@@ -330,7 +330,7 @@ static int img_hash_write_via_dma(struct img_hash_dev *hdev)
 static int img_hash_dma_init(struct img_hash_dev *hdev)
 {
 	struct dma_slave_config dma_conf;
-	int err = -EINVAL;
+	int err;
 
 	hdev->dma_lch = dma_request_chan(hdev->dev, "tx");
 	if (IS_ERR(hdev->dma_lch)) {
-- 
2.27.0.rc0
