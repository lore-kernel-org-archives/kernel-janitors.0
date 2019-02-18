From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 12:29:29 +0000
Subject: [PATCH -next] staging: mt7621-mmc: Remove unused including <linux/version.h>
Message-Id: <20190218122929.82798-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, matthias.bgg@gmail.com, blogic@openwrt.org, ser.perschin@gmail.com, christian@lkamp.de, neil@brown.name, nishadkamdar@gmail.com
Cc: devel@driverdev.osuosl.org, YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/mt7621-mmc/dbg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/mt7621-mmc/dbg.c b/drivers/staging/mt7621-mmc/dbg.c
index eabe0595978b..c7c091fa1da0 100644
--- a/drivers/staging/mt7621-mmc/dbg.c
+++ b/drivers/staging/mt7621-mmc/dbg.c
@@ -36,7 +36,6 @@
  * Inc.
  */
 
-#include <linux/version.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/kthread.h>
