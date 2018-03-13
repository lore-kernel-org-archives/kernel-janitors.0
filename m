From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 13 Mar 2018 14:54:03 +0000
Subject: [PATCH -next] crypto: fix missing unlock on error in safexcel_ahash_send_req()
Message-Id: <1520952843-68436-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add the missing unlock before return from function
safexcel_ahash_send_req() in the error handling case.

Fixes: cff9a17545a3 ("crypto: inside-secure - move cache result dma mapping to request")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/crypto/inside-secure/safexcel_hash.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/inside-secure/safexcel_hash.c b/drivers/crypto/inside-secure/safexcel_hash.c
index 77268c9..6e9eb9b 100644
--- a/drivers/crypto/inside-secure/safexcel_hash.c
+++ b/drivers/crypto/inside-secure/safexcel_hash.c
@@ -236,8 +236,10 @@ static int safexcel_ahash_send_req(struct crypto_async_request *async, int ring,
 	if (cache_len) {
 		req->cache_dma = dma_map_single(priv->dev, req->cache,
 						cache_len, DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->dev, req->cache_dma))
+		if (dma_mapping_error(priv->dev, req->cache_dma)) {
+			spin_unlock_bh(&priv->ring[ring].egress_lock);
 			return -EINVAL;
+		}
 
 		req->cache_sz = cache_len;
 		first_cdesc = safexcel_add_cdesc(priv, ring, 1,

