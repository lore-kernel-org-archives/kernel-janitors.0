From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 30 Mar 2019 01:43:16 +0000
Subject: [PATCH -next] crypto: ccp - Use kmemdup in ccp_copy_and_save_keypart()
Message-Id: <20190330014316.174072-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Lendacky <thomas.lendacky@amd.com>, Gary Hook <gary.hook@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

Use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/ccp/ccp-crypto-rsa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/ccp/ccp-crypto-rsa.c b/drivers/crypto/ccp/ccp-crypto-rsa.c
index 0b8aab009e7b..841acdffbc3c 100644
--- a/drivers/crypto/ccp/ccp-crypto-rsa.c
+++ b/drivers/crypto/ccp/ccp-crypto-rsa.c
@@ -37,10 +37,9 @@ static inline int ccp_copy_and_save_keypart(u8 **kpbuf, unsigned int *kplen,
 		if (buf[nskip])
 			break;
 	*kplen = sz - nskip;
-	*kpbuf = kzalloc(*kplen, GFP_KERNEL);
+	*kpbuf = kmemdup(buf + nskip, *kplen, GFP_KERNEL);
 	if (!*kpbuf)
 		return -ENOMEM;
-	memcpy(*kpbuf, buf + nskip, *kplen);
 
 	return 0;
 }
