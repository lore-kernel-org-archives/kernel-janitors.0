From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jun 2016 14:41:30 +0000
Subject: [patch] crypto: tcrypt - add a missing tab
Message-Id: <20160629144130.GC22818@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

The "goto out;" line isn't indented far enough.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/crypto/tcrypt.c b/crypto/tcrypt.c
index 6ef7815..117f19e 100644
--- a/crypto/tcrypt.c
+++ b/crypto/tcrypt.c
@@ -629,7 +629,7 @@ static void test_mb_ahash_speed(const char *algo, unsigned int sec,
 			printk(KERN_ERR
 				"template (%u) too big for tvmem (%lu)\n",
 					speed[i].blen, TVMEMSIZE * PAGE_SIZE);
-		goto out;
+			goto out;
 		}
 
 		if (speed[i].klen)
