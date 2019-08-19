From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 19 Aug 2019 05:18:33 +0000
Subject: [PATCH] crypto: picoxcell - Fix the name of the module in the description of CRYPTO_DEV_PICOXCELL
Message-Id: <20190819051833.6622-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The help section says that the module will be called 'pipcoxcell_crypto'.
This is likely a typo.
Use 'picoxcell_crypto' instead

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index b8c50871f11b..2305416c2393 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -393,7 +393,7 @@ config CRYPTO_DEV_PICOXCELL
 	  Picochip picoXcell SoC devices. Select this for IPSEC ESP offload
 	  and for 3gpp Layer 2 ciphering support.
 
-	  Saying m here will build a module named pipcoxcell_crypto.
+	  Saying m here will build a module named picoxcell_crypto.
 
 config CRYPTO_DEV_SAHARA
 	tristate "Support for SAHARA crypto accelerator"
-- 
2.20.1
