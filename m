From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Jan 2020 14:38:04 +0000
Subject: [PATCH] crypto: rng - Fix a refcounting bug in crypto_rng_reset()
Message-Id: <20200120143804.pbmnrh72v2gogx43@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Horman <nhorman@tuxdriver.com>, Corentin Labbe <clabbe@baylibre.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to decrement this refcounter on these error paths.

Fixes: f7d76e05d058 ("crypto: user - fix use_after_free of struct xxx_request")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 crypto/rng.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/crypto/rng.c b/crypto/rng.c
index 1e21231f71c9..1490d210f1a1 100644
--- a/crypto/rng.c
+++ b/crypto/rng.c
@@ -37,12 +37,16 @@ int crypto_rng_reset(struct crypto_rng *tfm, const u8 *seed, unsigned int slen)
 	crypto_stats_get(alg);
 	if (!seed && slen) {
 		buf = kmalloc(slen, GFP_KERNEL);
-		if (!buf)
+		if (!buf) {
+			crypto_alg_put(alg);
 			return -ENOMEM;
+		}
 
 		err = get_random_bytes_wait(buf, slen);
-		if (err)
+		if (err) {
+			crypto_alg_put(alg);
 			goto out;
+		}
 		seed = buf;
 	}
 
-- 
2.11.0
