From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:27 +0000
Subject: [PATCH 17/18] crypto: atmel-tdes - use semicolons rather than commas to separate statements
Message-Id: <1601233948-11629-18-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-crypto@vger.kernel.org, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/crypto/atmel-tdes.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index ed40dbb98c6b..4d63cb13a54f 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -912,7 +912,7 @@ static void atmel_tdes_skcipher_alg_init(struct skcipher_alg *alg)
 {
 	alg->base.cra_priority = ATMEL_TDES_PRIORITY;
 	alg->base.cra_flags = CRYPTO_ALG_ASYNC;
-	alg->base.cra_ctxsize = sizeof(struct atmel_tdes_ctx),
+	alg->base.cra_ctxsize = sizeof(struct atmel_tdes_ctx);
 	alg->base.cra_module = THIS_MODULE;
 
 	alg->init = atmel_tdes_init_tfm;
