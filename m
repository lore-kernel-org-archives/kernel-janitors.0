From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Mar 2016 09:03:43 +0000
Subject: [patch] crypto: marvell/cesa - remove unneeded condition
Message-Id: <20160321090342.GB31670@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Arnaud Ebalard <arno@natisbad.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

creq->cache[] is an array inside the struct, it's not a pointer and it
can't be NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/marvell/hash.c b/drivers/crypto/marvell/hash.c
index 7ca2e0f..7a5058d 100644
--- a/drivers/crypto/marvell/hash.c
+++ b/drivers/crypto/marvell/hash.c
@@ -768,8 +768,7 @@ static int mv_cesa_ahash_export(struct ahash_request *req, void *hash,
 	*len = creq->len;
 	memcpy(hash, creq->state, digsize);
 	memset(cache, 0, blocksize);
-	if (creq->cache)
-		memcpy(cache, creq->cache, creq->cache_ptr);
+	memcpy(cache, creq->cache, creq->cache_ptr);
 
 	return 0;
 }
