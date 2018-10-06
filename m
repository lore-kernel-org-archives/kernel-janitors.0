From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 06 Oct 2018 07:36:02 +0000
Subject: [PATCH -next] media: imx-pxp: remove duplicated include from imx-pxp.c
Message-Id: <1538811362-80425-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/platform/imx-pxp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
index b76cd0e..229c23a 100644
--- a/drivers/media/platform/imx-pxp.c
+++ b/drivers/media/platform/imx-pxp.c
@@ -16,7 +16,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/sched.h>
