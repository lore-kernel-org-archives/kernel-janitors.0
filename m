From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 10 Jun 2017 12:54:33 +0000
Subject: [PATCH] crypto: crypto4xx - fix an error code
Message-Id: <20170610125433.26294-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'kzalloc' fails, we return 0 which means success.
return -ENOMEM instead as already done a few lines above.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/amcc/crypto4xx_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/amcc/crypto4xx_core.c b/drivers/crypto/amcc/crypto4xx_core.c
index fdc83a2281ca..65dc78b91dea 100644
--- a/drivers/crypto/amcc/crypto4xx_core.c
+++ b/drivers/crypto/amcc/crypto4xx_core.c
@@ -1179,6 +1179,7 @@ static int crypto4xx_probe(struct platform_device *ofdev)
 	dev_set_drvdata(dev, core_dev);
 	core_dev->ofdev = ofdev;
 	core_dev->dev = kzalloc(sizeof(struct crypto4xx_device), GFP_KERNEL);
+	rc = -ENOMEM;
 	if (!core_dev->dev)
 		goto err_alloc_dev;
 
-- 
2.11.0

