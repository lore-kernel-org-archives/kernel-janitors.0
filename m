From: Colin King <colin.king@canonical.com>
Date: Wed, 23 Oct 2019 11:48:24 +0000
Subject: [PATCH] crypto: mediatek: remove redundant bitwise-or
Message-Id: <20191023114824.30509-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Vic Wu <vic.wu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Bitwise-or'ing 0xffffffff with the u32 variable ctr is the same result
as assigning the value to ctr.  Remove the redundant bitwise-or and
just use an assignment.

Addresses-Coverity: ("Suspicious &= or |= constant expression")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/mediatek/mtk-aes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/mediatek/mtk-aes.c b/drivers/crypto/mediatek/mtk-aes.c
index 90c9644fb8a8..d43410259113 100644
--- a/drivers/crypto/mediatek/mtk-aes.c
+++ b/drivers/crypto/mediatek/mtk-aes.c
@@ -591,7 +591,7 @@ static int mtk_aes_ctr_transfer(struct mtk_cryp *cryp, struct mtk_aes_rec *aes)
 	start = ctr;
 	end = start + blocks - 1;
 	if (end < start) {
-		ctr |= 0xffffffff;
+		ctr = 0xffffffff;
 		datalen = AES_BLOCK_SIZE * -start;
 		fragmented = true;
 	}
-- 
2.20.1
