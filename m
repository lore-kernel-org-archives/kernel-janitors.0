From: Dan Carpenter <error27@gmail.com>
Date: Thu, 15 Jul 2010 07:57:36 +0000
Subject: [patch] crypto/ablkcipher: missing return statement
Message-Id: <20100715075736.GC5164@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Richard Hartmann <richih.mailinglist@gmail.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

The intent was to return here.  In the original an allocation failure
would lead to a NULL dereference.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/crypto/ablkcipher.c b/crypto/ablkcipher.c
index 98a6610..a854df2 100644
--- a/crypto/ablkcipher.c
+++ b/crypto/ablkcipher.c
@@ -165,7 +165,7 @@ static inline int ablkcipher_next_slow(struct ablkcipher_request *req,
 
 	p = kmalloc(n, GFP_ATOMIC);
 	if (!p)
-		ablkcipher_walk_done(req, walk, -ENOMEM);
+		return ablkcipher_walk_done(req, walk, -ENOMEM);
 
 	base = p + 1;
 
