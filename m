From: Julia Lawall <julia@diku.dk>
Date: Tue, 29 Apr 2008 13:38:15 +0000
Subject: [PATCH] crypto: Correct kzalloc error test
Message-Id: <Pine.LNX.4.58.0804291536220.1185@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Normally, kzalloc returns NULL or a valid pointer value, not a value to be
tested using IS_ERR.

Signed-off-by: Julia Lawall <julia@diku.dk>
---
diff -u -p  a/crypto/cryptd.c b/crypto/cryptd.c
--- a/crypto/cryptd.c	2008-04-16 13:27:56.000000000 +0200
+++ b/crypto/cryptd.c	2008-04-29 15:29:54.000000000 +0200
@@ -190,7 +190,7 @@ static struct crypto_instance *cryptd_al
 	int err;

 	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
-	if (IS_ERR(inst))
+	if (!inst)
 		goto out;

 	err = -ENAMETOOLONG;
