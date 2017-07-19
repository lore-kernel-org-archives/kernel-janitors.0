From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 19 Jul 2017 21:47:57 +0000
Subject: [PATCH] crypto: ixp4xx - Fix error handling path in 'aead_perform()'
Message-Id: <20170719214757.29203-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net, arnd@arndb.de
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In commit 0f987e25cb8a, the source processing has been moved in front of
the destination processing, but the error handling path has not been
modified accordingly.
Free resources in the correct order to avoid some leaks.

Fixes: 0f987e25cb8a ("crypto: ixp4xx - Fix false lastlen uninitialised warning")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/ixp4xx_crypto.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/ixp4xx_crypto.c b/drivers/crypto/ixp4xx_crypto.c
index 427cbe012729..1ccbe15b5f16 100644
--- a/drivers/crypto/ixp4xx_crypto.c
+++ b/drivers/crypto/ixp4xx_crypto.c
@@ -1088,10 +1088,10 @@ static int aead_perform(struct aead_request *req, int encrypt,
 	BUG_ON(qmgr_stat_overflow(SEND_QID));
 	return -EINPROGRESS;
 
-free_buf_src:
-	free_buf_chain(dev, req_ctx->src, crypt->src_buf);
 free_buf_dst:
 	free_buf_chain(dev, req_ctx->dst, crypt->dst_buf);
+free_buf_src:
+	free_buf_chain(dev, req_ctx->src, crypt->src_buf);
 	crypt->ctl_flags = CTL_FLAG_UNUSED;
 	return -ENOMEM;
 }
-- 
2.11.0

