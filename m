From: Colin King <colin.king@canonical.com>
Date: Tue, 08 Oct 2019 08:24:28 +0000
Subject: [PATCH][V2][next] crypto: inside-secure: fix spelling mistake "algorithmn" -> "algorithm"
Message-Id: <20191008082428.19839-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antoine Tenart <antoine.tenart@bootlin.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it. Add in missing
newline.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Add in newline \n

---
 drivers/crypto/inside-secure/safexcel_cipher.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/inside-secure/safexcel_cipher.c b/drivers/crypto/inside-secure/safexcel_cipher.c
index cecc56073337..8ccc9c59f376 100644
--- a/drivers/crypto/inside-secure/safexcel_cipher.c
+++ b/drivers/crypto/inside-secure/safexcel_cipher.c
@@ -437,7 +437,7 @@ static int safexcel_aead_setkey(struct crypto_aead *ctfm, const u8 *key,
 			goto badkey;
 		break;
 	default:
-		dev_err(priv->dev, "aead: unsupported hash algorithmn");
+		dev_err(priv->dev, "aead: unsupported hash algorithm\n");
 		goto badkey;
 	}
 
-- 
2.20.1
