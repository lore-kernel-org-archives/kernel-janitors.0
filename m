From: Colin King <colin.king@canonical.com>
Date: Sat, 14 Nov 2020 12:12:27 +0000
Subject: [PATCH] crypto: fix a couple of spelling mistakes in Kconfig files
Message-Id: <20201114121227.416572-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of spelling mistakes in two crypto Kconfig files.
Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/Kconfig           | 2 +-
 drivers/crypto/allwinner/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 37da0c070a88..129bbdc4993b 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -648,7 +648,7 @@ choice
 	default CRYPTO_DEV_QCE_ENABLE_ALL
 	depends on CRYPTO_DEV_QCE
 	help
-	  This option allows to choose whether to build support for all algorihtms
+	  This option allows to choose whether to build support for all algorithms
 	  (default), hashes-only, or skciphers-only.
 
 	  The QCE engine does not appear to scale as well as the CPU to handle
diff --git a/drivers/crypto/allwinner/Kconfig b/drivers/crypto/allwinner/Kconfig
index 0cdfe0e8cc66..180c8a9db819 100644
--- a/drivers/crypto/allwinner/Kconfig
+++ b/drivers/crypto/allwinner/Kconfig
@@ -43,7 +43,7 @@ config CRYPTO_DEV_SUN8I_CE
 	depends on CRYPTO_DEV_ALLWINNER
 	depends on PM
 	help
-	  Select y here to have support for the crypto Engine availlable on
+	  Select y here to have support for the crypto Engine available on
 	  Allwinner SoC H2+, H3, H5, H6, R40 and A64.
 	  The Crypto Engine handle AES/3DES ciphers in ECB/CBC mode.
 
-- 
2.28.0
