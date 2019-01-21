From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 21 Jan 2019 07:57:00 +0000
Subject: [PATCH -next] crypto: seqiv - Use kmemdup in seqiv_aead_encrypt()
Message-Id: <1548057420-140382-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

Use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 crypto/seqiv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/crypto/seqiv.c b/crypto/seqiv.c
index 64a412b..ed1b0e9 100644
--- a/crypto/seqiv.c
+++ b/crypto/seqiv.c
@@ -89,13 +89,12 @@ static int seqiv_aead_encrypt(struct aead_request *req)
 
 	if (unlikely(!IS_ALIGNED((unsigned long)info,
 				 crypto_aead_alignmask(geniv) + 1))) {
-		info = kmalloc(ivsize, req->base.flags &
-				       CRYPTO_TFM_REQ_MAY_SLEEP ? GFP_KERNEL:
-								  GFP_ATOMIC);
+		info = kmemdup(req->iv, ivsize, req->base.flags &
+			       CRYPTO_TFM_REQ_MAY_SLEEP ? GFP_KERNEL :
+			       GFP_ATOMIC);
 		if (!info)
 			return -ENOMEM;
 
-		memcpy(info, req->iv, ivsize);
 		compl = seqiv_aead_encrypt_complete;
 		data = req;
 	}
