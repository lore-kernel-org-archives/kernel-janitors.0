From: Julia Lawall <julia@diku.dk>
Date: Tue, 29 Apr 2008 14:18:08 +0000
Subject: Re: [revised PATCH] crypto: Correct kzalloc error test
Message-Id: <Pine.LNX.4.58.0804291617210.1185@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E1JqqUc-0005Rg-00@gondolin.me.apana.org.au>
In-Reply-To: <E1JqqUc-0005Rg-00@gondolin.me.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Normally, kzalloc returns NULL or a valid pointer value, not a value to be
tested using IS_ERR.

Signed-off-by: Julia Lawall <julia@diku.dk>
---
diff -u -p  a/crypto/cryptd.c b/crypto/cryptd.c
--- a/crypto/cryptd.c	2008-04-16 13:27:56.000000000 +0200
+++ b/crypto/cryptd.c	2008-04-29 16:13:10.000000000 +0200
@@ -190,8 +190,10 @@ static struct crypto_instance *cryptd_al
 	int err;

 	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
-	if (IS_ERR(inst))
+	if (!inst) {
+		inst = ERR_PTR(-ENOMEM);
 		goto out;
+	}

 	err = -ENAMETOOLONG;
 	if (snprintf(inst->alg.cra_driver_name, CRYPTO_MAX_ALG_NAME,
