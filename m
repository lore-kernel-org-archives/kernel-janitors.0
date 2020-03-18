From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 18 Mar 2020 02:00:40 +0000
Subject: [PATCH -next] crypto: ccree - remove duplicated include from cc_aead.c
Message-Id: <20200318020040.175704-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Ben-Yossef <gilad@benyossef.com>, Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net
Cc: YueHaibing <yuehaibing@huawei.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/ccree/cc_aead.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/ccree/cc_aead.c b/drivers/crypto/ccree/cc_aead.c
index 875fa79a03eb..1cf51edbc4b9 100644
--- a/drivers/crypto/ccree/cc_aead.c
+++ b/drivers/crypto/ccree/cc_aead.c
@@ -9,7 +9,6 @@
 #include <crypto/gcm.h>
 #include <linux/rtnetlink.h>
 #include <crypto/internal/des.h>
-#include <linux/rtnetlink.h>
 #include "cc_driver.h"
 #include "cc_buffer_mgr.h"
 #include "cc_aead.h"
