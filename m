From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 21 Feb 2019 01:32:55 +0000
Subject: [PATCH -next] media: rc: remove unused including <linux/version.h>
Message-Id: <20190221013255.156500-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lerda <patrick9876@free.fr>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/rc/ir-rcmm-decoder.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/rc/ir-rcmm-decoder.c b/drivers/media/rc/ir-rcmm-decoder.c
index f1096ac1e5c5..64fb65a9a19f 100644
--- a/drivers/media/rc/ir-rcmm-decoder.c
+++ b/drivers/media/rc/ir-rcmm-decoder.c
@@ -5,7 +5,6 @@
 
 #include "rc-core-priv.h"
 #include <linux/module.h>
-#include <linux/version.h>
 
 #define RCMM_UNIT		166667	/* nanosecs */
 #define RCMM_PREFIX_PULSE	416666  /* 166666.666666666*2.5 */
