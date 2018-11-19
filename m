From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 19 Nov 2018 01:57:15 +0000
Subject: [PATCH -next] soc: qcom: llcc-slice: Remove duplicated include from llcc-slice.c
Message-Id: <1542592635-162455-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/soc/qcom/llcc-slice.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/llcc-slice.c b/drivers/soc/qcom/llcc-slice.c
index 6a7d016..80667f7 100644
--- a/drivers/soc/qcom/llcc-slice.c
+++ b/drivers/soc/qcom/llcc-slice.c
@@ -16,7 +16,6 @@
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/llcc-qcom.h>
-#include <linux/module.h>
 
 #define ACTIVATE                      BIT(0)
 #define DEACTIVATE                    BIT(1)
