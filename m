From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 28 Aug 2019 08:07:40 +0000
Subject: [PATCH v2 -next] crypto: hisilicon: select CRYPTO_LIB_DES while compiling SEC driver
Message-Id: <20190828080740.43244-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <affd8de1-ae35-a1d0-534a-d9cdfac90de8@huawei.com>
In-Reply-To: <affd8de1-ae35-a1d0-534a-d9cdfac90de8@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net, jonathan.cameron@huawei.com, wangzhou1@hisilicon.com, liguozhu@hisilicon.com, john.garry@huawei.com, Jonathan.Cameron@huawei.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

When CRYPTO_DEV_HISI_SEC=y, below compilation error is found after 
'commit 894b68d8be4b ("crypto: hisilicon/des - switch to new verification routines")':

drivers/crypto/hisilicon/sec/sec_algs.o: In function `sec_alg_skcipher_setkey_des_cbc':
sec_algs.c:(.text+0x11f0): undefined reference to `des_expand_key'
drivers/crypto/hisilicon/sec/sec_algs.o: In function `sec_alg_skcipher_setkey_des_ecb':
sec_algs.c:(.text+0x1390): undefined reference to `des_expand_key'
make: *** [vmlinux] Error 1

This because DES library has been moved to lib/crypto in this commit 
'04007b0e6cbb ("crypto: des - split off DES library from generic DES cipher driver")'.
Fix this by selecting CRYPTO_LIB_DES in CRYPTO_DEV_HISI_SEC.

Fixes: 04007b0e6cbb ("crypto: des - split off DES library from generic DES cipher driver")
Fixes: 894b68d8be4b ("crypto: hisilicon/des - switch to new verification routines")

Signed-off-by: Mao Wenan <maowenan@huawei.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 v2: remove fix tag 915e4e8413da ("crypto: hisilicon - SEC security accelerator driver") 
 drivers/crypto/hisilicon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/hisilicon/Kconfig b/drivers/crypto/hisilicon/Kconfig
index fa8aa06..ebaf91e 100644
--- a/drivers/crypto/hisilicon/Kconfig
+++ b/drivers/crypto/hisilicon/Kconfig
@@ -4,6 +4,7 @@ config CRYPTO_DEV_HISI_SEC
 	tristate "Support for Hisilicon SEC crypto block cipher accelerator"
 	select CRYPTO_BLKCIPHER
 	select CRYPTO_ALGAPI
+	select CRYPTO_LIB_DES
 	select SG_SPLIT
 	depends on ARM64 || COMPILE_TEST
 	depends on HAS_IOMEM
-- 
2.7.4
