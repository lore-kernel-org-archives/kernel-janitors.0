From: Dan Carpenter <error27@gmail.com>
Date: Sun, 21 Mar 2010 09:28:47 +0000
Subject: [patch] pcrypt: handle crypto_get_attr_type() errors
Message-Id: <20100321092847.GJ5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Steffen Klassert <steffen.klassert@secunet.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

crypto_get_attr_type() can returns ERR_PTRs if there is a problem. 

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/crypto/pcrypt.c b/crypto/pcrypt.c
index 8020124..41bd80f 100644
--- a/crypto/pcrypt.c
+++ b/crypto/pcrypt.c
@@ -322,6 +322,8 @@ static struct crypto_instance *pcrypt_alloc_aead(struct rtattr **tb)
 	struct crypto_attr_type *algt;
 
 	algt = crypto_get_attr_type(tb);
+	if (IS_ERR(algt))
+		return ERR_CAST(algt);
 
 	alg = crypto_get_attr_alg(tb, algt->type,
 				  (algt->mask & CRYPTO_ALG_TYPE_MASK));
